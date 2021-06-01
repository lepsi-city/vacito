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
          body: Column(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Row(children: [Text("Forename:"), Text(model.names.foreName ?? "")]),
                ],
              ),
            ],
          ),
        )
    );
  }
}
