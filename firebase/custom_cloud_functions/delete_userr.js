const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Ensure Firebase Admin is initialized

exports.deleteUserr = functions
  .region("europe-central2")
  .runWith({
    memory: "128MB",
  })
  .https.onCall(async (data, context) => {
    const uid = data.uid;

    if (!uid) {
      return "Invalid argument: UID must be provided.";
    }
    try {
      // Delete the user from Firebase Authentication
      await admin.auth().deleteUser(uid);

      // Delete the user's Firestore document
      const userDocRef = admin.firestore().collection("user").doc(uid);
      await userDocRef.delete();

      // Return null on successful deletion
      return null;
    } catch (error) {
      console.error("Error deleting user:", error);
      // Return the error message if the operation fails
      //throw new functions.https.HttpsError('internal', error.message);
      return `Error: ${error.message}`;
    }
  });
