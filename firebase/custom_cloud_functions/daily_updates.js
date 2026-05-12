const functions = require("firebase-functions");
const admin = require("firebase-admin");

// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.dailyUpdates = functions
  .region("europe-central2")
  .runWith({
    memory: "256MB",
  })
  .pubsub.schedule("0 0 * * *")
  .timeZone("America/Bogota")
  .onRun(async (context) => {
    // Write your code below!

    const ahorrosRef = admin.firestore().collection("ahorros");

    try {
      const querySnapshot = await ahorrosRef
        .where("TotalSavingValue", ">", 0)
        .get();

      if (querySnapshot.empty) {
        console.log("No eligible ahorros documents found.");
        return null;
      }

      const batch = admin.firestore().batch();

      querySnapshot.forEach((doc) => {
        const docData = doc.data();
        const totalSavingValue = docData.TotalSavingValue;
        const currentBalance = docData.montoTotal || 0;
        const eaValue = docData.EA / 100 || 0;
        const actualEA = docData.EA;

        // Calculate the daily benefit
        const dailyInterestRate = Math.pow(1 + eaValue, 1 / 365) - 1;
        //const benefit = totalSavingValue * dailyInterestRate;
        const benefit = currentBalance * dailyInterestRate;

        let taxedBenefit, tax;
        if (benefit > 2738.945) {
          tax = benefit * 0.07; // Apply tax
          taxedBenefit = benefit * 0.93; // Benefit after tax
        } else {
          tax = 0; // No tax
          taxedBenefit = benefit; // Full benefit
        }

        // Create a new transaction
        const newTransaction = {
          totalBefore: currentBalance,
          totalAfter: currentBalance + benefit,
          fullBenefit: benefit,
          taxedBenefit: taxedBenefit,
          tax: tax,
          monthEA: actualEA,
          date: admin.firestore.Timestamp.now(),
          transactionType: "Benefit",
          description: "Benefit credit",
        };

        // Update the document by incrementing the montoTotal and adding the transaction
        batch.update(doc.ref, {
          montoTotal: admin.firestore.FieldValue.increment(taxedBenefit),
          transactions: admin.firestore.FieldValue.arrayUnion(newTransaction),
        });
      });

      // Commit the batch operation
      await batch.commit();

      console.log("Daily updates completed successfully.");
      return null;
    } catch (error) {
      console.error("Error updating ahorros:", error);
      throw new Error("Error updating ahorros: " + error.message);
    }

    // Write your code above!
  });
