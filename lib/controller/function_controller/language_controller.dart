import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/sesstion/new_session.dart'; // Import your NewSession class

class LanguageController extends GetxController {
  // ... (other code) ...

  void changeLanguage(String langCode, BuildContext context) {
    Locale? _temp;
    switch (langCode) {
      case 'en':
        _temp =const Locale(
          'en',
          'US',
        );
        break;
      case 'ar':
        _temp = const Locale(
          'ar',
          'JO',
        );
        break;
      default:
    }
    Get.updateLocale(_temp!);
    NewSession.save('language', langCode); // Save the language code
  }

  // Function to retrieve the saved language
  String getSavedLanguage() {
    return NewSession.get('language',"en");
  }
}
