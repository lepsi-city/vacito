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


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultViewModel extends ChangeNotifier {
  Hc1 hc1 = Hc1();
  late DgcV1 dgc;
  late Names names;
  late V v;
  bool verified = false;
  var format = new DateFormat('d. M. y');
  late String validFrom;
  late String validTo;
  late String vaccinationType;
  late BuildContext context;


  void init(Hc1? hc, BuildContext cxt) {
    context = cxt;
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
    validFrom = DateFormat('y-MM-dd').format(DateTime.fromMillisecondsSinceEpoch((hc1.issuedAt ?? 0 )* 1000 )).toString();
    validTo = DateFormat('y-MM-dd').format(DateTime.fromMillisecondsSinceEpoch((hc1.expirationTime ?? 0) * 1000 )).toString();
    vaccinationType = "";
    switch(v.mp) {
      case "EU/1/20/1528" :
        vaccinationType = "Comirnaty";
        break;
      case "EU/1/20/1507" :
        vaccinationType = "Moderna";
        break;
      case "EU/1/20/1529" :
        vaccinationType = "AstraZeneca";
        break;
      case "EU/1/20/1525" :
        vaccinationType = "Janssen";
        break;
      default:
        vaccinationType = AppLocalizations.of(context)!.unknown;
        break;
    }

  }

  @override
  void dispose() {
    super.dispose();
  }
}
