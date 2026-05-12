const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const crypto = require("crypto");
const moment = require("moment"); // Moment for date formatting
const base64 = require("js-base64"); // Base64 encoding

// Initialize Firebase Admin SDK if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore(); // Get a Firestore instance

// Replace with your actual PlaceToPay credentials
const placeToPayLogin = "2b9e3fde4c2ec23dde87f36f02101ab6"; // actual login
//const placeToPayLogin = "310153102941dd49621f2e247ca05d14"; //Test Login
const secretKey = "5ex6I3H184Ux9CAS"; // actual secret key
//const secretKey = "GxJ91Mc1FUS80uSc"; //Test secret Key

// Define the maximum amount limit based on PlaceToPay documentation
//const MAX_AMOUNT = 5000000; // Example maximum amount, replace with actual limit

exports.createPaymentSessionWeb = functions
  .region("europe-central2")
  .runWith({
    memory: "128MB", // Memory allocation setting
  })
  .https.onCall(async (data, context) => {
    try {
      // Log incoming data
      console.log("Received data:", data);

      const amount = data.amount;
      const currency = data.currency;
      const paymentReference = data.paymentReference || `ref-${Date.now()}`;
      const description = data.description;
      let returnURL = data.returnURL;
      const userAgent = data.userAgent; // Passed from the client
      const ipAddress = data.ipAddress; // Passed from the client
      const userAccounts = data.userAccounts; // Passed array of user accounts
      const buyer = data.buyer; // buyer's info
      const buyerId = data.userId;
      const ahorrosId = data.ahorrosId;
      const bank = data.bank;

      // Validate required parameters
      if (
        !amount ||
        !currency ||
        !description ||
        !returnURL ||
        !userAgent ||
        !ipAddress ||
        !userAccounts
      ) {
        return "Error: Missing required parameters.";
      }

      // Validate amount
      //if (amount <= 1000 || amount > MAX_AMOUNT) {

      if (amount < 10000) {
        return `Error: The amount ${amount} is not within the allowed range.`;
      }

      if (returnURL.endsWith("Web")) {
        returnURL = `${returnURL}?paymentRef=${paymentReference}`;
      }

      // Generate the nonce, seed, and tranKey for authentication
      const seed = moment().format(); // ISO string format
      const rawNonce = Math.random().toString(36).substring(2); // Alphanumeric string
      const nonce = base64.encode(rawNonce); // Base64 encoding of nonce

      // Create tranKey using SHA1 and Base64
      const sha1Hash = crypto
        .createHash("sha1")
        .update(rawNonce + seed + secretKey)
        .digest();
      const tranKey = Buffer.from(sha1Hash).toString("base64");

      // Log the generated authentication details
      console.log("Generated authentication details:", {
        seed,
        nonce,
        tranKey,
      });

      // Prepare the payload for the PlaceToPay API request
      const payload = {
        locale: "es_CO",
        auth: {
          login: placeToPayLogin,
          tranKey: tranKey,
          nonce: nonce,
          seed: seed,
        },
        payment: {
          reference: paymentReference,
          description,
          amount: {
            currency,
            total: amount,
          },
        },
        expiration: moment().add(12, "minutes").toISOString(), // 12 minutes expiration
        returnUrl: returnURL,
        ipAddress: ipAddress, // Passed from the client
        userAgent: userAgent, // Passed from the client
        buyer: buyer,
      };

      // Log the prepared payload
      console.log("Payload to be sent:", payload);

      // Make the API request to PlaceToPay
      //const response = await axios.post("https://checkout.test.goupagos.com.co/api/session", payload, {
      const response = await axios.post(
        "https://checkout.goupagos.com.co/api/session",
        payload,
        {
          headers: {
            "Content-Type": "application/json",
          },
        },
      );

      // Log the response data
      console.log("API response data:", response.data);

      // Check if the request was successful
      if (
        response.data &&
        response.data.status &&
        response.data.status.status === "OK"
      ) {
        // Prepare transaction data to be saved, including userAccounts
        const transactionData = {
          processUrl: response.data.processUrl,
          referenceId: paymentReference,
          amount: amount,
          currency: currency,
          description: description,
          buyerId: buyerId,
          transactionType: "Depositado",
          //status: response.data.status.status,
          status: "PENDING",
          ahorrosId: ahorrosId,
          date: new Date().toISOString(),
          firebaseDate: admin.firestore.Timestamp.now(),
          requestId: response.data.requestId,
          bank: bank,
          userAccounts: userAccounts, // Save the userAccounts array
        };

        // Save transaction details to Firestore
        await db
          .collection("transactions")
          .doc(paymentReference)
          .set(transactionData);
        console.log(
          "Transaction details saved to Firestore with paymentReference as document ID:",
          transactionData,
        );

        // await db.collection('transactions').add(transactionData);
        // console.log('Transaction details saved to Firestore:', transactionData);

        // Return only the processUrl as a string
        return response.data.processUrl;
      } else {
        console.error("API response indicates failure:", response.data);
        return `Error: Failed to create payment session. Response: ${JSON.stringify(response.data)}`;
      }
    } catch (error) {
      // Log the error and return it as a string
      console.error("Error during createPaymentSession execution:", error);

      if (error.response) {
        // Axios error with response data (e.g., non-2xx response)
        console.error("Error response:", error.response.data);
        return `Error: PlaceToPay API responded with an error. Response: ${JSON.stringify(error.response.data)}`;
      } else if (error.request) {
        // Axios error with no response received (e.g., network error)
        return "Error: No response received from PlaceToPay API. Check network connectivity.";
      } else {
        // General error
        return `Error: An unexpected error occurred. Details: ${error.message}`;
      }
    }
  });
