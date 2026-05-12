const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const crypto = require("crypto");
const moment = require("moment");
const base64 = require("js-base64");

// Helper function to create authentication object for PlaceToPay
function createAuth() {
  const secretKey = "5ex6I3H184Ux9CAS"; // actual secret key
  //const secretKey = "GxJ91Mc1FUS80uSc"; //Test secret Key
  const login = "2b9e3fde4c2ec23dde87f36f02101ab6"; // actual login
  //const login = "310153102941dd49621f2e247ca05d14"; //Test Login
  const seed = moment().format();
  const rawNonce = Math.random().toString(36).substring(2);
  const nonce = base64.encode(rawNonce);

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
async function verifyPaymentStatus(requestId) {
  try {
    const auth = createAuth();
    const response = await axios.post(
      `https://checkout.goupagos.com.co/api/session/${requestId}`,
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

exports.checkPaymentStatus = functions
  .region("europe-central2")
  .runWith({
    memory: "128MB",
  })
  .https.onCall(async (data, context) => {
    const requestId = data.requestId;

    try {
      // Verify payment status using the provided requestId
      const paymentSession = await verifyPaymentStatus(requestId);
      const transactionStatus = paymentSession.status.status;

      // Return only the status as a string
      return transactionStatus;
    } catch (error) {
      console.error("Error verifying payment status:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Unable to verify payment status.",
      );
    }
  });
