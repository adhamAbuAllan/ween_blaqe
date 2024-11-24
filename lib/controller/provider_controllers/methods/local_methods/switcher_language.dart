import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../session/new_session.dart';


class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale('en', 'US'),);

  // Change the language and update state
  void changeLanguage(String langCode, BuildContext context) {
    Locale newLocale;
    switch (langCode) {
      case 'en':
        newLocale = const Locale('en', 'US');
        break;
      case 'ar':
        newLocale = const Locale('ar', 'JO');
        break;
      default:
        return; // Return if the language code is invalid
    }
    state = newLocale; // Update the state
    saveLanguage(langCode); // Save language to persistent storage
  }

  // Save language to persistent storage
  Future<void> saveLanguage(String langCode) async {
     NewSession.save('language', langCode);
  }

  // Load saved language from persistent storage
  Future<void> loadSavedLanguage(BuildContext context) async {
    final savedLanguage =  NewSession.get('language', "en");
    changeLanguage(savedLanguage, context); // Update the state with the saved
    // language
  }
}
