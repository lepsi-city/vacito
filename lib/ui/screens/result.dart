import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:vacito/core/view_models/result.dart';

import 'package:vacito/core/models/hc1.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.hc1}) : super(key: key);

  final Hc1? hc1;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultViewModel>.reactive(
        viewModelBuilder: () => ResultViewModel(),
        onModelReady: (model) => model.init(hc1),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Row(children: [
                      Text(AppLocalizations.of(context)!.dateOfBirth),
                      Text(model.dgc.dateOfBirth ?? "")
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.givenName),
                      Text(model.names.givenNameT ?? "")
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.familyName),
                      Text(model.names.familyNameT ?? "")
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.validFrom),
                      Text(model.validFrom)
                    ]),
                    Row(children: [
                      Text(AppLocalizations.of(context)!.validTo),
                      Text(model.validTo)
                    ]),
                  ],
                ),
              ),
            ));
  }
}
