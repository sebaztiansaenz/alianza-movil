import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

import 'credito_pdf_shared.dart';

const creditoLogoBwUrl =
    'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a';

const creditoSelloUrl =
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/98bwu2s3373e/64af4586-f309-4ab3-aa9d-db083b675bda.jpg';

const creditoVigiladoUrl =
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/70tcb6sabncz/d0b34d06-f023-4b51-a1fa-249512acd7ff.jpg';

/// Logos, sello y pie vigilado (misma carga que custom actions FlutterFlow).
class CreditoPdfAssets {
  CreditoPdfAssets({
    required this.logo,
    required this.logoBw,
    required this.selloBytes,
    required this.vigiladoBytes,
  });

  final pw.MemoryImage logo;
  final pw.MemoryImage logoBw;
  final Uint8List selloBytes;
  final Uint8List vigiladoBytes;
}

Future<CreditoPdfAssets> creditoPdfLoadAssets() async {
  final logo = await creditoPdfLoadLogo(creditoLogoUrl);
  final logoBw = await creditoPdfLoadLogo(creditoLogoBwUrl);

  var selloBytes = Uint8List(0);
  var vigiladoBytes = Uint8List(0);
  try {
    final selloR = await http.get(Uri.parse(creditoSelloUrl));
    if (selloR.statusCode == 200) selloBytes = selloR.bodyBytes;
    final vigR = await http.get(Uri.parse(creditoVigiladoUrl));
    if (vigR.statusCode == 200) vigiladoBytes = vigR.bodyBytes;
  } catch (_) {}

  return CreditoPdfAssets(
    logo: logo,
    logoBw: logoBw,
    selloBytes: selloBytes,
    vigiladoBytes: vigiladoBytes,
  );
}
