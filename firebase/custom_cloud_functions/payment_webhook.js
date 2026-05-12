const functions = require("firebase-functions");
const admin = require("firebase-admin");
const crypto = require("crypto");

const axios = require("axios");

const moment = require("moment"); // Moment for date formatting

const base64 = require("js-base64"); // Base64 encoding

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore(); // Get a Firestore instance

// Replace with your actual PlaceToPay credentials

const secretKey = "5ex6I3H184Ux9CAS"; // actual secret key

//const secretKey = "GxJ91Mc1FUS80uSc"; //Test secret Key

const login = "2b9e3fde4c2ec23dde87f36f02101ab6"; // actual login

//const login = "310153102941dd49621f2e247ca05d14"; //Test Login

// Helper function to create authentication object for PlaceToPay

function createAuth() {
  const seed = moment().format(); // ISO string format

  const rawNonce = Math.random().toString(36).substring(2); // Alphanumeric string

  const nonce = base64.encode(rawNonce); // Base64 encoding of nonce

  // Create tranKey using SHA1 and Base64

  const sha1Hash = crypto
    .createHash("sha1")
    .update(rawNonce + seed + secretKey)
    .digest();

  const tranKey = Buffer.from(sha1Hash).toString("base64");

  return {
    login,

    tranKey,

    nonce,

    seed,
  };
}

// Function to verify payment session with PlaceToPay

async function verifyPaymentSession(requestId) {
  try {
    const auth = createAuth();

    const response = await axios.post(
      `https://checkout.avalpaycenter.com/api/session/${requestId}`,
      {
        auth,
      },
    );

    return response.data; // Returns the data, including transaction status and details
  } catch (error) {
    console.error("Error verifying payment session:", error);

    throw new Error("Payment verification failed");
  }
}

// Function to verify PlaceToPay's notification signature

function verifySignature(requestId, status, signature) {
  const message = requestId + status.status + status.date + secretKey;

  const expectedSignature = crypto
    .createHash("sha1")
    .update(message)
    .digest("hex");

  return expectedSignature === signature;
}

exports.paymentWebhook = functions
  .region("europe-central2")

  .runWith({
    memory: "256MB",

    timeoutSeconds: 540,
  })

  .https.onRequest(async (req, res) => {
    try {
      if (req.method !== "POST") {
        return res.status(405).send("Method Not Allowed");
      }

      console.log("Received payment notification:", req.body);
      const { requestId, status, signature } = req.body;

      if (!verifySignature(requestId, status, signature)) {
        console.log("Unauthorized: Invalid signature");
        return res.status(401).send("Unauthorized: Invalid signature");
      }

      // Verify payment session with PlaceToPay
      const paymentSession = await verifyPaymentSession(requestId);
      const transactionStatus = paymentSession.status.status;
      const authorizationNumber =
        transactionStatus === "APPROVED" || transactionStatus === "REJECTED"
          ? paymentSession.payment?.[0]?.authorization || "-"
          : "-";
      const issuerName =
        transactionStatus === "APPROVED"
          ? paymentSession.payment[0]?.issuerName || "-"
          : "-";
      const reason = paymentSession.status.reason;
      const dateFromPSE = paymentSession.status.date;
      const messageFromPSE = paymentSession.status.message;

      // Find the corresponding transaction in Firestore using requestId
      const transactionsRef = db.collection("transactions");
      const snapshot = await transactionsRef
        .where("requestId", "==", requestId)
        .limit(1)
        .get();

      if (snapshot.empty) {
        console.log("No matching transaction found for requestId:", requestId);
        return res.status(404).send("Transaction not found");
      }

      const transactionDoc = snapshot.docs[0];
      const transactionData = transactionDoc.data();
      const userAccounts = transactionData.userAccounts;
      const empresaId = transactionData.empresaId;
      //const bank = transactionData.bank;

      if (transactionData.status === "APPROVED") {
        console.log(
          "Transaction already approved, skipping userAccounts processing.",
        );
        await transactionDoc.ref.update({
          lastUpdate: admin.firestore.Timestamp.now(),
        });
        return res.status(200).send("Transaction already approved");
      }

      // Proceed with processing if the transaction status is not APPROVED
      await transactionDoc.ref.update({
        status: transactionStatus,
        lastUpdate: admin.firestore.Timestamp.now(),
        authorization: authorizationNumber,
        bank: issuerName,
        reason: reason,
        message: messageFromPSE,
        dateFromPSE: new Date(dateFromPSE),
      });

      console.log(
        `Transaction document updated with status: ${transactionStatus}`,
      );

      // Only proceed with additional updates if status is APPROVED
      if (transactionStatus === "APPROVED") {
        const batch = db.batch();

        if (empresaId) {
          // For multiple user accounts, create new transaction documents
          for (const account of userAccounts) {
            const ahorrosId = account.ahorrosID;
            const amountToAdd = account.amount;

            // Create a new transaction document
            const newTransaction = {
              ahorrosId: ahorrosId,
              amount: amountToAdd,
              status: transactionStatus,
              transactionType: "Depositado",
              firebaseDate: admin.firestore.Timestamp.now(),
              date: new Date().toISOString(),
              description: "Depósito asociado",

              paymentMethod: "PSE",
              bank: issuerName,
              authorization: authorizationNumber,
              reason: reason,
              message: messageFromPSE,
              dateFromPSE: new Date(dateFromPSE),
              empresaId: empresaId,
              subPayment: true,
            };

            await db.collection("transactions").add(newTransaction);
            console.log(`New transaction created for ahorrosId: ${ahorrosId}`);

            // Update ahorros document
            const ahorrosRef = db.collection("ahorros").doc(ahorrosId);
            batch.update(ahorrosRef, {
              TotalSavingValue:
                admin.firestore.FieldValue.increment(amountToAdd),
              montoTotal: admin.firestore.FieldValue.increment(amountToAdd),
              totalDeposits: admin.firestore.FieldValue.increment(amountToAdd),
              //Total_Savings_PreApproval: 0,
              lastDeposit: new Date(dateFromPSE),
            });
          }
        } else {
          // For a single user account, update the ahorros document
          const account = userAccounts[0];
          const ahorrosId = account.ahorrosID;
          const amountToAdd = account.amount;

          const ahorrosRef = db.collection("ahorros").doc(ahorrosId);
          batch.update(ahorrosRef, {
            TotalSavingValue: admin.firestore.FieldValue.increment(amountToAdd),
            montoTotal: admin.firestore.FieldValue.increment(amountToAdd),
            totalDeposits: admin.firestore.FieldValue.increment(amountToAdd),
            //Total_Savings_PreApproval: 0,
            lastDeposit: new Date(dateFromPSE),
          });

          console.log(`Ahorros document updated for ahorrosId: ${ahorrosId}`);
        }

        await batch.commit();
        console.log(
          "Batch update for all ahorros documents committed successfully",
        );
      }

      res.status(200).send("Webhook processed successfully");
    } catch (error) {
      console.error("Error processing the webhook:", error);
      res.status(500).send("Internal Server Error");
    }
  });
