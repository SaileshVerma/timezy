import 'package:shared_preferences/shared_preferences.dart';

class StorageData {
  static setAttemptCurrentValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('attemptValue', val);
  }

  static getAttemptCurrentValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt('attemptValue');

    return val;
  }

  static setCurrentScoreValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('scoreValue', val);
  }

  static getCurrentScoreValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt('scoreValue');

    return val;
  }

  static clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
