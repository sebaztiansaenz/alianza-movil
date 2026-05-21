const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { getStorage, getDownloadURL } = require("firebase-admin/storage");

const axios = require("axios");

const { v4: uuidv4 } = require("uuid");

// Ensure Firebase Admin SDK is initialized

if (!admin.apps.length) {
  admin.initializeApp();
}

const SENDGRID_API_KEY = process.env.SENDGRID_API_KEY || "";

exports.zapsignWebhook = functions
  .region("europe-central2")

  .runWith({ memory: "128MB" })

  .https.onRequest(async (req, res) => {
    try {
      if (req.method !== "POST") {
        return res.status(405).send("Method Not Allowed");
      }

      let requestBody;

      if (typeof req.body === "string") {
        try {
          requestBody = JSON.parse(req.body);
        } catch (error) {
          console.error("Error parsing JSON:", error);

          return res.status(400).send("Invalid JSON payload");
        }
      } else {
        requestBody = req.body;
      }

      const {
        signed_file: signedFileUrl,
        name,
        external_id: documentId,
      } = requestBody;

      if (!signedFileUrl || !name || !documentId) {
        console.error("Invalid webhook payload:", requestBody);

        return res.status(400).send("Invalid webhook payload");
      }

      console.log(`Document Name: ${name}`);

      console.log(`Signed File URL: ${signedFileUrl}`);

      console.log(`Document ID: ${documentId}`);

      let pdfBuffer;

      try {
        const response = await axios.get(signedFileUrl, {
          responseType: "arraybuffer",
        });

        pdfBuffer = response.data;
      } catch (downloadError) {
        console.error("Error downloading the signed PDF:", downloadError);

        return res.status(500).send("Error downloading the signed PDF");
      }

      const filename = `signed_documents/${uuidv4()}.pdf`;

      const bucket = getStorage().bucket();

      const fileRef = bucket.file(filename);

      try {
        await fileRef.save(pdfBuffer, {
          contentType: "application/pdf",
        });

        const downloadURL = await getDownloadURL(fileRef);
        console.log(`File saved successfully: ${downloadURL}`);
        const db = admin.firestore();
        let updateData = {};

        if (name === "verification.pdf") {
          updateData = { verificationPDF: downloadURL, verificadoapp: true };
          await db.collection("user").doc(documentId).update(updateData);
          console.log(
            `User document ${documentId} updated with verification PDF and verification set to True.`,
          );

          const userDoc = await db.collection("user").doc(documentId).get();
          if (!userDoc.exists) {
            console.error(`User document ${documentId} not found.`);
            return res.status(404).send("User document not found");
          }

          const userData = userDoc.data();
          const userEmail = userData.email;
          const userName = userData.display_name;

          const now = new Date();
          const formattedDate = now.toLocaleString("es-ES", {
            weekday: "long",
            day: "numeric",
            month: "short",
            year: "numeric",
            hour: "2-digit",
            minute: "2-digit",
            hour12: false,
          });

          const emailHtml = `
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenido a Alianza Capital</title>
</head>
<body>
  <div style="font-family: Arial, sans-serif; margin: 0 auto; padding: 0; background-color: #ffffff; max-width: 600px;">
    <div style="padding: 20px;">
      <p style="font-size: 16px; text-align: left;">Hola,</p>
      <p style="font-size: 18px; text-align: center;">
        <span style="font-weight: bold;">${userName}</span>
      </p>
      <h2 style="font-size: 18px; font-weight: bold; text-align: left;">¡Bienvenido a Alianza Capital!</h2>
      <p style="font-size: 16px; text-align: left;">Hoy das el primer paso hacia una nueva forma de manejar tus finanzas. En Alianza Capital, creemos en el poder del ahorro, el acceso al crédito y las oportunidades de inversión para transformar vidas. Nos emociona acompañarte en este camino, brindándote herramientas seguras, flexibles y diseñadas para tu crecimiento.</p>
      <p style="font-size: 16px; text-align: left;">Tu confianza nos inspira a seguir innovando y creando soluciones que realmente marquen la diferencia, tu crecimiento es nuestra prioridad, y juntos, haremos que las metas se conviertan en realidad. Este es solo el comienzo de una gran alianza.</p>
      <div style="text-align: center; margin: 40px 0;">
        <img src="https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/58257b817ed9916d01eddac14643be11b43633f324d1ceb9de865a143607813f0209394cb8cef3c63afb00b9fa06291ea2ad64d8c930f72082c7f52600e450682be8df7b940c1df3ccf20b457ae1d7ac25cc858943fb98b3dc02fb2dbe6905e037c20b7f.webp?alt=media&token=7af2a5f4-8d07-451c-9989-2f17dcb6a412" alt="IMAGEN" style="width: 100%; max-width: 600px; display: block;">
      </div>
      <p style="font-size: 16px; text-align: left;">Esta solicitud fue realizada el <b>${formattedDate}</b>.</p>
      <h3 style="font-size: 15px; text-align: left; margin-top: 30px;">Enlaces importantes</h3>
      <ul style="font-size: 14px; line-height: 2.5; text-align: left; padding-left: 20px;">
        <li>Link de políticas de privacidad <a href="https://alianzacapital.co/politica-de-privacidad.html" target="_blank">https://alianzacapital.co/politica-de-privacidad.html</a></li>
        <li>Link de términos y condiciones <a href="https://alianzacapital.co/terminos-y-condiciones.html" target="_blank">https://alianzacapital.co/terminos-y-condiciones.html</a></li>
      </ul>
    </div>
  </div>
</body>
</html>
`;

          try {
            await axios.post(
              "https://api.sendgrid.com/v3/mail/send",
              {
                personalizations: [
                  {
                    to: [{ email: userEmail }],
                    subject: "¡Bienvenido a Alianza Capital!",
                  },
                ],
                from: { email: "notificaciones@alianzasolidaria.co" },
                content: [
                  {
                    type: "text/html",
                    value: emailHtml,
                  },
                ],
              },
              {
                headers: {
                  Authorization: `Bearer ${SENDGRID_API_KEY}`,
                  "Content-Type": "application/json",
                },
              },
            );
            console.log(`Welcome email sent to ${userEmail}`);
          } catch (emailError) {
            console.error(
              "Error sending welcome email:",
              emailError.response
                ? emailError.response.data
                : emailError.message,
            );
          }
        } else if (name === "ahorro1.pdf") {
          // Primero obtenemos el documento de ahorros
          const ahorroDoc = await db
            .collection("ahorros")
            .doc(documentId)
            .get();
          if (!ahorroDoc.exists) {
            console.error(`Ahorros document ${documentId} not found.`);
            return res.status(404).send("Ahorros document not found");
          }

          const ahorroData = ahorroDoc.data();
          const userEmail = ahorroData.UserEmail;
          const userName = ahorroData.UserName;
          const ahorroType = ahorroData.SavingsType;

          // Verificar si ya existe el campo "company"
          if (ahorroData.company) {
            // Si ya existe company, ejecutar lógica actual
            updateData = { AhorrosDocPdf1: downloadURL };
            await db.collection("ahorros").doc(documentId).update(updateData);
            console.log(
              `Ahorros document ${documentId} updated with AhorrosDocPdf1.`,
            );
          } else {
            // Si no existe company, buscar empresanuevaahorro del usuario
            const userId = ahorroData.UserId; // Asumiendo que tienes el userId en el documento de ahorros

            // Si no tienes userId directamente, puedes buscarlo por email
            let userDoc;
            if (userId) {
              userDoc = await db.collection("user").doc(userId).get();
            } else {
              // Buscar usuario por email si no tienes userId
              const userQuery = await db
                .collection("user")
                .where("email", "==", userEmail)
                .limit(1)
                .get();
              if (!userQuery.empty) {
                userDoc = userQuery.docs[0];
              }
            }

            if (!userDoc || !userDoc.exists) {
              console.error(
                `User not found for ahorros document ${documentId}`,
              );
              return res.status(404).send("User not found");
            }

            const userData = userDoc.data();
            const empresanuevaahorro = userData.empresanuevaahorro;

            if (!empresanuevaahorro) {
              console.error(
                `empresanuevaahorro not found for user ${userDoc.id}`,
              );
              // Actualizar solo con AhorrosDocPdf1 si no hay empresa
              updateData = { AhorrosDocPdf1: downloadURL };
              await db.collection("ahorros").doc(documentId).update(updateData);
              console.log(
                `Ahorros document ${documentId} updated with AhorrosDocPdf1 only (no company found).`,
              );
            } else {
              // Obtener datos de la empresa usando el document reference
              const empresaDoc = await empresanuevaahorro.get();

              if (!empresaDoc.exists) {
                console.error(
                  `Empresa document not found for reference ${empresanuevaahorro.path}`,
                );
                // Actualizar solo con AhorrosDocPdf1 si no se encuentra la empresa
                updateData = { AhorrosDocPdf1: downloadURL };
                await db
                  .collection("ahorros")
                  .doc(documentId)
                  .update(updateData);
                console.log(
                  `Ahorros document ${documentId} updated with AhorrosDocPdf1 only (empresa not found).`,
                );
              } else {
                const empresaData = empresaDoc.data();

                // Actualizar con todos los campos incluyendo la información de la empresa
                updateData = {
                  AhorrosDocPdf1: downloadURL,
                  company: empresanuevaahorro,
                  CompanyNIT: empresaData.nit,
                  CompanyName: empresaData.razonsocial,
                };

                await db
                  .collection("ahorros")
                  .doc(documentId)
                  .update(updateData);
                console.log(
                  `Ahorros document ${documentId} updated with AhorrosDocPdf1 and company info.`,
                );
              }
            }
          }

          const now = new Date();
          const formattedDate = now.toLocaleString("es-ES", {
            weekday: "long",
            day: "numeric",
            month: "short",
            year: "numeric",
            hour: "2-digit",
            minute: "2-digit",
            hour12: false,
          });

          const emailHtml = `
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenido a Alianza Capital</title>
</head>
<body>
  <div style="font-family: Arial, sans-serif; margin: 0 auto; padding: 0; background-color: #ffffff; max-width: 600px;">
    <div style="padding: 20px;">
      <p style="font-size: 16px; text-align: left;">Hola,</p>
      <p style="font-size: 18px; text-align: center;">
        <span style="font-weight: bold;">${userName}</span>
      </p>
      <p style="font-size: 16px; text-align: left;">Has dado un gran paso hacia un futuro financiero más seguro y lleno de oportunidades. En Alianza Capital, tu ahorro crece con seguridad, flexibilidad y beneficios diseñados para ti.</p>
      <p style="font-size: 16px; text-align: left;">En tu <b>${ahorroType}</b> tus rendimientos serán diarios, y podrás retirar cuando quieras.</p>
      <div style="text-align: center; margin: 40px 0;">
        <img src="https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/08e2dbc54d076a0418403ee89326d63a154b63bcbd76c26af1ed50856d1ebb67a509fb1f8b5fe53bd8c20cfbb6209ab914008108d2f1edc1c38fe14397aa4d8ebd96f414c4fc58d690620bb63ea5d266b01e9d2423ce64c772025fa7a86eeb8a4e503b29.webp?alt=media&token=5747b950-e452-4adb-b600-f0a65aa15483" alt="IMAGEN" style="width: 100%; max-width: 600px; display: block;">
      </div>
      <p style="font-size: 16px; text-align: left;">Esta solicitud fue realizada el <b>${formattedDate}</b>.</p>
      <h3 style="font-size: 15px; text-align: left; margin-top: 30px;">Enlaces importantes</h3>
      <ul style="font-size: 14px; line-height: 2.5; text-align: left; padding-left: 20px;">
        <li>Link de reglamentos y normatividad en líneas de ahorro <a href="https://alianzacapital.co/terminos-y-condiciones.html" target="_blank">https://alianzacapital.co/terminos-y-condiciones.html</a></li>
      </ul>
    </div>
  </div>
</body>
</html>
`;

          try {
            await axios.post(
              "https://api.sendgrid.com/v3/mail/send",
              {
                personalizations: [
                  {
                    to: [{ email: userEmail }],
                    subject: "¡Bienvenido a Alianza Capital!",
                  },
                ],
                from: { email: "notificaciones@alianzasolidaria.co" },
                content: [
                  {
                    type: "text/html",
                    value: emailHtml,
                  },
                ],
              },
              {
                headers: {
                  Authorization: `Bearer ${SENDGRID_API_KEY}`,
                  "Content-Type": "application/json",
                },
              },
            );
            console.log(`Welcome email sent to ${userEmail}`);
          } catch (emailError) {
            console.error(
              "Error sending welcome email for ahorro:",
              emailError.response
                ? emailError.response.data
                : emailError.message,
            );
          }
        } else if (name === "empresaRep.pdf") {
          updateData = { signedDocument: downloadURL };

          await db.collection("empresa").doc(documentId).update(updateData);

          console.log(
            `Empresa document ${documentId} updated with Rep Signed Document.`,
          );

          const empresaDoc = await db
            .collection("empresa")
            .doc(documentId)
            .get();
          const { correo: userEmail, razonsocial: userName } =
            empresaDoc.data();
          const now = new Date();

          const formattedDate = now.toLocaleString("es-ES", {
            weekday: "long",

            day: "numeric",

            month: "short",

            year: "numeric",

            hour: "2-digit",

            minute: "2-digit",

            hour12: false,
          });

          const emailHtml = `<!DOCTYPE html><html lang=\"es\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>Vinculación Exitosa - Alianza Capital Empresas</title></head><body><div style=\"font-family: Arial, sans-serif; margin: 0 auto; padding: 20px 0; background-color: #f4f4f4; min-height: 100%;\"><div style=\"background-color: #ffffff; border-radius: 5px; padding: 30px; margin: 0 auto; max-width: 600px;\"><p style=\"text-align: left; font-size: 16px; margin: 0 0 15px 0;\">Hola,</p><h2 style=\"text-align: center; font-weight: bold; margin: 0 0 20px 0;\">${userName}</h2><h1 style=\"font-size: 20px; text-align: left; margin: 0 0 20px 0; font-weight: bold;\">¡Bienvenido a Alianza Capital!</h1><p style=\"font-size: 16px; color: #000000; text-align: left; margin: 0 0 15px 0; line-height: 1.5;\">Es un placer darles la bienvenida a esta nueva etapa de crecimiento y bienestar financiero. Nos llena de orgullo que hayan decidido confiar en Alianza Capital como su aliado para fomentar el ahorro entre sus colaboradores.</p><p style=\"font-size: 16px; color: #000000; text-align: left; margin: 0 0 25px 0; line-height: 1.5;\">A través de este programa de ahorro, tendrán la oportunidad de construir un futuro más sólido, alcanzar sus metas personales y disfrutar de los beneficios exclusivos que hemos diseñado especialmente para ustedes. Nuestro compromiso es acompañarlos en cada paso, brindándoles herramientas, asesoría y soluciones financieras adaptadas a sus necesidades.</p><div style=\"text-align: center; margin: 30px 0;\"><img src=\"https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/email%20image.png?alt=media&token=bfe48779-ff08-4cca-aab0-25dfd0838892\" alt=\"Alianza Capital\" style=\"width: 100%; max-width: 600px; height: auto; display: block; margin: 0 auto;\"></div><p style=\"font-size: 16px; color: #000000; text-align: left; margin: 25px 0;\">Esta solicitud fue realizada el <span style=\"background-color: #00BFFF; color: #ffffff; padding: 4px 8px; border-radius: 3px; font-weight: bold;\">${formattedDate}</span>.</p><h3 style=\"text-align: left; font-size: 18px; margin: 30px 0 15px 0;\">Enlaces importantes</h3><ul style=\"font-size: 14px; line-height: 1.6; padding-left: 20px; margin: 0 0 30px 0; text-align: left;\"><li style=\"margin-bottom: 10px;\">Link de políticas de privacidad <a href=\"https://alianzacapital.co/politica-de-privacidad.html\" style=\"color: #0066cc; text-decoration: none;\" target=\"_blank\">https://alianzacapital.co/politica-de-privacidad.html</a></li><li style=\"margin-bottom: 10px;\">Link de términos y condiciones <a href=\"https://alianzacapital.co/terminos-y-condiciones.html\" style=\"color: #0066cc; text-decoration: none;\" target=\"_blank\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul></div></div></body></html>`; // empresa email template
          //const now = new Date();
          try {
            await axios.post(
              "https://api.sendgrid.com/v3/mail/send",
              {
                personalizations: [
                  {
                    to: [{ email: userEmail }],
                    subject: "Vinculación Exitosa - Alianza Capital Empresas",
                  },
                ],

                from: { email: "notificaciones@alianzasolidaria.co" },

                content: [
                  {
                    type: "text/html",

                    value: emailHtml,
                  },
                ],
              },
              {
                headers: {
                  Authorization: `Bearer ${SENDGRID_API_KEY}`,

                  "Content-Type": "application/json",
                },
              },
            );

            console.log(`Welcome email sent to ${userEmail}`);
          } catch (emailError) {
            console.error(
              "Error sending welcome email for ahorro:",
              emailError.response
                ? emailError.response.data
                : emailError.message,
            );
          }
        } else if (name === "cdat.pdf") {
          updateData = { firma: downloadURL, firmado: true, Estado: "Activo" };

          await db.collection("Cdats").doc(documentId).update(updateData);

          console.log(
            `Cdats document ${documentId} updated with signed document and firmado set to true.`,
          );
        } else if (
          name === "credito_documentos.pdf" ||
          name === "credito_pagare.pdf" ||
          name === "credito_autorizacion_nomina.pdf"
        ) {
          const hbRef = db.collection("HabilitarCredito").doc(documentId);
          const hbSnap = await hbRef.get();

          if (!hbSnap.exists) {
            console.error(
              `HabilitarCredito document ${documentId} not found.`,
            );
            return res.status(404).send("HabilitarCredito document not found");
          }

          const hbData = hbSnap.data();
          const usuarioUid = hbData.usuarioUid;

          if (name === "credito_documentos.pdf") {
            updateData = {
              creditoDocPagareUrl: downloadURL,
              creditoDocAutorizacionNominaUrl: downloadURL,
            };
          } else if (name === "credito_pagare.pdf") {
            updateData = { creditoDocPagareUrl: downloadURL };
          } else {
            updateData = {
              creditoDocAutorizacionNominaUrl: downloadURL,
            };
          }

          await hbRef.update(updateData);
          console.log(
            `HabilitarCredito ${documentId} updated (${name}): ${downloadURL}`,
          );

          if (usuarioUid) {
            await db.collection("user").doc(usuarioUid).update(updateData);
            console.log(`User ${usuarioUid} synced with ${name} URL.`);
          }
        } else {
          console.log(`No specific action defined for document name: ${name}`);
        }

        res.status(200).send({ fileUrl: downloadURL });
      } catch (storageError) {
        console.error(
          "Error uploading the file to Firebase Storage:",
          storageError,
        );
        return res
          .status(500)
          .send("Error uploading the file to Firebase Storage");
      }
    } catch (error) {
      console.error("Error processing webhook:", error);
      res.status(500).send("Internal Server Error");
    }
  });
