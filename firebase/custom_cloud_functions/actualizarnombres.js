const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.actualizarnombres = functions.firestore
  .document("user/{userId}")
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    const userId = context.params.userId;

    // Validación de datos
    if (!before || !after) {
      console.log("⚠️ Datos no disponibles");
      return null;
    }

    // Verificar que display_name existe
    if (!after.display_name) {
      console.log("⚠️ display_name no existe en el documento");
      return null;
    }

    // Verificar que el nombre realmente cambió
    if (before.display_name === after.display_name) {
      console.log("ℹ️ No hubo cambio en display_name");
      return null;
    }

    // Validar que el nuevo nombre no esté vacío
    const newDisplayName = after.display_name.trim();
    if (newDisplayName === "") {
      console.log("⚠️ El nuevo display_name está vacío");
      return null;
    }

    console.log(
      `🔄 Sincronizando nombre para userId: ${userId} → "${newDisplayName}"`,
    );

    const db = admin.firestore();
    let totalUpdates = 0;

    try {
      // Obtener documentos de Cdats
      const cdatsSnapshot = await db
        .collection("Cdats")
        .where("Idusuario", "==", userId)
        .get();

      console.log(`📄 Cdats: ${cdatsSnapshot.size} documentos encontrados`);

      // Obtener documentos de ahorros
      const ahorrosSnapshot = await db
        .collection("ahorros")
        .where("UserID", "==", userId)
        .get();

      console.log(`💰 Ahorros: ${ahorrosSnapshot.size} documentos encontrados`);

      // Calcular total de documentos
      totalUpdates = cdatsSnapshot.size + ahorrosSnapshot.size;

      // Si no hay documentos, terminar
      if (totalUpdates === 0) {
        console.log("ℹ️ No se encontraron documentos para actualizar");
        return null;
      }

      // Verificar límite de batch (500 operaciones máximo)
      if (totalUpdates > 500) {
        console.warn(
          `⚠️ Total de documentos (${totalUpdates}) excede el límite de batch (500)`,
        );
        await actualizarEnLotes(
          db,
          cdatsSnapshot,
          ahorrosSnapshot,
          newDisplayName,
        );
      } else {
        // Actualización normal con un solo batch
        const batch = db.batch();

        cdatsSnapshot.forEach((doc) => {
          batch.update(doc.ref, { nombreusuario: newDisplayName });
        });

        ahorrosSnapshot.forEach((doc) => {
          batch.update(doc.ref, { UserName: newDisplayName });
        });

        await batch.commit();
      }

      console.log(
        `✅ Actualización completada: ${totalUpdates} documentos actualizados`,
      );
      return null;
    } catch (error) {
      console.error("❌ Error en actualizarnombres:", error);
      throw error;
    }
  });

// Función auxiliar para manejar más de 500 documentos
async function actualizarEnLotes(
  db,
  cdatsSnapshot,
  ahorrosSnapshot,
  newDisplayName,
) {
  const MAX_BATCH_SIZE = 500;
  let batch = db.batch();
  let operationCount = 0;
  let batchNumber = 1;

  // Procesar Cdats
  for (const doc of cdatsSnapshot.docs) {
    batch.update(doc.ref, { nombreusuario: newDisplayName });
    operationCount++;

    if (operationCount === MAX_BATCH_SIZE) {
      console.log(
        `📦 Ejecutando batch #${batchNumber} (${operationCount} operaciones)`,
      );
      await batch.commit();
      batch = db.batch();
      operationCount = 0;
      batchNumber++;
    }
  }

  // Procesar ahorros
  for (const doc of ahorrosSnapshot.docs) {
    batch.update(doc.ref, { UserName: newDisplayName });
    operationCount++;

    if (operationCount === MAX_BATCH_SIZE) {
      console.log(
        `📦 Ejecutando batch #${batchNumber} (${operationCount} operaciones)`,
      );
      await batch.commit();
      batch = db.batch();
      operationCount = 0;
      batchNumber++;
    }
  }

  // Ejecutar batch final si hay operaciones pendientes
  if (operationCount > 0) {
    console.log(
      `📦 Ejecutando batch final #${batchNumber} (${operationCount} operaciones)`,
    );
    await batch.commit();
  }

  console.log(`✅ Procesados ${batchNumber} batches en total`);
}
