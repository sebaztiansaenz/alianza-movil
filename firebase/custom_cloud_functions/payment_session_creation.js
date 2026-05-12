const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const crypto = require("crypto");

// Note: Replace these with your actual PlaceToPay credentials
const placeToPayLogin = "2b9e3fde4c2ec23dde87f36f02101ab6"; // actual login
//const placeToPayLogin = "310153102941dd49621f2e247ca05d14"; //Test Login
const secretKey = "5ex6I3H184Ux9CAS"; // actual secret key
//const secretKey = "GxJ91Mc1FUS80uSc"; //Test secret Key

exports.paymentSessionCreation = functions
  .region("europe-central2")
  .runWith({
    memory: "256MB", // Memory allocation setting
  })
  .https.onCall(async (data, context) => {
    const amount = data.amount;
    const currency = data.currency;
    const paymentReference = data.paymentReference || `ref-${Date.now()}`;
    const description = data.description;
    const returnURL = data.returnURL;
    const userAgent = data.userAgent; // Passed from the client
    const ipAddress = data.ipAddress; // Passed from the client

    // Ensure that required parameters are provided
    if (
      !amount ||
      !currency ||
      !description ||
      !returnURL ||
      !userAgent ||
      !ipAddress
    ) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "The function must be called with amount, currency, description, returnURL, userAgent, and ipAddress arguments.",
      );
    }

    // Generate the nonce, seed, and tranKey for authentication
    const seed = new Date().toISOString();
    const rawNonce = Math.floor(Math.random() * 1000000);
    const nonce = Buffer.from(rawNonce.toString()).toString("base64");
    const tranKeyDigest = Buffer.from(
      crypto
        .createHash("sha256")
        .update(rawNonce + seed + secretKey)
        .digest(),
      "binary",
    ).toString("base64");

    // Prepare the payload for the PlaceToPay API request
    const payload = {
      auth: {
        login: placeToPayLogin,
        tranKey: tranKeyDigest,
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
      expiration: new Date(new Date().getTime() + 20 * 60 * 1000).toISOString(), // 20 minutes expiration
      returnUrl: returnURL,
      ipAddress: ipAddress, // Passed from the client
      userAgent: userAgent, // Passed from the client
    };

    try {
      // Make the API request to PlaceToPay
      const response = await axios.post(
        "https://checkout.avalpaycenter.com/api/session",
        payload,
        {
          headers: {
            "Content-Type": "application/json",
          },
        },
      );

      // Check if the request was successful
      if (
        response.data &&
        response.data.status &&
        response.data.status.status === "OK"
      ) {
        // Return only the processUrl as a string
        return response.data.processUrl;
      } else {
        throw new Error("Failed to create payment session");
      }
    } catch (error) {
      console.error("Error creating payment session:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Unable to create payment session.",
      );
    }
  });
