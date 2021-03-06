import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:vacito/core/view_models/home.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: model.qrKey,
                      onQRViewCreated: model.onQRViewCreated,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: (model.title != null)
                          ? Text(model.title!)
                          : Text(AppLocalizations.of(context)!.scanQrCode),
                    ),
                  )
                ],
              ),
            ));
  }
}
