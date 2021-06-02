import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:vacito/core/view_models/result.dart';

import 'package:vacito/core/models/hc1.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.hc1}) : super(key: key);

  final Hc1? hc1;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultViewModel>.reactive(
        viewModelBuilder: () => ResultViewModel(),
        onModelReady: (model) => model.init(hc1),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text("Vacito")),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Row(children: [
                      Text("Date of birth:"),
                      Text(model.dgc.dateOfBirth ?? "")
                    ]),
                    Row(children: [
                      Text("Given name:"),
                      Text(model.names.familyNameT ?? "")
                    ]),
                    Row(children: [
                      Text("Family name:"),
                      Text(model.names.familyNameT ?? "")
                    ]),
                  ],
                ),
              ),
            ));
  }
}
