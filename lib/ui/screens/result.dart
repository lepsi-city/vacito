import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:vacito/core/view_models/result.dart';

import 'package:vacito/core/models/hc1.dart';

import 'package:vacito/ui/components/resultItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.hc1}) : super(key: key);

  final Hc1? hc1;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultViewModel>.reactive(
        viewModelBuilder: () => ResultViewModel(),
        onModelReady: (model) => model.init(hc1, context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    ResultItem(name: AppLocalizations.of(context)!.verifiedStatusLabel, value: AppLocalizations.of(context)!.verifiedStatus),
                    ResultItem(name: AppLocalizations.of(context)!.dateOfBirth, value: model.dgc.dateOfBirth ?? ""),
                    ResultItem(name: AppLocalizations.of(context)!.givenName, value: model.names.givenName ?? ""),
                    ResultItem(name: AppLocalizations.of(context)!.familyName, value: model.names.familyName ?? ""),
                    ResultItem(name: AppLocalizations.of(context)!.dateOfBirth, value: model.dgc.dateOfBirth ?? ""),
                    ResultItem(name: AppLocalizations.of(context)!.validFrom, value: model.validFrom),
                    ResultItem(name: AppLocalizations.of(context)!.validTo, value: model.validTo),
                    ResultItem(name: AppLocalizations.of(context)!.vaccinationType, value: model.vaccinationType),
                  ],
                ),
              ),
            ));
  }
}
