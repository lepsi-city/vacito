import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:dart_base45/dart_base45.dart';
import 'dart:io';
import 'package:cbor/cbor.dart';
import 'package:dart_cose/dart_cose.dart';
import 'package:typed_data/typed_data.dart';

import 'package:vacito/core/models/hc1.dart';
import 'package:vacito/core/models/dgc_v1.dart';
import 'package:vacito/core/models/names.dart';
import 'package:vacito/core/models/v.dart';

class ResultViewModel extends ChangeNotifier {
  Hc1 hc1 = Hc1();
  late DgcV1 dgc;
  late Names names;
  late V v;
  bool verified = false;

  void init(Hc1? hc) {
    if (hc == null) {
      hc1 = Hc1();
    } else {
      hc1 = hc;
    }
    setVars();
  }

  void setVars() {
    dgc = hc1.certificate!;
    names = dgc.names!;
    v = dgc.v!;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
