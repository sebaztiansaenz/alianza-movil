const functions = require("firebase-functions");
const admin = require("firebase-admin");

//admin.initializeApp(); // Ensure this is initialized in your main entry point if not here

exports.updateDatabase = functions
  .region("europe-central2")
  .runWith({ memory: "256MB" })
  .https.onCall(async (data, context) => {
    const db = admin.firestore();

    try {
      //const ahorrosSnapshot = await db.collection('ahorros').get();
      // Only get ahorros documents where AhorrosDocPdf1 is set
      const ahorrosSnapshot = await db
        .collection("ahorros")
        .where("AhorrosDocPdf1", "!=", null)
        .get();

      for (const ahorroDoc of ahorrosSnapshot.docs) {
        const ahorroId = ahorroDoc.id;
        const ahorroData = ahorroDoc.data();

        // Get all transactions for this ahorro
        const transactionsSnapshot = await db
          .collection("transactions")
          .where("ahorrosId", "==", ahorroId)
          .get();

        let totalSavingsValue = 0;
        let withdrawals = 0;

        transactionsSnapshot.forEach((doc) => {
          const tx = doc.data();
          if (tx.status === "APPROVED" && tx.transactionType === "Depositado") {
            totalSavingsValue += tx.amount || 0;
          }

          if (tx.status !== "REJECTED" && tx.transactionType === "Withdrawal") {
            withdrawals += tx.amount || 0;
          }
        });

        // Sum of taxedBenefits inside ahorroData.transactions array
        const benefits = (ahorroData.transactions || []).reduce((sum, tx) => {
          return sum + (tx.taxedBenefit || 0);
        }, 0);

        const montoTotal = totalSavingsValue + benefits - withdrawals;

        await ahorroDoc.ref.update({
          //TotalSavingValue: totalSavingsValue,
          totalDeposits: totalSavingsValue,
          montoTotal: montoTotal,
        });
      }

      return {
        success: true,
        message: "All ahorros documents updated successfully.",
      };
    } catch (error) {
      console.error("Error updating ahorros:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to update ahorros documents.",
      );
    }
  });
