const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.actualizarRetirosCdat = functions.pubsub
  .schedule("1 0 * * *") // Todos los días a las 00:01 AM
  .timeZone("America/Bogota") // Hora de Colombia
  .onRun(async (context) => {
    const db = admin.firestore();
    const now = admin.firestore.Timestamp.now();

    try {
      const cdatsSnapshot = await db.collection("Cdats").get();

      for (const cdatDoc of cdatsSnapshot.docs) {
        const cdatData = cdatDoc.data();
        let totalParaSumar = 0;

        const retirosSnapshot = await db
          .collection("Cdats")
          .doc(cdatDoc.id)
          .collection("RetirosCdat")
          .where("Estado", "==", "Sin cobrar")
          .get();

        const batch = db.batch();
        let batchHasUpdates = false;

        retirosSnapshot.forEach((retiroDoc) => {
          const retiroData = retiroDoc.data();
          const fechaRetiro = retiroData.Fecharetiro;
          const monto = retiroData.Monto;

          if (
            fechaRetiro &&
            fechaRetiro.toMillis &&
            fechaRetiro.toMillis() <= now.toMillis() &&
            retiroData.Estado === "Sin cobrar" &&
            typeof monto === "number"
          ) {
            const retiroRef = retiroDoc.ref;
            batch.update(retiroRef, { Estado: "Disponible" });
            totalParaSumar += monto;
            batchHasUpdates = true;
          }
        });

        if (batchHasUpdates) {
          const nuevoSaldo = (cdatData.saldoDisponible || 0) + totalParaSumar;
          const cdatRef = db.collection("Cdats").doc(cdatDoc.id);
          batch.update(cdatRef, { saldoDisponible: nuevoSaldo });
          await batch.commit();
        }
      }

      console.log("Proceso completado exitosamente.");
      return { success: true, message: "Retiros actualizados correctamente" };
    } catch (error) {
      console.error("Error al procesar retiros:", error);
      return { success: false, error: error.message };
    }
  });
