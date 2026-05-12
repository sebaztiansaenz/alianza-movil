const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize Firebase Admin if not already initialized

if (!admin.apps.length) {
  admin.initializeApp();
}

exports.calculateMonthlyTaxes = functions
  .region("europe-central2")

  .runWith({
    memory: "128MB",
  })

  .pubsub.schedule("0 0 1 * *") // Run at midnight on the first day of every month

  .timeZone("Europe/Central")

  .onRun(async (context) => {
    console.log("Monthly tax calculation started");

    const ahorrosRef = admin.firestore().collection("ahorros");

    try {
      const querySnapshot = await ahorrosRef.get();

      const batch = admin.firestore().batch();

      querySnapshot.forEach((doc) => {
        const docData = doc.data();

        const transactions = docData.transactions || [];

        const currentDate = new Date();

        const previousMonth = new Date(
          currentDate.getFullYear(),
          currentDate.getMonth() - 1,
          1,
        );

        const nextMonth = new Date(
          currentDate.getFullYear(),
          currentDate.getMonth(),
          1,
        );

        // Debug: Logging to verify date range

        console.log(
          `Calculating for transactions between ${previousMonth} and ${nextMonth}`,
        );

        // Sum the tax values for the "Benefit" transactions that happened in the previous month

        let totalTax = 0;

        transactions.forEach((transaction) => {
          const transactionDate = transaction.date.toDate
            ? transaction.date.toDate()
            : transaction.date;

          const transactionType = transaction.transactionType || "";

          // Debug: Log each transaction date and type

          console.log(
            `Transaction Date: ${transactionDate}, Type: ${transactionType}`,
          );

          // Check if the transaction date is in the previous month and is of type "Benefit"

          if (
            transactionDate >= previousMonth &&
            transactionDate < nextMonth &&
            transactionType === "Benefit"
          ) {
            totalTax += transaction.tax || 0;
          }
        });

        // Debug: Log the total tax to be deducted

        console.log(`Document ID: ${doc.id}, Total Tax: ${totalTax}`);

        // Decrement the montoTotal by the total tax sum if greater than 0

        if (totalTax > 0) {
          batch.update(doc.ref, {
            montoTotal: admin.firestore.FieldValue.increment(-totalTax),

            taxes: admin.firestore.FieldValue.increment(totalTax),
          });
        }
      });

      // Commit the batch operation
      await batch.commit();
      console.log("Monthly tax calculation completed successfully.");
      return null;
    } catch (error) {
      console.error("Error calculating monthly tax:", error);
      throw new Error("Error calculating monthly tax: " + error.message);
    }
  });
