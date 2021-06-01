import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:dart_base45/dart_base45.dart';
import 'dart:io';
import 'package:cbor/cbor.dart';
import 'package:dart_cose/dart_cose.dart';
import 'package:typed_data/typed_data.dart';

import 'package:vacito/core/models/hc1.dart';

import 'package:vacito/ui/screens/result.dart';

class HomeViewModel extends ChangeNotifier {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? title;
  late BuildContext context;


  void init(BuildContext cxt) {
    context = cxt;
    if(controller != null) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        processQr(scanData);
        notifyListeners();

    });
  }

  processQr(Barcode qrcode) {
    print("Format:");
    print(qrcode.format);
    print("Code:");
    print(qrcode.code);

    if(qrcode.format != BarcodeFormat.qrcode) {
      title = "Unknown format";
      return false;
    }
    if(qrcode.code.substring(0, 4) != "HC1:") {
      title = "Unknown format";
      return false;
    }

    var base45_decoded = Base45.decode(qrcode.code.substring(4));

    var inflated = zlib.decode(base45_decoded);

    final result = Cose.decodeAndVerify(
      inflated,
      {
        'kid': '''pem'''
      },
    );
    print(result.payload);
    Hc1 certmodel = Hc1.fromMap(result.payload);
    title = "Waiting...";
    controller!.pauseCamera();
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => ResultScreen(hc1: certmodel)),);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
