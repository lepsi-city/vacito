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
import 'package:intl/intl.dart';

class ResultViewModel extends ChangeNotifier {
  Hc1 hc1 = Hc1();
  late DgcV1 dgc;
  late Names names;
  late V v;
  bool verified = false;
  var format = new DateFormat('d. M. y');
  late String validFrom;
  late String validTo;


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
    validFrom = DateFormat('d. M. y').format(DateTime.fromMillisecondsSinceEpoch(hc1.issuedAt ?? 0)).toString();
    validTo = DateFormat('d. M. y').format(DateTime.fromMillisecondsSinceEpoch(hc1.expirationTime ?? 0)).toString();

  }

  @override
  void dispose() {
    super.dispose();
  }
}
