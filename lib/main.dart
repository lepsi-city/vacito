import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';

import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';


import 'package:vacito/ui/screens/home.dart';

GetIt getIt = GetIt.instance;

Future<void> main() async {
  if (!kReleaseMode) {
    Fimber.plantTree(DebugTree.elapsed());
  }
  await dotenv.load(fileName: "assets/env");

  await SentryFlutter.init(
        (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
    },
    appRunner: () => runApp(MyApp()),
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp>? _initialization;
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();

  @override
  void initState() {
    _initialization = Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Něco se pokazilo", textDirection: TextDirection.ltr,));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'vacito',
              initialRoute: '/',
              navigatorKey: navigatorKey,
              routes: {
                '/': (context) => HomeScreen(),
              },
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        }
      );
  }
}
