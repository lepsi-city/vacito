import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:vacito/core/view_models/result.dart';

class ResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<ResultViewModel>.reactive(
        viewModelBuilder: () => ResultViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: Text("Vacito")),
          body: Column(
            children: <Widget>[

            ],
          ),
        )
    );
  }
}
