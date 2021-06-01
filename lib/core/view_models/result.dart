import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:dart_base45/dart_base45.dart';
import 'dart:io';
import 'package:cbor/cbor.dart';
import 'package:dart_cose/dart_cose.dart';
import 'package:typed_data/typed_data.dart';

class ResultViewModel extends ChangeNotifier {
  Map<dynamic, dynamic>? covidData;
  bool verified = false;


  void init() {

  }

  @override
  void dispose() {
    super.dispose();
  }
}
