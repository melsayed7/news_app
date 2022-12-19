import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', appLanguage);
    notifyListeners();
  }
}
