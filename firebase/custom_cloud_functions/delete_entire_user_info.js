const functions = require("firebase-functions");
const admin = require("firebase-admin");
//admin.initializeApp(); // Make sure this line runs only once in your whole project setup

exports.deleteEntireUserInfo = functions
  .region("europe-central2")
  .runWith({ memory: "256MB" })
  .https.onCall(async (data, context) => {
    const userEmails = data.userEmails;

    if (!Array.isArray(userEmails)) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "userEmails must be an array",
      );
    }

    const db = admin.firestore();
    const auth = admin.auth();

    for (const email of userEmails) {
      try {
        const userRecord = await auth.getUserByEmail(email);
        const uid = userRecord.uid;

        // Get all ahorros documents for this user
        const ahorrosSnap = await db
          .collection("ahorros")
          .where("UserID", "==", uid)
          .get();

        for (const ahorroDoc of ahorrosSnap.docs) {
          const ahorroId = ahorroDoc.id;

          // Delete all transactions with this ahorroId
          const transactionsSnap = await db
            .collection("transactions")
            .where("ahorrosId", "==", ahorroId)
            .get();

          const deleteTransactionPromises = transactionsSnap.docs.map((doc) =>
            doc.ref.delete(),
          );
          await Promise.all(deleteTransactionPromises);

          // Delete the ahorro document
          await ahorroDoc.ref.delete();
        }

        // Delete user document from 'users' collection
        await db.collection("user").doc(uid).delete();

        // Delete Auth user
        await auth.deleteUser(uid);
      } catch (error) {
        console.error(`Failed to delete data for user: ${email}`, error);
        // You may decide to throw here or continue with next user
        // throw new functions.https.HttpsError('internal', `Failed to delete user: ${email}`);
      }
    }

    return { message: "Deletion process completed" };
  });
