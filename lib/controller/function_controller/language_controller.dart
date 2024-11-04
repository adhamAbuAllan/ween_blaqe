import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/main.dart';
class LanguageController extends GetxController {
  void changeLanguage(String langCode, BuildContext context) {
    Locale? _temp;
    switch (langCode) {
      case 'en':
        _temp = Locale(
          langCode,
          'US',
        );
        break;
      case 'ar':
        _temp = Locale(
          langCode,
          'JO',
        );
        break;
      default:
    }
    OwnMaterialApp.setLocale(context, _temp!);
  }

}
