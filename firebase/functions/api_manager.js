const axios = require("axios").default;
const qs = require("qs");

function sendgridBearer() {
  const k = process.env.SENDGRID_API_KEY;
  if (!k) {
    throw new Error("SENDGRID_API_KEY environment variable is required");
  }
  return `Bearer ${k}`;
}

async function _sendGridEmailOTPahorroCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];
  var ahorrosType = ffVariables["ahorrosType"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Verificación y afiliación de tu cuenta"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Verificación y afiliación de tu cuenta</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px;text-align:center\\"><p style=\\"font-size:16px;text-align:left\\">Hola,</p><p style=\\"font-size:18px\\"><span style=\\"font-weight:bold\\">${name}</span></p><p style=\\"font-size:16px;text-align:left\\">Hemos recibido tu solicitud de retiro de tu <b>${ahorrosType}</b>. Para confirmar la transaccion, utiliza el siguiente código de seguridad. Esta solicitud fue realizada el <b>${date}</b>.</p><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otpCode}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><h3 style=\\"font-size:18px;text-align:left\\">Enlaces importantes</h3><ul style=\\"font-size:14px;line-height:1.5;text-align:left;padding-left:20px\\"><li>Link de reglamentos y normatividad en lineas de ahorro <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\" target=\\"_blank\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul><h3 style=\\"font-size:18px;text-align:left;margin-top:30px\\">Declaración y aceptación</h3><ul style=\\"font-size:14px;line-height:1.6;text-align:left;padding-left:20px\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones, como también las políticas de privacidad y normatividad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul><p style=\\"font-size:14px;font-weight:bold;text-align:left;margin-top:30px\\">IMPORTANTE:</p><p style=\\"font-size:14px;text-align:left\\">Si no has solicitado este código de registro, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportamos este caso.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPahorroCopyCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];
  var ahorrosType = ffVariables["ahorrosType"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Solicitud de Retiro"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Solicitud de Retiro</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px;text-align:center\\"><p style=\\"font-size:16px;text-align:left\\">Hola,</p><p style=\\"font-size:18px\\"><span style=\\"font-weight:bold\\">${name}</span></p><p style=\\"font-size:16px;text-align:left\\">Hemos recibido tu solicitud de retiro de tu <b>${ahorrosType}</b>. Para confirmar la transaccion, utiliza el siguiente código de seguridad. Esta solicitud fue realizada el <b>${date}</b>.</p><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otpCode}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><h3 style=\\"font-size:18px;text-align:left\\">Enlaces importantes</h3><ul style=\\"font-size:14px;line-height:1.5;text-align:left;padding-left:20px\\"><li>Link de reglamentos y normatividad en lineas de ahorro <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\" target=\\"_blank\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul><h3 style=\\"font-size:18px;text-align:left;margin-top:30px\\">Declaración y aceptación</h3><ul style=\\"font-size:14px;line-height:1.6;text-align:left;padding-left:20px\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones, como también las políticas de privacidad y normatividad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul><p style=\\"font-size:14px;font-weight:bold;text-align:left;margin-top:30px\\">IMPORTANTE:</p><p style=\\"font-size:14px;text-align:left\\">Si no has solicitado este código de registro, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportamos este caso.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPCopyCopyCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];
  var ahorrosType = ffVariables["ahorrosType"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Verificación y afiliación de tu cuenta"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Verificación y afiliación de tu cuenta</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px;text-align:center\\"><p style=\\"font-size:16px;text-align:left\\">Hola,</p><p style=\\"font-size:18px\\"><span style=\\"font-weight:bold\\">${name}</span></p><p style=\\"font-size:16px;text-align:left\\">Hemos recibido tu solicitud de retiro de tu <b>${ahorrosType}</b>. Para confirmar la transaccion, utiliza el siguiente código de seguridad. Esta solicitud fue realizada el <b>${date}</b>.</p><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otpCode}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><h3 style=\\"font-size:18px;text-align:left\\">Enlaces importantes</h3><ul style=\\"font-size:14px;line-height:1.5;text-align:left;padding-left:20px\\"><li>Link de reglamentos y normatividad en lineas de ahorro <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\" target=\\"_blank\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul><h3 style=\\"font-size:18px;text-align:left;margin-top:30px\\">Declaración y aceptación</h3><ul style=\\"font-size:14px;line-height:1.6;text-align:left;padding-left:20px\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones, como también las políticas de privacidad y normatividad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul><p style=\\"font-size:14px;font-weight:bold;text-align:left;margin-top:30px\\">IMPORTANTE:</p><p style=\\"font-size:14px;text-align:left\\">Si no has solicitado este código de registro, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportamos este caso.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPCDATCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];
  var cdat = ffVariables["cdat"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Confirmación de solicitud de retiro de tu CDAT"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Verificación y afiliación de tu cuenta</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px;text-align:center\\"><p style=\\"font-size:16px;text-align:left\\">Hola,</p><p style=\\"font-size:18px\\"><span style=\\"font-weight:bold\\">${name}</span></p><p style=\\"font-size:16px;text-align:left\\">Hemos recibido tu solicitud de retiro de tu <b>${cdat}</b>. Para confirmar la transaccion, utiliza el siguiente código de seguridad. Esta solicitud fue realizada el <b>${date}</b>.</p><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otpCode}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><h3 style=\\"font-size:18px;text-align:left\\">Enlaces importantes</h3><ul style=\\"font-size:14px;line-height:1.5;text-align:left;padding-left:20px\\"><li>Link de reglamentos y normatividad en lineas de ahorro <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\" target=\\"_blank\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul><h3 style=\\"font-size:18px;text-align:left;margin-top:30px\\">Declaración y aceptación</h3><ul style=\\"font-size:14px;line-height:1.6;text-align:left;padding-left:20px\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones, como también las políticas de privacidad y normatividad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul><p style=\\"font-size:14px;font-weight:bold;text-align:left;margin-top:30px\\">IMPORTANTE:</p><p style=\\"font-size:14px;text-align:left\\">Si no has solicitado este código de registro, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportamos este caso.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPcambiodeestadoCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var email = ffVariables["email"];
  var companyName = ffVariables["companyName"];
  var employeeName = ffVariables["employeeName"];
  var docType = ffVariables["docType"];
  var docNumber = ffVariables["docNumber"];
  var otpCode = ffVariables["otpCode"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Validación de seguridad Cambio de estado empresarial – Código OTP requerido"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Validación de seguridad</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px;text-align:center\\"><p style=\\"font-size:16px;text-align:left\\">Hola,</p><p style=\\"font-size:18px\\"><span style=\\"font-weight:bold\\">${companyName}</span></p><p style=\\"font-size:16px;text-align:left\\">Estás a punto de realizar una acción sensible del usuario <b>${employeeName}</b> identificado con <b>${docType}</b> <b>${docNumber}</b> que requiere verificación adicional para garantizar la integridad de los datos y la autorización por parte del responsable.</p><ul style=\\"font-size:14px;line-height:1.5;text-align:left;padding-left:20px\\"><li>1: Aplicar una excepción de pago en la plataforma.</li><li>2: Eliminar de forma definitiva el perfil de un usuario.</li></ul><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otpCode}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><p style=\\"font-size:16px;text-align:left\\">Por favor, ingresa el código de verificación (OTP) que hemos enviado a tu número de celular o correo electrónico registrado. Esta validación es necesaria para confirmar que cuentas con los permisos adecuados para proceder.</p><p style=\\"font-size:16px;text-align:left;margin-top:20px\\">Una vez el código sea ingresado correctamente y se apruebe la operación, se generará automáticamente una notificación formal al usuario involucrado, informando sobre el cambio realizado y sus implicaciones.</p></div></div></body></html>"
    }
  ]
}
`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailNovedadSaldoClienteCall(context, ffVariables) {
  var email = ffVariables["email"];
  var nombreUsuario = ffVariables["nombreUsuario"];
  var tipoMovimiento = ffVariables["tipoMovimiento"];
  var valorTransaccion = ffVariables["valorTransaccion"];
  var idTransaccion = ffVariables["idTransaccion"];
  var detallesTransaccion = ffVariables["detallesTransaccion"];
  var fecha = ffVariables["fecha"];
  var lineaAhorro = ffVariables["lineaAhorro"];
  var numeroCuenta = ffVariables["numeroCuenta"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "${tipoMovimiento} por ${valorTransaccion} en su cuenta Alianza Capital"
    }
  ],
  "from": {
    "email": "notificaciones@alianzacapital.co"
  },
  "reply_to": {
    "email": "info@alianzacapital.co"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Notificación de movimiento</title></head><body style=\\"margin:0;padding:20px;background-color:#f5f5f5;font-family:Arial,sans-serif\\"><div style=\\"max-width:700px;margin:0 auto;background-color:#ffffff;padding:40px\\"><p style=\\"font-size:14px;color:#000;line-height:1.6;margin:20px 0\\">Estimado(a) <b>${nombreUsuario}</b>,</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Le informamos que se ha registrado un movimiento en su cuenta de Alianza Capital el día <b>${fecha}</b>:</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\"><b>Detalles del movimiento:</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:5px 0\\">Tipo de movimiento: <b>${tipoMovimiento}</b><br>Valor: <b>${valorTransaccion}</b><br>Id transacción: <b>${idTransaccion}</b><br>Cuenta: <b>${lineaAhorro} ${numeroCuenta}</b><br>Detalles: <b>${detallesTransaccion}</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Este movimiento fue realizado de manera interna dentro del ecosistema de Alianza Capital y no requiere acción adicional de su parte.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Puede consultar el detalle completo de la transacción ingresando a su cuenta en la app o plataforma web.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Gracias por confiar en Alianza Capital.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\"><b>Equipo Alianza Capital</b><br>www.alianzacapital.com<br>info@alianzacapital.co</p><p style=\\"font-size:13px;color:#666;line-height:1.6;margin:20px 0;font-style:italic\\">Este es un mensaje automático, por favor no lo responda directamente.</p></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailNovedadSaldoCall(context, ffVariables) {
  var email = ffVariables["email"];
  var nombreUsuario = ffVariables["nombreUsuario"];
  var tipoOperacion = ffVariables["tipoOperacion"];
  var valorTransaccion = ffVariables["valorTransaccion"];
  var idTransaccion = ffVariables["idTransaccion"];
  var nombreCompleto = ffVariables["nombreCompleto"];
  var numeroDocumento = ffVariables["numeroDocumento"];
  var tipoDocumento = ffVariables["tipoDocumento"];
  var lineaAhorro = ffVariables["lineaAhorro"];
  var numeroCuenta = ffVariables["numeroCuenta"];
  var detallesTransaccion = ffVariables["detallesTransaccion"];
  var otp = ffVariables["otp"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Código OTP transacción interna"
    }
  ],
  "from": {
    "email": "notificaciones@alianzacapital.co"
  },
  "reply_to": {
    "email": "info@alianzacapital.co"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Código OTP transacción interna</title></head><body style=\\"margin:0;padding:20px;background-color:#f5f5f5;font-family:Arial,sans-serif\\"><div style=\\"max-width:700px;margin:0 auto;background-color:#ffffff;padding:40px\\"><p style=\\"font-size:14px;color:#000;line-height:1.6;margin:20px 0\\"><b>CODIGO DE VALIDACION DE TRANSACCION</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Asunto: Código OTP transacción interna (<b>${nombreUsuario}</b>)</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Para completar la validación de la transacción que está realizando en su cuenta de Alianza Capital, le enviamos su código de verificación:</p><div style=\\"text-align:center;margin:30px 0\\"><span style=\\"font-size:40px;font-weight:bold;letter-spacing:2px\\">${otp}</span><p style=\\"margin-top:10px;font-size:14px\\">Código OTP</p></div><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Este código es personal y de un solo uso. Por motivos de seguridad, <b>no lo comparta con nadie</b>, ni siquiera con personal de Alianza Capital.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Si usted no ha iniciado esta operación, comuníquese de inmediato con nuestro equipo de soporte.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\"><b>Detalles de la transacción:</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:5px 0\\">Tipo de operación: <b>${tipoOperacion}</b><br>Valor: <b>${valorTransaccion}</b><br>Id transacción: <b>${idTransaccion}</b><br>Nombre de usuario: <b>${nombreCompleto}</b><br>Numero documento: <b>${numeroDocumento}</b><br>Tipo de documento: <b>${tipoDocumento}</b><br>Cuenta: <b>${lineaAhorro}  ${numeroCuenta}</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Detalles de transacción: <b>${detallesTransaccion}</b></p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\">Gracias por ayudarnos a mantener la seguridad de su cuenta.</p><p style=\\"font-size:14px;color:#333;line-height:1.6;margin:20px 0\\"><b>Equipo Alianza Capital</b><br>www.alianzacapital.com<br>info@alianzacapital.co</p><p style=\\"font-size:13px;color:#666;line-height:1.6;margin:20px 0;font-style:italic\\">Este es un mensaje automático, por favor no lo responda directamente.</p></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailExcepciondepagoCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var collaboratorName = ffVariables["collaboratorName"];
  var email = ffVariables["email"];
  var documentNumber = ffVariables["documentNumber"];
  var collaboratorFullName = ffVariables["collaboratorFullName"];
  var documentType = ffVariables["documentType"];
  var companyName = ffVariables["companyName"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Notificación de excepción del aporte de ahorro de nómina – ${collaboratorName}"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Notificación de excepción de pago</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px\\"><p style=\\"font-size:16px\\">Estimado(a) <span style=\\"font-weight:bold\\">${collaboratorName}</span>,</p><p style=\\"font-size:16px\\">Señores <span style=\\"font-weight:bold\\">${companyName}</span>:</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Por medio del presente, notificamos que para el periodo de nómina correspondiente <b>al siguiente pago de esta notificación, no se aplicará el descuento por concepto de ahorro de nómina</b> a favor de la empresa <b>Alianza Capital</b> representada por el colaborador, <b>${collaboratorFullName}</b>, identificado con <b>${documentType}</b> número <b>${documentNumber}</b>.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Esta excepción se aplica por una de las siguientes razones, según corresponda al caso:</p><ul style=\\"font-size:16px;line-height:1.8;padding-left:30px\\"><li>Solicitud formal del colaborador.</li><li>Incapacidad médica prolongada.</li><li>Licencia no remunerada.</li><li>Inconsistencias en la información de débito.</li><li>Ajustes administrativos internos.</li><li>Revisión o suspensión temporal del acuerdo de ahorro.</li></ul><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">La decisión <b>aplica exclusivamente para este periodo de nómina</b>, y no implica la cancelación del convenio general de ahorro que el colaborador mantiene con Alianza Capital, salvo indicación contraria futura o formalización expresa del retiro.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Se deja constancia formal de esta comunicación tanto al colaborador como a la entidad receptora, a efectos de claridad y trazabilidad administrativa.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Agradecemos su comprensión y quedamos atentos a cualquier requerimiento adicional.</p><div style=\\"margin-top:40px\\"><p style=\\"font-size:16px\\">Cordial Saludo</p><p style=\\"font-size:16px;font-weight:bold;color:#0066cc\\">ALIANZA CAPITAL</p><p style=\\"font-size:14px;font-weight:bold\\">DPTO. FINANCIERO</p></div><h3 style=\\"font-size:18px;margin-top:40px;border-top:1px solid #e0e0e0;padding-top:20px\\">Información de contacto</h3><ul style=\\"font-size:14px;line-height:1.6;padding-left:20px\\"><li>WhatsApp: 315 779 2999</li><li>Teléfono: 315 779 2999</li><li>Email: <a href=\\"mailto:administracion@alianzacapital.co\\" style=\\"color:#0066cc\\">administracion@alianzacapital.co</a></li></ul><p style=\\"font-size:12px;color:#666;margin-top:30px;padding-top:20px;border-top:1px solid #e0e0e0\\">Este es un mensaje automático, por favor no responda a este correo. Para cualquier consulta, utilice los canales de contacto mencionados anteriormente.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmaildesvinculacinCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var collaboratorName = ffVariables["collaboratorName"];
  var email = ffVariables["email"];
  var documentNumber = ffVariables["documentNumber"];
  var collaboratorFullName = ffVariables["collaboratorFullName"];
  var documentType = ffVariables["documentType"];
  var companyName = ffVariables["companyName"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Notificación de desvinculación del aporte de ahorro de nómina – ${collaboratorName}"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Notificación de desvinculación</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px\\"><p style=\\"font-size:16px\\">Estimado(a) <span style=\\"font-weight:bold\\">${collaboratorName}</span>,</p><p style=\\"font-size:16px\\">Señores <span style=\\"font-weight:bold\\">${companyName}</span>:</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Por medio de la presente, <b>Alianza Capital</b> se permite notificar que el colaborador <b>${collaboratorFullName}</b>, identificado con <b>${documentType}</b> número <b>${documentNumber}</b>, <b>ha sido desvinculado del esquema de ahorro por nómina</b> gestionado a través de nuestra entidad.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Por lo tanto, <b>a partir del periodo de nómina correspondiente al siguiente pago de esta notificación, no deberán realizarse más descuentos ni traslados a nombre de Alianza Capital</b> por este concepto.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Esta decisión ha sido tomada en atención directa del usuario, cumplimiento del acuerdo, modificación voluntaria del plan, etc.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">No obstante, informamos que el usuario podrá continuar realizando aportes de forma personal y directa, si así lo desea. Su capital seguirá rentando normalmente bajo las condiciones pactadas, y contará con acceso continuo a nuestros productos y servicios.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Agradecemos a la empresa abstenerse de realizar nuevos aportes en adelante, y al usuario, le recordamos que puede comunicarse con nosotros para más información o para continuar su proceso de ahorro de forma independiente.</p><div style=\\"margin-top:40px\\"><p style=\\"font-size:16px\\">Cordial Saludo</p><p style=\\"font-size:16px;font-weight:bold;color:#0066cc\\">ALIANZA CAPITAL</p><p style=\\"font-size:14px;font-weight:bold\\">DPTO. FINANCIERO</p></div><h3 style=\\"font-size:18px;margin-top:40px;border-top:1px solid #e0e0e0;padding-top:20px\\">Información de contacto</h3><ul style=\\"font-size:14px;line-height:1.6;padding-left:20px\\"><li>WhatsApp: 315 779 2999</li><li>Teléfono: 315 779 2999</li><li>Email: <a href=\\"mailto:administracion@alianzacapital.co\\" style=\\"color:#0066cc\\">administracion@alianzacapital.co</a></li></ul><p style=\\"font-size:12px;color:#666;margin-top:30px;padding-top:20px;border-top:1px solid #e0e0e0\\">Este es un mensaje automático, por favor no responda a este correo. Para cualquier consulta, utilice los canales de contacto mencionados anteriormente.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailSolicitudNuevaEmpresaCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var email = ffVariables["email"];
  var collaboratorFullName = ffVariables["collaboratorFullName"];
  var companyName = ffVariables["companyName"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Bienvenido a Alianza Capital - ${companyName}"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Bienvenido a Alianza Capital</title></head><body><div style=\\"font-family:Arial,sans-serif;margin:0 auto;padding:0;background-color:#ffffff;max-width:600px\\"><div style=\\"text-align:center;padding:0\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width:100%;max-width:600px;display:block\\"></div><div style=\\"padding:20px\\"><p style=\\"font-size:16px\\">Estimado(a) <span style=\\"font-weight:bold\\"><collaboratorName></span>,</p><p style=\\"font-size:16px\\">Señores <span style=\\"font-weight:bold\\">${companyName}</span>:</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Tu empresa ha tomado una decisión clave para fortalecer el bienestar financiero de sus colaboradores: <b>a partir de ahora, contará con el respaldo de Alianza Capital</b>, una plataforma empresarial especializada en la gestión de ahorro y crédito vía nómina.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Esto significa que, desde nuestro panel empresarial, se administrará de forma centralizada y transparente todo lo relacionado con:</p><div style=\\"margin:20px 0;padding:15px;background-color:#f8f9fa;border-left:4px solid #0066cc;border-radius:4px\\"><p style=\\"font-size:16px;margin:8px 0;color:#0066cc\\"><span style=\\"color:#28a745;font-weight:bold\\">✅</span> Ahorro programado por nómina</p><p style=\\"font-size:16px;margin:8px 0;color:#0066cc\\"><span style=\\"color:#28a745;font-weight:bold\\">✅</span> Pagos y seguimiento de créditos adquiridos</p><p style=\\"font-size:16px;margin:8px 0;color:#0066cc\\"><span style=\\"color:#28a745;font-weight:bold\\">✅</span> Control y reportes en tiempo real para el área de talento humano</p><p style=\\"font-size:16px;margin:8px 0;color:#0066cc\\"><span style=\\"color:#28a745;font-weight:bold\\">✅</span> Autonomía del colaborador para visualizar y gestionar su ahorro</p></div><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\">Esta alianza representa un paso adelante en la forma en que tu organización cuida de sus equipos, permitiendo que cada colaborador pueda construir un respaldo financiero directamente desde su salario, con confianza, seguridad y acompañamiento permanente.</p><p style=\\"font-size:16px;text-align:justify;line-height:1.6\\"><b>Desde Alianza Capital, nos sentimos honrados de ser parte de esta estrategia empresarial.</b> Estamos aquí para ayudarte a crecer, ahorrar y proyectar tu futuro.</p><div style=\\"margin-top:40px;text-align:center;padding:20px;background-color:#e8f4fd;border-radius:8px;border:2px solid #0066cc\\"><p style=\\"font-size:18px;font-weight:bold;color:#0066cc;margin:0\\">¡Bienvenido a tu nuevo futuro financiero!</p></div><div style=\\"margin-top:40px\\"><p style=\\"font-size:16px\\">Cordial Saludo</p><p style=\\"font-size:16px;font-weight:bold;color:#0066cc\\">ALIANZA CAPITAL</p><p style=\\"font-size:14px;font-weight:bold\\">EQUIPO COMERCIAL</p></div><h3 style=\\"font-size:18px;margin-top:40px;border-top:1px solid #e0e0e0;padding-top:20px\\">Información de contacto</h3><ul style=\\"font-size:14px;line-height:1.6;padding-left:20px\\"><li>WhatsApp: 315 779 2999</li><li>Teléfono: 315 779 2999</li><li>Email: <a href=\\"mailto:administracion@alianzacapital.co\\" style=\\"color:#0066cc\\">administracion@alianzacapital.co</a></li></ul><p style=\\"font-size:12px;color:#666;margin-top:30px;padding-top:20px;border-top:1px solid #e0e0e0\\">Este es un mensaje automático, por favor no responda a este correo. Para cualquier consulta, utilice los canales de contacto mencionados anteriormente.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPCopyCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];
  var ahorrosType = ffVariables["ahorrosType"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Código de Registro - Alianza Capital"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Verificación y afiliación de tu cuenta</title></head><body><div style=\\"font-family: Arial, sans-serif; margin: 0 auto; padding: 0; background-color: #ffffff; max-width: 600px;\\"><div style=\\"text-align: center; padding: 0;\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width: 100%; max-width: 600px; display: block;\\"></div><div style=\\"padding: 20px; text-align: center;\\"><p style=\\"font-size: 16px; text-align: left;\\">Hola,</p><p style=\\"font-size: 18px;\\"><span style=\\"font-weight: bold;\\">${name}</span></p><h2 style=\\"font-size: 20px;\\"> ¡Estás a un paso de iniciar una nueva forma de ahorrar!</h2><p style=\\"font-size: 16px; text-align: left;\\">Utiliza el siguiente código para confirmar y aceptar el registro de tus datos en Alianza Capital de Ahorro y Crédito. Esta solicitud fue realizada el <b>${date}</b>.</p><div style=\\"text-align: center; margin: 30px 0;\\"><span style=\\"font-size: 40px; font-weight: bold; letter-spacing: 2px;\\">${otpCode}</span><p style=\\"margin-top: 10px; font-size: 14px;\\">Código OTP</p></div><h3 style=\\"font-size: 18px; text-align: left;\\">Enlaces importantes</h3><ul style=\\"font-size: 14px; line-height: 3; text-align: left; padding-left: 20px;\\"><li>Link de políticas de privacidad <a href=\\"https://alianzacapital.co/politica-de-privacidad.html\\" target=\\"_blank\\">https://alianzacapital.co/politica-de-privacidad.html</a></li><li>Link de términos y condiciones <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\" target=\\"_blank\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul><h3 style=\\"font-size: 18px; text-align: left; margin-top: 30px;\\">Declaración y aceptación</h3><ul style=\\"font-size: 14px; line-height: 1.6; text-align: left; padding-left: 20px;\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones, como también las políticas de privacidad y normatividad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul><p style=\\"font-size: 14px; font-weight: bold; text-align: left; margin-top: 30px;\\">IMPORTANTE:</p><p style=\\"font-size: 14px; text-align: left;\\">Si no has solicitado este código de registro, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportamos este caso.</p></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailResetOTPCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Restablecimiento de contraseña"
    }
  ],
  "from": {
    "email": "notificaciones@alianzacapital.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Restablece tu contraseña</title></head><body><div style=\\"font-family: Arial, sans-serif; margin: 0 auto; padding: 0; background-color: #ffffff; max-width: 600px;\\"><div style=\\"text-align: center; padding: 0;\\"><img src=\\"${imageURL}\\" alt=\\"IMAGEN\\" style=\\"width: 100%; max-width: 600px; display: block;\\"></div><div style=\\"padding: 20px;\\"><p style=\\"font-size: 16px; text-align: left;\\">Hola,</p><p style=\\"font-size: 18px; text-align: center;\\"><span style=\\"font-weight: bold;\\">${name}</span></p><p style=\\"font-size: 20px; text-align: center;\\">Restablece tu contraseña</p><p style=\\"font-size: 16px; text-align: left;\\">Parece que has olvidado tu contraseña, utiliza el siguiente código para confirmar y aceptar la recuperación de acceso a tus datos en el aplicativo móvil de Alianza Capital de Ahorro y Crédito.</p><div style=\\"text-align: center; margin: 30px 0;\\"><span style=\\"font-size: 40px; font-weight: bold; letter-spacing: 2px;\\">${otpCode}</span><p style=\\"margin-top: 10px; font-size: 14px;\\">Código OTP</p></div><p style=\\"font-size: 14px; text-align: left;\\"><strong>IMPORTANTE:</strong> Si no ha solicitado este código de restablecimiento de contraseña, por favor comuníquese inmediatamente a nuestras líneas de atención al WhatsApp 315 779 2999 y reportarnos este caso.</p><h3 style=\\"font-size: 15px; text-align: left; margin-top: 30px; margin-left: 44px;\\">Enlaces importantes</h3><ul style=\\"font-size: 14px; line-height: 2.5; text-align: left; margin-left: 44px;\\"><li>Link de reglamento de políticas de privacidad <a href=\\"https://alianzacapital.co/politica-de-privacidad.html\\" target=\\"_blank\\">https://alianzacapital.co/politica-de-privacidad.html</a></li></ul><h3 style=\\"font-size: 15px; text-align: left; margin-top: 30px; margin-left: 44px;\\">Declaración y aceptación</h3><ul style=\\"font-size: 14px; line-height: 2.5; text-align: left; margin-left: 44px;\\"><li>Tenga en cuenta que este código es personal e intransferible y es válido únicamente para una sola transacción.</li><li>Al utilizar este código confirmas que has leído, comprendido y aceptado las políticas de privacidad. Además, declaras conocer, comprender, que conociste de manera previa y completa las características, de lo anteriormente mencionado.</li><li>Si no estás de acuerdo con esto y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999, también al correo electrónico <a href=\\"mailto:administracion@alianzacapital.co\\">administracion@alianzacapital.co</a>.</li></ul></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPEditNominaCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Cambio de monto en el aporte de nómina"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Cambio de monto en el aporte de nómina</title></head><body><div style=\\"font-family: Arial, sans-serif; margin: 0; padding: 0;\\"><div style=\\"background-color: #f4f4f4; padding: 20px;\\"><div style=\\"background-color: #ffffff; border-radius: 5px; padding: 20px; max-width: 520px; width: 100%;\\"><div style=\\"text-align: center;\\"><img src=\\"${imageURL}\\" alt=\\"Alianza\\" style=\\"width: 100%; max-width: 440px;\\"></div><h2 style=\\"text-align: center;\\">Cambio de monto en el aporte de nómina.</h2><p style=\\"font-size: 16px;\\">${name}, utiliza la siguiente clave para confirmar y aceptar el cambio de monto en tu cuenta de ahorro nómina, la cual fue solicitada el ${date}.</p><div style=\\"text-align: center; margin: 20px 0;\\"><span style=\\"font-size: 24px; font-weight: bold;\\">${otpCode}</span></div><ul style=\\"font-size: 14px; line-height: 1.5; padding-left: 20px; margin-top: 20px;\\"><li style=\\"margin-bottom: 16px;\\">Tenga en cuenta que este código es personal e intransferible.</li><li style=\\"margin-bottom: 16px;\\">Al utilizar este código confirmas que has leído, comprendido y aceptado los términos y condiciones del <a href=\\"link_to_reglamento_linea_de_ahorros\\">reglamento linea de ahorros</a> que abres. Además, declaras conocer, comprender, que conociste de manera previa y completa las características de la línea de ahorro.</li><li style=\\"margin-bottom: 16px;\\">Si no está de acuerdo con esto o no y deseas hablar con nosotros, comuníquese con nuestra línea de atención llamando al 315 779 2999 o escribiendo al WhatsApp 315 779 2999.</li><li style=\\"margin-bottom: 16px;\\">Este código sólo es válido una vez, por única transacción.</li></ul></div></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridAccountConfirmationCall(context, ffVariables) {
  var imageURL = ffVariables["imageURL"];
  var name = ffVariables["name"];
  var date = ffVariables["date"];
  var otpCode = ffVariables["otpCode"];
  var email = ffVariables["email"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Vinculación Exitosa - Alianza Capital Empresas"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<!DOCTYPE html><html lang=\\"es\\"><head><meta charset=\\"UTF-8\\"><meta name=\\"viewport\\" content=\\"width=device-width, initial-scale=1.0\\"><title>Vinculación Exitosa - Alianza Capital Empresas</title></head><body><div style=\\"font-family: Arial, sans-serif; margin: 0; padding: 0;\\"><div style=\\"background-color: #f4f4f4; padding: 20px;\\"><div style=\\"background-color: #ffffff; border-radius: 5px; padding: 20px; max-width: 600px; width: 100%;\\"><p style=\\"text-align: left;\\">Hola,</p><h2 style=\\"text-align: center; font-weight: bold;\\">${name}</h2><h1 style=\\"font-size: 16px; text-align: left;\\">¡Bienvenido a Alianza Capital!</h1><p style=\\"font-size: 16px; color: #000000; text-align: left;\\">Es un placer darles la bienvenida a esta nueva etapa de crecimiento y bienestar financiero. Nos llena de orgullo que hayan decidido confiar en Alianza Capital como su aliado para fomentar el ahorro entre sus colaboradores.</p><p style=\\"font-size: 16px; color: #000000; text-align: left;\\">A través de este programa de ahorro, tendrán la oportunidad de construir un futuro más sólido, alcanzar sus metas personales y disfrutar de los beneficios exclusivos que hemos diseñado especialmente para ustedes. Nuestro compromiso es acompañarlos en cada paso, brindándoles herramientas, asesoría y soluciones financieras adaptadas a sus necesidades.</p><div style=\\"text-align: center;\\"><img src=\\"https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/email%20image.png?alt=media&token=bfe48779-ff08-4cca-aab0-25dfd0838892\\" alt=\\"Alianza Capital\\" style=\\"width: 100%; max-width: 500px;\\"></div><p style=\\"font-size: 16px; color: #000000; text-align: left;\\">Esta solicitud fue realizada el <span style=\\"background-color: #00BFFF; color: #ffffff; padding: 4px 8px; border-radius: 3px;\\">${date}</span>.</p><h3 style=\\"text-align: left;\\">Enlaces importantes</h3><ul style=\\"font-size: 14px; line-height: 1.5; padding-left: 20px; margin-top: 20px; text-align: left;\\"><li>Link de políticas de privacidad <a href=\\"https://alianzacapital.co/politica-de-privacidad.html\\">https://alianzacapital.co/politica-de-privacidad.html</a></li><li>Link de términos y condiciones <a href=\\"https://alianzacapital.co/terminos-y-condiciones.html\\">https://alianzacapital.co/terminos-y-condiciones.html</a></li></ul></div></div></div></body></html>"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _sendGridEmailOTPAllModelsCall(context, ffVariables) {
  var email = ffVariables["email"];
  var html = ffVariables["html"];

  var url = `https://api.sendgrid.com/v3/mail/send`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: sendgridBearer(),
  };
  var params = {};
  var ffApiRequestBody = `
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${email}"
        }
      ],
      "subject": "Verificación y afiliación de tu cuenta"
    }
  ],
  "from": {
    "email": "notificaciones@alianzasolidaria.co"
  },
  "reply_to": {
    "email": "solidariaalianza@gmail.com"
  },
  "content": [
    {
      "type": "text/html",
      "value": "${html}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _initiateSignatureCall(context, ffVariables) {
  var name = ffVariables["name"];
  var pdfString = ffVariables["pdfString"];
  var externalId = ffVariables["externalId"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var redirectURL = ffVariables["redirectURL"];

  var url = `https://api.zapsign.com.br/api/v1/docs/`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "verification.pdf",
  "base64_pdf": "${pdfString}",
  "external_id": "${externalId}",
  "lang": "es",
  "signers": [
    {
      "name": "${name}",
      "email": "${email}",
      "auth_mode": "assinaturaTela-tokenEmail",
      "send_automatic_email": false,
      "send_automatic_whatsapp": false,
      "order_group": null,
      "custom_message": "",
      "phone_country": "57",
      "phone_number": "${phone}",
      "lock_email": false,
      "blank_email": false,
      "hide_email": false,
      "lock_phone": false,
      "blank_phone": false,
      "hide_phone": false,
      "lock_name": false,
      "require_cpf": false,
      "cpf": "",
      "require_selfie_photo": true,
      "require_document_photo": true,
      "selfie_validation_type": "liveness-document-match",
      "selfie_photo_url": "",
      "document_photo_url": "",
      "document_verse_photo_url": "",
      "qualification": "",
      "external_id": "",
      "redirect_link": "${redirectURL}",
      "advanced": {
        "face_recognition": true,
        "document_verification": {
          "front": true,
          "back": true
        }
      }
    }
  ],
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "brand_name": "",
  "folder_path": "/",
  "created_by": "",
  "date_limit_to_sign": null,
  "signature_order_active": false,
  "observers": [
    "kingeloks10@gmail.com"
  ],
  "reminder_every_n_days": 0,
  "allow_refuse_signature": false,
  "disable_signers_get_original_file": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _initiateSignatureCopyCopyCall(context, ffVariables) {
  var name = ffVariables["name"];
  var pdfString = ffVariables["pdfString"];
  var externalId = ffVariables["externalId"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var redirectURL = ffVariables["redirectURL"];

  var url = `https://api.zapsign.com.br/api/v1/docs/`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "empresaRep.pdf",
  "base64_pdf": "${pdfString}",
  "external_id": "${externalId}",
  "lang": "es",
  "signers": [
    {
      "name": "${name}",
      "email": "${email}",
      "auth_mode": "assinaturaTela-tokenEmail",
      "send_automatic_email": false,
      "send_automatic_whatsapp": false,
      "order_group": null,
      "custom_message": "",
      "phone_country": "57",
      "phone_number": "${phone}",
      "lock_email": false,
      "blank_email": false,
      "hide_email": false,
      "lock_phone": false,
      "blank_phone": false,
      "hide_phone": false,
      "lock_name": false,
      "require_cpf": false,
      "cpf": "",
      "require_selfie_photo": true,
      "require_document_photo": true,
      "selfie_validation_type": "liveness-document-match",
      "selfie_photo_url": "",
      "document_photo_url": "",
      "document_verse_photo_url": "",
      "qualification": "",
      "external_id": "",
      "redirect_link": "${redirectURL}"
    }
  ],
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "brand_name": "",
  "folder_path": "/",
  "created_by": "",
  "date_limit_to_sign": null,
  "signature_order_active": false,
  "observers": [
    "kingeloks10@gmail.com"
  ],
  "reminder_every_n_days": 0,
  "allow_refuse_signature": false,
  "disable_signers_get_original_file": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _initiateSignatureCopyCall(context, ffVariables) {
  var name = ffVariables["name"];
  var pdfString = ffVariables["pdfString"];
  var externalId = ffVariables["externalId"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var redirectURL = ffVariables["redirectURL"];

  var url = `https://api.zapsign.com.br/api/v1/docs/`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "ahorro1.pdf",
  "base64_pdf": "${pdfString}",
  "external_id": "${externalId}",
  "lang": "es",
  "signers": [
    {
      "name": "${name}",
      "email": "${email}",
      "phone_country": "57",
      "phone_number": "${phone}",
      "auth_mode": "assinaturaTela-tokenEmail",
      "send_automatic_email": false,
      "send_automatic_whatsapp": false,
      "order_group": null,
      "custom_message": "",
      "lock_email": false,
      "blank_email": false,
      "hide_email": false,
      "lock_phone": false,
      "blank_phone": false,
      "hide_phone": false,
      "lock_name": false,
      "require_cpf": false,
      "cpf": "",
      "require_selfie_photo": false,
      "require_document_photo": false,
      "selfie_validation_type": "",
      "selfie_photo_url": "",
      "document_photo_url": "",
      "document_verse_photo_url": "",
      "qualification": "",
      "external_id": "",
      "redirect_link": "${redirectURL}"
    }
  ],
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "brand_name": "",
  "folder_path": "/",
  "created_by": "",
  "date_limit_to_sign": null,
  "signature_order_active": false,
  "observers": ["kingeloks10@gmail.com"],
  "reminder_every_n_days": 0,
  "allow_refuse_signature": false,
  "disable_signers_get_original_file": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _cDATFirmaZapsignCall(context, ffVariables) {
  var name = ffVariables["name"];
  var pdfString = ffVariables["pdfString"];
  var externalId = ffVariables["externalId"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var redirectURL = ffVariables["redirectURL"];

  var url = `https://api.zapsign.com.br/api/v1/docs/`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "cdat.pdf",
  "base64_pdf": "${pdfString}",
  "external_id": "${externalId}",
  "lang": "es",
  "signers": [
    {
      "name": "${name}",
      "email": "${email}",
      "auth_mode": "assinaturaTela-tokenEmail",
      "send_automatic_email": false,
      "send_automatic_whatsapp": false,
      "order_group": null,
      "custom_message": "",
      "phone_country": "57",
      "phone_number": "${phone}",
      "lock_email": false,
      "blank_email": false,
      "hide_email": false,
      "lock_phone": false,
      "blank_phone": false,
      "hide_phone": false,
      "lock_name": false,
      "require_cpf": false,
      "cpf": "",
      "require_selfie_photo": false,
      "require_document_photo": false,
      "selfie_validation_type": "",
      "selfie_photo_url": "",
      "document_photo_url": "",
      "document_verse_photo_url": "",
      "qualification": "",
      "external_id": "",
      "redirect_link": "${redirectURL}",
      "advanced": {
        "face_recognition": false,
        "document_verification": {
          "front": false,
          "back": false
        }
      }
    }
  ],
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "brand_name": "",
  "folder_path": "/",
  "created_by": "",
  "date_limit_to_sign": null,
  "signature_order_active": false,
  "observers": [
    "kingeloks10@gmail.com"
  ],
  "reminder_every_n_days": 0,
  "allow_refuse_signature": false,
  "disable_signers_get_original_file": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _initiateSignatureCopyCopyCopyCall(context, ffVariables) {
  var name = ffVariables["name"];
  var pdfString = ffVariables["pdfString"];
  var externalId = ffVariables["externalId"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var redirectURL = ffVariables["redirectURL"];

  var url = `https://api.zapsign.com.br/api/v1/docs/`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "ahorro1.pdf",
  "base64_pdf": "${pdfString}",
  "external_id": "${externalId}",
  "lang": "es",
  "signers": [
    {
      "name": "${name}",
      "email": "${email}",
      "auth_mode": "assinaturaTela-tokenEmail",
      "send_automatic_email": false,
      "send_automatic_whatsapp": false,
      "order_group": null,
      "custom_message": "",
      "phone_country": "57",
      "phone_number": "${phone}",
      "lock_email": false,
      "blank_email": false,
      "hide_email": false,
      "lock_phone": false,
      "blank_phone": false,
      "hide_phone": false,
      "lock_name": false,
      "require_cpf": false,
      "cpf": "",
      "require_selfie_photo": false,
      "require_document_photo": false,
      "selfie_validation_type": "",
      "selfie_photo_url": "",
      "document_photo_url": "",
      "document_verse_photo_url": "",
      "qualification": "",
      "external_id": "",
      "redirect_link": "${redirectURL}"
    }
  ],
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "brand_name": "",
  "folder_path": "/",
  "created_by": "",
  "date_limit_to_sign": null,
  "signature_order_active": false,
  "observers": [
    "kingeloks10@gmail.com"
  ],
  "reminder_every_n_days": 0,
  "allow_refuse_signature": false,
  "disable_signers_get_original_file": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getDocumentDetailsCall(context, ffVariables) {
  var token = ffVariables["token"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInVerificationPDFCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 0,
      "relative_position_bottom": 8,
      "relative_position_left": 45,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInNominaPDFCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 0,
      "relative_position_bottom": 23,
      "relative_position_left": 45,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 1,
      "relative_position_bottom": 36,
      "relative_position_left": 45,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 9,
      "relative_position_bottom": 43,
      "relative_position_left": 45,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInCDATCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 0,
      "relative_position_bottom": 20,
      "relative_position_left": 15,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 1,
      "relative_position_bottom": 20,
      "relative_position_left": 15,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInNominaPDFNuevaCopyCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 0,
      "relative_position_bottom": 20,
      "relative_position_left": 50,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 1,
      "relative_position_bottom": 20,
      "relative_position_left": 50,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 4,
      "relative_position_bottom": 20,
      "relative_position_left": 50,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInNominaPDFCopyCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 2,
      "relative_position_bottom": 25,
      "relative_position_left": 11,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _placeSignatureInAhorroPDFsCall(context, ffVariables) {
  var token = ffVariables["token"];
  var signerToken = ffVariables["signerToken"];

  var url = `https://api.zapsign.com.br/api/v1/docs/${token}/place-signatures`;
  var headers = {
    Authorization: `Bearer 6266a1e9-d8b0-44fc-bd2a-7a28456c49f10569f19b-f731-4783-9679-2130dd3c9d52`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "rubricas": [
    {
      "page": 0,
      "relative_position_bottom": 23,
      "relative_position_left": 42,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    },
    {
      "page": 8,
      "relative_position_bottom": 43,
      "relative_position_left": 42,
      "relative_size_x": 15,
      "relative_size_y": 5,
      "type": "signature",
      "signer_token": "${signerToken}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    SendGridEmailOTPahorroCall: _sendGridEmailOTPahorroCall,
    SendGridEmailOTPahorroCopyCall: _sendGridEmailOTPahorroCopyCall,
    SendGridEmailOTPCopyCopyCall: _sendGridEmailOTPCopyCopyCall,
    SendGridEmailOTPCDATCall: _sendGridEmailOTPCDATCall,
    SendGridEmailOTPcambiodeestadoCall: _sendGridEmailOTPcambiodeestadoCall,
    SendGridEmailNovedadSaldoClienteCall: _sendGridEmailNovedadSaldoClienteCall,
    SendGridEmailNovedadSaldoCall: _sendGridEmailNovedadSaldoCall,
    SendGridEmailExcepciondepagoCall: _sendGridEmailExcepciondepagoCall,
    SendGridEmaildesvinculacinCall: _sendGridEmaildesvinculacinCall,
    SendGridEmailSolicitudNuevaEmpresaCall:
      _sendGridEmailSolicitudNuevaEmpresaCall,
    SendGridEmailOTPCopyCall: _sendGridEmailOTPCopyCall,
    SendGridEmailResetOTPCall: _sendGridEmailResetOTPCall,
    SendGridEmailOTPEditNominaCall: _sendGridEmailOTPEditNominaCall,
    SendGridAccountConfirmationCall: _sendGridAccountConfirmationCall,
    SendGridEmailOTPAllModelsCall: _sendGridEmailOTPAllModelsCall,
    InitiateSignatureCall: _initiateSignatureCall,
    InitiateSignatureCopyCopyCall: _initiateSignatureCopyCopyCall,
    InitiateSignatureCopyCall: _initiateSignatureCopyCall,
    CDATFirmaZapsignCall: _cDATFirmaZapsignCall,
    InitiateSignatureCopyCopyCopyCall: _initiateSignatureCopyCopyCopyCall,
    GetDocumentDetailsCall: _getDocumentDetailsCall,
    PlaceSignatureInVerificationPDFCall: _placeSignatureInVerificationPDFCall,
    PlaceSignatureInNominaPDFCall: _placeSignatureInNominaPDFCall,
    PlaceSignatureInCDATCall: _placeSignatureInCDATCall,
    PlaceSignatureInNominaPDFNuevaCopyCall:
      _placeSignatureInNominaPDFNuevaCopyCall,
    PlaceSignatureInNominaPDFCopyCall: _placeSignatureInNominaPDFCopyCall,
    PlaceSignatureInAhorroPDFsCall: _placeSignatureInAhorroPDFsCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
