const functions = require("firebase-functions");
const admin = require("firebase-admin");

if (!admin.apps.length) {
  admin.initializeApp();
}

exports.adminResetPassword = functions.https.onCall(async (data, context) => {
  const { email, newPassword } = data;
  if (!email || !newPassword) {
    return false;
  }

  try {
    // Busca al usuario por email
    const user = await admin.auth().getUserByEmail(email);
    // Actualiza la contraseña
    await admin.auth().updateUser(user.uid, { password: newPassword });
    return true;
  } catch (error) {
    console.error("Error actualizando contraseña:", error);
    return false;
  }
});
