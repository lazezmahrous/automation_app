import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'ar';

  Locale get language {
    if (currentLanguage == 'en') {
      return const Locale('en');
    } else if (currentLanguage == 'ar') {
      return const Locale('ar');
    } else {
      return const Locale('ar');
    }
  }
    changeLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('language', language);

    currentLanguage = language;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLanguage = prefs.getString('language') ?? 'ar';
    notifyListeners();
  }
}
