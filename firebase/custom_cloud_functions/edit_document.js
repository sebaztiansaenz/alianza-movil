const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Ensure Firebase Admin is initialized
// admin.initializeApp();

exports.editDocument = functions
  .region("europe-central2")
  .runWith({
    memory: "128MB",
  })
  .firestore.document("Services/{serviceId}")
  .onUpdate((change, context) => {
    const beforeData = change.before.data();
    const afterData = change.after.data();

    // Check if the "EA" or "TypesOfProductName" field was updated
    if (
      beforeData.EA !== afterData.EA ||
      beforeData.TypesOfProductName !== afterData.TypesOfProductName
    ) {
      const newEA = afterData.EA;
      const newTypesOfProductName = afterData.TypesOfProductName;
      const serviceRef = change.after.ref;

      const ahorrosRef = admin.firestore().collection("ahorros");

      return ahorrosRef
        .where("service_", "==", serviceRef)
        .get()
        .then((querySnapshot) => {
          const batch = admin.firestore().batch();

          querySnapshot.forEach((doc) => {
            const docRef = doc.ref;
            const updates = {};

            // Log changes for debugging
            console.log(
              `Document ID: ${doc.id}, Before:`,
              beforeData,
              "After:",
              afterData,
            );

            // Update EA if changed
            if (beforeData.EA !== afterData.EA) {
              updates.EA = newEA;
            }

            // Update SavingsType if TypesOfProductName changed
            if (
              beforeData.TypesOfProductName !== afterData.TypesOfProductName
            ) {
              updates.SavingsType = newTypesOfProductName;
            }

            if (Object.keys(updates).length > 0) {
              batch.update(docRef, updates);
            }
          });

          return batch.commit();
        })
        .then(() => {
          console.log("Batch update completed successfully.");
        })
        .catch((error) => {
          console.error("Error updating ahorros:", error);
        });
    } else {
      console.log("No relevant field changes detected.");
      return null;
    }
  });
