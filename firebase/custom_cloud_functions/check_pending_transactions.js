const admin = require("firebase-admin");

const axios = require("axios");

const crypto = require("crypto");

const moment = require("moment");

const base64 = require("js-base64");

const db = admin.firestore();

const secretKey = "5ex6I3H184Ux9CAS";

const login = "2b9e3fde4c2ec23dde87f36f02101ab6";

function createAuth() {
  const seed = moment().format();

  const rawNonce = Math.random().toString(36).substring(2);

  const nonce = base64.encode(rawNonce);

  const sha1Hash = crypto
    .createHash("sha1")
    .update(rawNonce + seed + secretKey)
    .digest();

  const tranKey = Buffer.from(sha1Hash).toString("base64");

  return { login, tranKey, nonce, seed };
}

async function verifyPaymentStatus(requestId) {
  try {
    const auth = createAuth();

    const response = await axios.post(
      `https://checkout.avalpaycenter.com/api/session/${requestId}`,
      { auth },
    );

    return response.data;
  } catch (error) {
    console.error("Error verifying payment session:", error);

    throw new Error("Payment verification failed");
  }
}

exports.checkPendingTransactions = async (context) => {
  try {
    console.log("Checking REJECTED transactions...");

    const twentyFourHoursAgo = admin.firestore.Timestamp.fromDate(
      new Date(Date.now() - 24 * 60 * 60 * 1000),
    );

    const rejectedTransactionsSnapshot = await db
      .collection("transactions")

      .where("status", "==", "REJECTED")

      .where("transactionType", "==", "Depositado")

      .where("firebaseDate", ">", twentyFourHoursAgo)

      .get();

    if (rejectedTransactionsSnapshot.empty) {
      console.log("No REJECTED transactions found.");

      return null;
    }

    console.log(
      `Found ${rejectedTransactionsSnapshot.size} REJECTED transactions to check`,
    );

    const updatePromises = rejectedTransactionsSnapshot.docs.map(
      async (doc) => {
        const transactionData = doc.data();

        const requestId = transactionData.requestId;

        const revalidationCount = transactionData.revalidationCount || 0;

        if (revalidationCount >= 2) {
          console.log(
            `Transaction ${doc.id} exceeded max revalidation attempts (2)`,
          );

          await doc.ref.update({
            status: "DEFINITIVELY_REJECTED",

            lastChecked: admin.firestore.Timestamp.now(),

            finalReason: "Exceeded maximum revalidation attempts",
          });

          return;
        }

        try {
          console.log(
            `Checking transaction ${doc.id} - Attempt ${revalidationCount + 1}/2`,
          );

          const paymentSession = await verifyPaymentStatus(requestId);

          const transactionStatus = paymentSession.status.status;

          const authorizationNumber =
            transactionStatus === "APPROVED" || transactionStatus === "REJECTED"
              ? paymentSession.payment?.[0]?.authorization || "-"
              : "-";

          const issuerName =
            transactionStatus === "APPROVED"
              ? paymentSession.payment?.[0]?.issuerName || "-"
              : "-";

          const reason = paymentSession.status.reason || "-";

          const dateFromPSE = paymentSession.status.date;

          const messageFromPSE = paymentSession.status.message;

          let updatedStatus;

          console.log(
            `PlaceToPay reports status: ${transactionStatus} for transaction ${doc.id}`,
          );

          if (transactionStatus === "APPROVED") {
            updatedStatus = "APPROVED";

            console.log(
              `🎉 Transaction ${doc.id} is now APPROVED! Processing payment...`,
            );

            const userAccounts = transactionData.userAccounts;

            const empresaId = transactionData.empresaId;

            const batch = db.batch();

            if (empresaId) {
              for (const account of userAccounts) {
                const ahorrosId = account.ahorrosID;

                const amountToAdd = account.amount;

                const newTransaction = {
                  ahorrosId: ahorrosId,

                  amount: amountToAdd,

                  status: "APPROVED",

                  transactionType: "Depositado",

                  firebaseDate: admin.firestore.Timestamp.now(),

                  date: new Date().toISOString(),

                  description: "Depósito asociado (revalidado)",

                  paymentMethod: "PSE",

                  authorization: authorizationNumber,

                  bank: issuerName,

                  reason: reason,

                  message: messageFromPSE,

                  dateFromPSE: new Date(dateFromPSE),

                  empresaId: empresaId,
                  subPayment: true,
                  wasRevalidated: true,
                  revalidatedFrom: "REJECTED",
                  revalidationAttempt: revalidationCount + 1,
                };

                await db.collection("transactions").add(newTransaction);
                console.log(
                  `New transaction created for ahorrosId: ${ahorrosId}`,
                );

                const ahorrosRef = db.collection("ahorros").doc(ahorrosId);
                batch.update(ahorrosRef, {
                  TotalSavingValue:
                    admin.firestore.FieldValue.increment(amountToAdd),
                  montoTotal: admin.firestore.FieldValue.increment(amountToAdd),
                  totalDeposits:
                    admin.firestore.FieldValue.increment(amountToAdd),
                  lastDeposit: new Date(dateFromPSE),
                });
              }
            } else if (userAccounts && userAccounts.length === 1) {
              const account = userAccounts[0];
              const ahorrosId = account.ahorrosID;
              const amountToAdd = account.amount;

              const ahorrosRef = db.collection("ahorros").doc(ahorrosId);
              batch.update(ahorrosRef, {
                TotalSavingValue:
                  admin.firestore.FieldValue.increment(amountToAdd),
                montoTotal: admin.firestore.FieldValue.increment(amountToAdd),
                totalDeposits:
                  admin.firestore.FieldValue.increment(amountToAdd),
                lastDeposit: new Date(dateFromPSE),
              });

              console.log(
                `Ahorros document updated for ahorrosId: ${ahorrosId}`,
              );
            }

            await batch.commit();
            console.log(
              "Batch update for all ahorros documents committed successfully.",
            );

            await doc.ref.update({
              status: updatedStatus,
              lastChecked: admin.firestore.Timestamp.now(),
              authorization: authorizationNumber,
              bank: issuerName,
              reason: reason,
              message: messageFromPSE,
              dateFromPSE: new Date(dateFromPSE),
              revalidationCount: admin.firestore.FieldValue.increment(1),
              wasRevalidated: true,
              revalidatedFrom: "REJECTED",
              revalidationAttempt: revalidationCount + 1,
            });
          } else if (transactionStatus === "PENDING") {
            updatedStatus = "PENDING";
            console.log(
              `Transaction ${doc.id} changed to PENDING, will continue monitoring`,
            );

            await doc.ref.update({
              status: updatedStatus,
              lastChecked: admin.firestore.Timestamp.now(),
              revalidationCount: admin.firestore.FieldValue.increment(1),
            });
          } else {
            updatedStatus = "REJECTED";
            console.log(`Transaction ${doc.id} still ${transactionStatus}`);

            await doc.ref.update({
              status: updatedStatus,
              lastChecked: admin.firestore.Timestamp.now(),
              authorization: authorizationNumber,
              bank: issuerName,
              reason: reason,
              message: messageFromPSE,
              dateFromPSE: new Date(dateFromPSE),
              revalidationCount: admin.firestore.FieldValue.increment(1),
            });
          }

          console.log(
            `✅ Updated transaction ${doc.id} to status: ${updatedStatus} (attempt ${revalidationCount + 1}/2)`,
          );
        } catch (error) {
          console.error(
            `❌ Error checking transaction ${doc.id}:`,
            error.message,
          );

          await doc.ref.update({
            revalidationCount: admin.firestore.FieldValue.increment(1),
            lastChecked: admin.firestore.Timestamp.now(),
            lastError: error.message,
          });
        }
      },
    );

    await Promise.all(updatePromises);
    console.log("✅ All REJECTED transactions have been checked and updated.");
    return null;
  } catch (error) {
    console.error("❌ Error in checkPendingTransactions:", error);
    throw error;
  }
};
