const admin = require("firebase-admin/app");
admin.initializeApp();

const editDocument = require("./edit_document.js");
exports.editDocument = editDocument.editDocument;
const dailyUpdates = require("./daily_updates.js");
exports.dailyUpdates = dailyUpdates.dailyUpdates;
const calculateMonthlyTaxes = require("./calculate_monthly_taxes.js");
exports.calculateMonthlyTaxes = calculateMonthlyTaxes.calculateMonthlyTaxes;
const createPaymentSession = require("./create_payment_session.js");
exports.createPaymentSession = createPaymentSession.createPaymentSession;
const paymentSessionCreation = require("./payment_session_creation.js");
exports.paymentSessionCreation = paymentSessionCreation.paymentSessionCreation;
const createPaymentSessionEmpresa = require("./create_payment_session_empresa.js");
exports.createPaymentSessionEmpresa =
  createPaymentSessionEmpresa.createPaymentSessionEmpresa;
const createPaymentSessionWeb = require("./create_payment_session_web.js");
exports.createPaymentSessionWeb =
  createPaymentSessionWeb.createPaymentSessionWeb;
const paymentWebhook = require("./payment_webhook.js");
exports.paymentWebhook = paymentWebhook.paymentWebhook;
const zapsignWebhook = require("./zapsign_webhook.js");
exports.zapsignWebhook = zapsignWebhook.zapsignWebhook;
const checkPaymentStatus = require("./check_payment_status.js");
exports.checkPaymentStatus = checkPaymentStatus.checkPaymentStatus;
const deleteUserr = require("./delete_userr.js");
exports.deleteUserr = deleteUserr.deleteUserr;
const adminResetPassword = require("./admin_reset_password.js");
exports.adminResetPassword = adminResetPassword.adminResetPassword;
const updateDatabase = require("./update_database.js");
exports.updateDatabase = updateDatabase.updateDatabase;
const deleteEntireUserInfo = require("./delete_entire_user_info.js");
exports.deleteEntireUserInfo = deleteEntireUserInfo.deleteEntireUserInfo;
const actualizarnombres = require("./actualizarnombres.js");
exports.actualizarnombres = actualizarnombres.actualizarnombres;
const actualizarRetirosCdat = require("./actualizar_retiros_cdat.js");
exports.actualizarRetirosCdat = actualizarRetirosCdat.actualizarRetirosCdat;
const checkPendingTransactions = require("./check_pending_transactions.js");
exports.checkPendingTransactions =
  checkPendingTransactions.checkPendingTransactions;
