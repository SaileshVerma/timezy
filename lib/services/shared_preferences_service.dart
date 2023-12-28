import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezy/utils/app_config.dart';

class StorageData {
  static Future setAttemptCurrentValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('attemptValue', val);
  }

  static Future getAttemptCurrentValue() async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt('attemptValue');

    return val ?? AppConfig.totalAttempt;
  }

  static Future setCurrentScoreValue(val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('scoreValue', val);
  }

  static Future getCurrentScoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getInt('scoreValue');

    return val ?? 0;
  }

  static Future clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
