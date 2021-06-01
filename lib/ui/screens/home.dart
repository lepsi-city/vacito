import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:vacito/core/view_models/home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          appBar: null,
          body: Container(
            child: Text("something"),
          )
      ),
    );
  }
}
