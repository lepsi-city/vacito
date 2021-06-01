import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  late SharedPreferences _prefs;
  bool started = false;

  Future<PreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    started = true;
    return this;
  }
}
