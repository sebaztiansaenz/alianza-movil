import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'credito_pdf_assets.dart';
import 'credito_pdf_pagare_layout.dart';
import 'credito_pdf_shared.dart';

/// Pagaré (2 páginas fijas) + carta de instrucciones — diseño FlutterFlow.
Future<Uint8List> buildPagarePdf({
  required String tipoLineaCredito,
  required String numeroPagare,
  required String fechaApertura,
  required String nombresPrincipal,
  required String tipoDocumentoPrincipal,
  required String numeroDocumentoPrincipal,
  required String fechaExpedicionPrincipal,
  required String ciudadExpedicionPrincipal,
  required String direccionResidenciaPrincipal,
  required String ciudadResidenciaPrincipal,
  required String barrioPrincipal,
  required String correoElectronicoPrincipal,
  required String whatsappPrincipal,
  required String otroTelefonoPrincipal,
  required String nombresCodeudor,
  required String tipoDocumentoCodeudor,
  required String numeroDocumentoCodeudor,
  required String fechaExpedicionCodeudor,
  required String ciudadExpedicionCodeudor,
  required String direccionResidenciaCodeudor,
  required String ciudadResidenciaCodeudor,
  required String barrioCodeudor,
  required String correoElectronicoCodeudor,
  required String whatsappCodeudor,
  required String otroTelefonoCodeudor,
  required String valorCapitalLetras,
  required String valorCapitalNumeros,
  required String valorInteresesLetras,
  required String valorInteresesNumeros,
  required String diaPagare,
  required String mesPagare,
  required String anioPagare,
  required String ciudadSuscripcion,
  required String departamentoSuscripcion,
  required String ciudadCumplimiento,
  required String diaCumplimiento,
  required String mesCumplimiento,
  required String anioCumplimiento,
}) async {
  await creditoPdfEnsureFonts();
  final pdf = creditoPdfNewDocument();
  final assets = await creditoPdfLoadAssets();
  creditoPdfAddPagarePages(
    pdf,
    assets: assets,
    tipoLineaCredito: tipoLineaCredito,
    numeroPagare: numeroPagare,
    fechaApertura: fechaApertura,
    nombresPrincipal: nombresPrincipal,
    tipoDocumentoPrincipal: tipoDocumentoPrincipal,
    numeroDocumentoPrincipal: numeroDocumentoPrincipal,
    fechaExpedicionPrincipal: fechaExpedicionPrincipal,
    ciudadExpedicionPrincipal: ciudadExpedicionPrincipal,
    direccionResidenciaPrincipal: direccionResidenciaPrincipal,
    ciudadResidenciaPrincipal: ciudadResidenciaPrincipal,
    barrioPrincipal: barrioPrincipal,
    correoElectronicoPrincipal: correoElectronicoPrincipal,
    whatsappPrincipal: whatsappPrincipal,
    otroTelefonoPrincipal: otroTelefonoPrincipal,
    nombresCodeudor: nombresCodeudor,
    tipoDocumentoCodeudor: tipoDocumentoCodeudor,
    numeroDocumentoCodeudor: numeroDocumentoCodeudor,
    fechaExpedicionCodeudor: fechaExpedicionCodeudor,
    ciudadExpedicionCodeudor: ciudadExpedicionCodeudor,
    direccionResidenciaCodeudor: direccionResidenciaCodeudor,
    ciudadResidenciaCodeudor: ciudadResidenciaCodeudor,
    barrioCodeudor: barrioCodeudor,
    correoElectronicoCodeudor: correoElectronicoCodeudor,
    whatsappCodeudor: whatsappCodeudor,
    otroTelefonoCodeudor: otroTelefonoCodeudor,
    valorCapitalLetras: valorCapitalLetras,
    valorCapitalNumeros: valorCapitalNumeros,
    valorInteresesLetras: valorInteresesLetras,
    valorInteresesNumeros: valorInteresesNumeros,
    diaPagare: diaPagare,
    mesPagare: mesPagare,
    anioPagare: anioPagare,
    ciudadSuscripcion: ciudadSuscripcion,
    departamentoSuscripcion: departamentoSuscripcion,
    ciudadCumplimiento: ciudadCumplimiento,
    diaCumplimiento: diaCumplimiento,
    mesCumplimiento: mesCumplimiento,
    anioCumplimiento: anioCumplimiento,
  );
  return creditoPdfSave(pdf);
}

pw.Widget _legalPagareBody({
  required String valorCapitalLetras,
  required String valorCapitalNumeros,
  required String valorInteresesLetras,
  required String valorInteresesNumeros,
  required String diaPagare,
  required String mesPagare,
  required String anioPagare,
  required String ciudadSuscripcion,
  required String departamentoSuscripcion,
  required String ciudadCumplimiento,
  required String diaCumplimiento,
  required String mesCumplimiento,
  required String anioCumplimiento,
}) {
  return pw.RichText(
    textAlign: pw.TextAlign.justify,
    text: pw.TextSpan(
      style: pagareBodyStyle(),
      children: [
        const pw.TextSpan(
          text:
              'Yo(nosotros), el(los) abajo firmante(s), mayor(es) de edad, identificado(s) como aparece al firmar, domiciliado(s) en esta ciudad, en adelante el(los) "suscriptor"(es), prometo(emos) autónoma e incondicionalmente pagar al ',
        ),
        pw.TextSpan(text: kCreditoAcreedor, style: pagareBoldStyle()),
        const pw.TextSpan(
          text: ', a su orden o a quien represente sus derechos, la suma de:\n',
        ),
        pw.TextSpan(
          text: '1) $valorCapitalLetras ($valorCapitalNumeros)',
          style: pagareBoldStyle(),
        ),
        const pw.TextSpan(
          text:
              ' pesos moneda legal colombiana, por concepto de capital y otros gastos e intereses de plazo,\n',
        ),
        pw.TextSpan(
          text: '2) $valorInteresesLetras ($valorInteresesNumeros)',
          style: pagareBoldStyle(),
        ),
        const pw.TextSpan(
          text:
              ' pesos moneda legal colombiana, por concepto de intereses corrientes en la fecha,\n',
        ),
        pw.TextSpan(text: '3) Día $diaPagare  Mes $mesPagare  Año $anioPagare\n'),
        pw.TextSpan(
          text:
              '4) Se suscribe este título, en la ciudad de $ciudadSuscripcion  Departamento de $departamentoSuscripcion\n',
        ),
        pw.TextSpan(
          text:
              '5) La presente obligación será cumplida en la ciudad de $ciudadCumplimiento, el día $diaCumplimiento del mes de $mesCumplimiento del año $anioCumplimiento.\n\n',
        ),
        const pw.TextSpan(
          text:
              'En caso de mora o simple retardo en el pago, el(los) suscriptor(es) pagará(n) intereses de mora sobre la suma correspondiente al capital, desde la fecha del vencimiento y hasta la fecha del pago efectivo, liquidados a la(s) tasa(s) que estuviere(n) vigentes como límite máximo a cobrar de acuerdo con la ley, para el período en que persista la mora. Además, a partir de la fecha en que el ',
        ),
        pw.TextSpan(text: kCreditoAcreedor, style: pagareBoldStyle()),
        const pw.TextSpan(
          text:
              ' instaure demanda judicial de cobro del presente pagaré, reconoceré y pagaré intereses moratorios sobre la suma consignada en el numeral (2) de este pagaré, si llevare más de un (1) año en mora, liquidados a la tasa máxima legal permitida.\n\nTodos los impuestos y gastos que se generen con ocasión del otorgamiento o suscripción del presente pagaré y de la ejecución del mismo, y todos los honorarios y gastos profesionales de recaudo que llegaren a surgir, serán a cargo del(los) suscriptor(es). Asimismo, si hubiere lugar a un cobro judicial, será(n) a cargo del(los) suscriptor(es) los gastos y costos de cobranza.\n\nNuestra responsabilidad solidaria e incondicional se extiende a todas las prórrogas, renovaciones o ampliaciones del plazo que ',
        ),
        pw.TextSpan(text: kCreditoAcreedor, style: pagareBoldStyle()),
        const pw.TextSpan(
          text:
              ' otorgue a cualquiera de nosotros y durante las cuales continuará sin modificación alguna nuestra obligación de solucionar solidariamente las deudas aquí contenidas. Los abonos parciales y/o los pagos de intereses que se hagan a este pagaré, los realizará ',
        ),
        pw.TextSpan(text: kCreditoAcreedor, style: pagareBoldStyle()),
        const pw.TextSpan(
          text:
              ' mediante registros sistematizados. El(os) suscriptor(es) acepta(n) como suma(s) adeudada(s), lo que conste por cualquier concepto de capital y/o intereses, registrados en los libros, registros y auxiliares contables del ',
        ),
        pw.TextSpan(text: '$kCreditoAcreedor.', style: pagareBoldStyle()),
      ],
    ),
  );
}

/// Dos páginas A4 fijas (sin MultiPage/footer) para evitar pie de firma arriba del contenido.
void creditoPdfAddPagarePages(
  pw.Document pdf, {
  required CreditoPdfAssets assets,
  required String tipoLineaCredito,
  required String numeroPagare,
  required String fechaApertura,
  required String nombresPrincipal,
  required String tipoDocumentoPrincipal,
  required String numeroDocumentoPrincipal,
  required String fechaExpedicionPrincipal,
  required String ciudadExpedicionPrincipal,
  required String direccionResidenciaPrincipal,
  required String ciudadResidenciaPrincipal,
  required String barrioPrincipal,
  required String correoElectronicoPrincipal,
  required String whatsappPrincipal,
  required String otroTelefonoPrincipal,
  required String nombresCodeudor,
  required String tipoDocumentoCodeudor,
  required String numeroDocumentoCodeudor,
  required String fechaExpedicionCodeudor,
  required String ciudadExpedicionCodeudor,
  required String direccionResidenciaCodeudor,
  required String ciudadResidenciaCodeudor,
  required String barrioCodeudor,
  required String correoElectronicoCodeudor,
  required String whatsappCodeudor,
  required String otroTelefonoCodeudor,
  required String valorCapitalLetras,
  required String valorCapitalNumeros,
  required String valorInteresesLetras,
  required String valorInteresesNumeros,
  required String diaPagare,
  required String mesPagare,
  required String anioPagare,
  required String ciudadSuscripcion,
  required String departamentoSuscripcion,
  required String ciudadCumplimiento,
  required String diaCumplimiento,
  required String mesCumplimiento,
  required String anioCumplimiento,
}) {
  // —— Página 1: E-PAGARÉ + datos + texto legal + pie (orden plantilla) ——
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pagarePageMargin,
      build: (context) => pw.SizedBox(
        height: pagareAlturaUtil(context),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
          pagareHeaderRow(assets, 'E-PAGARÉ Y/O PAGARÉ\nN° $numeroPagare'),
          pw.SizedBox(height: 6),
          pagareSectionHeader('DESCRIPCIÓN DE PRODUCTO'),
          pw.SizedBox(height: 4),
          pw.Row(
            children: [
              pagareField(label: 'Tipo de línea de crédito', value: tipoLineaCredito, flex: 4),
              pagareField(label: 'Fecha de apertura', value: fechaApertura, flex: 2),
            ],
          ),
          pw.SizedBox(height: 4),
          pagareSectionHeader('INFORMACIÓN DEL ASOCIADO Y/O SUSCRIPTOR PRINCIPAL'),
          pw.SizedBox(height: 3),
          pagareFullField(label: 'Nombres y Apellidos', value: nombresPrincipal),
          pw.SizedBox(height: 2),
          pw.Row(
            children: [
              pagareField(label: 'Tipo de documento', value: tipoDocumentoPrincipal),
              pagareField(label: 'Número de documento', value: numeroDocumentoPrincipal),
              pagareField(label: 'Fecha de expedición', value: fechaExpedicionPrincipal),
              pagareField(
                label: 'Ciudad y departamento de expedición',
                value: ciudadExpedicionPrincipal,
                flex: 2,
              ),
            ],
          ),
          pw.SizedBox(height: 2),
          pagareFullField(label: 'Dirección de residencia', value: direccionResidenciaPrincipal),
          pw.SizedBox(height: 2),
          pw.Row(
            children: [
              pagareField(
                label: 'Ciudad y departamento de residencia',
                value: ciudadResidenciaPrincipal,
                flex: 3,
              ),
              pagareField(label: 'Barrio', value: barrioPrincipal),
            ],
          ),
          pw.SizedBox(height: 4),
          pagareSectionHeader(
            'DATOS DE CONTACTO Y FIRMA ELECTRÓNICA DEL ASOCIADO Y/O SUSCRIPTOR PRINCIPAL',
          ),
          pw.SizedBox(height: 3),
          pw.Row(
            children: [
              pagareField(
                label: 'Correo electrónico',
                value: correoElectronicoPrincipal,
                flex: 3,
              ),
              pagareField(label: 'WhatsApp', value: whatsappPrincipal),
              pagareField(label: 'Otro teléfono', value: otroTelefonoPrincipal),
            ],
          ),
          ...pagareBloquesCodeudor(
            nombresCodeudor: nombresCodeudor,
            tipoDocumentoCodeudor: tipoDocumentoCodeudor,
            numeroDocumentoCodeudor: numeroDocumentoCodeudor,
            fechaExpedicionCodeudor: fechaExpedicionCodeudor,
            ciudadExpedicionCodeudor: ciudadExpedicionCodeudor,
            direccionResidenciaCodeudor: direccionResidenciaCodeudor,
            ciudadResidenciaCodeudor: ciudadResidenciaCodeudor,
            barrioCodeudor: barrioCodeudor,
            correoElectronicoCodeudor: correoElectronicoCodeudor,
            whatsappCodeudor: whatsappCodeudor,
            otroTelefonoCodeudor: otroTelefonoCodeudor,
          ),
          pw.SizedBox(height: 6),
          pw.Expanded(
            child: _legalPagareBody(
              valorCapitalLetras: valorCapitalLetras,
              valorCapitalNumeros: valorCapitalNumeros,
              valorInteresesLetras: valorInteresesLetras,
              valorInteresesNumeros: valorInteresesNumeros,
              diaPagare: diaPagare,
              mesPagare: mesPagare,
              anioPagare: anioPagare,
              ciudadSuscripcion: ciudadSuscripcion,
              departamentoSuscripcion: departamentoSuscripcion,
              ciudadCumplimiento: ciudadCumplimiento,
              diaCumplimiento: diaCumplimiento,
              mesCumplimiento: mesCumplimiento,
              anioCumplimiento: anioCumplimiento,
            ),
          ),
          pagareFooter(
            assets: assets,
            paginaLabel: 'Página 1 de 2',
            ccPrincipal: numeroDocumentoPrincipal,
            ccCodeudor: numeroDocumentoCodeudor,
          ),
        ],
        ),
      ),
    ),
  );

  // —— Página 2: carta de instrucciones ——
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pagarePageMargin,
      build: (context) => pw.SizedBox(
        height: pagareAlturaUtil(context),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
          pagareHeaderRow(
            assets,
            'AUTORIZACIÓN PARA DILIGENCIAR EL\nDOCUMENTO CON ESPACIOS EN BLANCO\nPARA SER CONVERTIDO EN PAGARÉ',
          ),
          pw.SizedBox(height: 6),
          pagareSectionHeader('DESCRIPCIÓN DE PRODUCTO'),
          pw.SizedBox(height: 4),
          pw.Row(
            children: [
              pagareField(label: 'Tipo de línea de crédito', value: tipoLineaCredito, flex: 3),
              pagareField(label: 'Número de Pagaré', value: numeroPagare, flex: 2),
            ],
          ),
          pw.SizedBox(height: 6),
          pagareSectionHeader('INFORMACIÓN DEL ASOCIADO Y/O SUSCRIPTOR PRINCIPAL'),
          pw.SizedBox(height: 3),
          pagareFullField(label: 'Nombres y Apellidos', value: nombresPrincipal),
          pw.SizedBox(height: 2),
          pw.Row(
            children: [
              pagareField(label: 'Tipo de documento', value: tipoDocumentoPrincipal),
              pagareField(label: 'Número de documento', value: numeroDocumentoPrincipal),
              pagareField(label: 'Fecha de expedición', value: fechaExpedicionPrincipal),
              pagareField(
                label: 'Ciudad y departamento de expedición',
                value: ciudadExpedicionPrincipal,
                flex: 2,
              ),
            ],
          ),
          ...pagareBloquesCodeudorPagina2(
            nombresCodeudor: nombresCodeudor,
            tipoDocumentoCodeudor: tipoDocumentoCodeudor,
            numeroDocumentoCodeudor: numeroDocumentoCodeudor,
            fechaExpedicionCodeudor: fechaExpedicionCodeudor,
            ciudadExpedicionCodeudor: ciudadExpedicionCodeudor,
          ),
          pw.SizedBox(height: 6),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.justify,
                  text: pw.TextSpan(
                    style: pagareBodyStyle(),
                    children: [
                      const pw.TextSpan(
                        text:
                            'Yo, el(los) abajo firmante(s), mayor(es) de edad, identificado(s) como aparece al firmar, domiciliado(s) en esta ciudad, en adelante el(los) "Suscriptor"(es), por medio del presente escrito y de conformidad con el artículo 622 del Código de Comercio, faculto expresa e irrevocablemente al ',
                      ),
                      pw.TextSpan(text: '$kCreditoAcreedor.', style: pagareBoldStyle()),
                      const pw.TextSpan(
                        text:
                            ' o a quien en el futuro ostente la calidad de acreedor o tenedor legítimo del pagaré identificado como aparece en la parte superior de este documento, para llenar en cualquier tiempo y sin necesidad de previo aviso, todos los espacios en blanco de dicho documento, de conformidad con las siguientes instrucciones:\n\n',
                      ),
                    ],
                  ),
                ),
                pagareNumeral(
                  '1.',
                  'En el espacio antecedido con el número uno (1), se llenará con la cifra en letras y números, adeudada directa o indirectamente por el(los) suscriptor(es) al $kCreditoAcreedor, por concepto de capital en la fecha que sea llenado el pagaré, derivada de cualquier obligación a cargo del(los) suscriptor(es) y a favor del $kCreditoAcreedor, e incluirá además el monto de cualquier otra suma de dinero que el(los) "Suscriptor"(es), deba(n) a $kCreditoAcreedor, debidamente soportada por la entidad, sin atención a su naturaleza o fuente.',
                ),
                pagareNumeral(
                  '2.',
                  'El espacio antecedido con el número dos (2), se llenará con las cifras en letras y números, adeudada por el(los) suscriptor(es) al $kCreditoAcreedor, por concepto de intereses corrientes registrados en los libros, registros y auxiliares contables que reposen en $kCreditoAcreedor. El espacio antecedido con el número tres (3) se llenará con la fecha en que sea llenado el pagaré.',
                ),
                pagareNumeral(
                  '3.',
                  'El pagaré así diligenciado será exigible inmediatamente y prestará mérito ejecutivo sin más requisitos ni requerimientos.',
                ),
                pagareNumeral('4.', 'Ciudad y fecha donde se aplicaría y/o ejecutara el pagare.'),
                pagareNumeral('5.', 'Ciudad y fecha donde se cumplirá la obligación.'),
                pagareNumeral(
                  '6.',
                  '$kCreditoAcreedor podrá diligenciar el presente pagaré en cualquier tiempo y dar por vencidos los plazos, sin que para el efecto sea necesario aviso o requerimiento judicial o extrajudicial ni formalidad previa alguna, en cualquiera de los siguientes casos: a) Mora o incumplimiento en el pago de cualquiera de las cuotas de capital, intereses, comisiones y demás accesorios de cualquiera de las obligaciones a que se hace referencia en el punto primero de este instructivo; b) Si los bienes del(os) suscrito(s) otorgante(s) son embargados o perseguidos por cualquier persona o por el mismo $kCreditoAcreedor, en ejercicio de cualquier acción; c) En caso de muerte o si cualquiera del(los) suscrito(s) otorgante(s) entraran(mos), conjunta o separadamente a concurso de acreedores o liquidación; d) El desacuerdo o falta de aceptación de cualquier reglamento de los productos contratados por el(los) suscriptor(es); e) Devolución de cheque(s) por cualquier causa atribuible al girador y f) El suministro de información inexacta o falsa en la solicitud de crédito o en cualquier documento presentado al $kCreditoAcreedor. Condiciones Especiales: los pagos serán imputados a los siguientes conceptos en su orden: gastos y costas, comisiones, primas de seguro de vida, intereses de mora, intereses corrientes, y finalmente a capital, sin perjuicio de que $kCreditoAcreedor haga uso del arbitrio contenido en el artículo 1653 del Código Civil.',
                ),
                pagareNumeral(
                  '7.',
                  'Aceptamos incondicionalmente todo traspaso, endoso o cesión que $kCreditoAcreedor haga del presente instructivo junto con el pagaré al cual corresponde.',
                ),
                pagareNumeral('8.', 'Hago constar que copia de estas instrucciones quedan en mi poder.'),
              ],
            ),
          ),
          pagareFooter(
            assets: assets,
            paginaLabel: 'Página 2 de 2',
            ccPrincipal: numeroDocumentoPrincipal,
            ccCodeudor: numeroDocumentoCodeudor,
          ),
        ],
        ),
      ),
    ),
  );
}
