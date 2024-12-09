import 'package:flutter/cupertino.dart';

import '../../../../constants/localization.dart';

// import 'package:ween_blaqe/features/user/provider/auth_provider.dart';

class Validator {
  static String? validatePhone(String value, BuildContext context) {
    debugPrint("value phone validate = $value");
    if (value.isEmpty) return 'fill_field';
    if (!value.startsWith('97')) {
      return "phone number should start with country code";
    }
    if (value.length > 12 || value.length < 12) {
      return SetLocalization.of(context)
          ?.getTranslateValue("the_phone_number_is_not_suitable");
    }

    return null;
  }

  static String? validatePassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }

    return null;
  }

  static String? validateRegPhone(String value, BuildContext context) {
    //Reg => registration

    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }
    if (value.length > 9 || value.length < 9) {
      return SetLocalization.of(context)
          ?.getTranslateValue("the_phone_number_is_not_suitable");
    }

    return null;
  }

  static String? validateRegPassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }
//
    if (value.length < 6) return SetLocalization.of(context)?.getTranslateValue('weak_password');

    return null;
  }

  static String? validateUsername(String value, BuildContext context) {
    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }

    if (value.contains(RegExp(r'[^a-zA-Z0-9]'))) {
      return SetLocalization.of(context)?.getTranslateValue(
          "username_must_not_contain_special_characters"); //should not have symbols
    }
    // if (value.length < 3) return 'Username must be at least 3 characters';
    return null;
  }

  static String? validateUpdatePhoneNumber(String value, BuildContext context,
      {String? apiValue}) {
    if (value.length > 9 || value.length < 9) {
      return SetLocalization.of(context)
          ?.getTranslateValue("the_phone_number_is_not_suitable");
    }

    if (value.contains(RegExp(r'[^0-9]'))) {
      return SetLocalization.of(context)?.getTranslateValue(
          "phone_number_must_not_contain_special_characters");
    }

    return null;
  }

  static String? validateField(
      String fieldKey, String value, BuildContext context) {
    switch (fieldKey) {
      case 'phone':
        return validatePhone(value, context);
      case 'password':
        return validatePassword(value, context);
      case 'username':
        return validateUsername(value, context);
      case 'phoneNumberRegistration':
        return validateRegPhone(value, context);
      case "passwordRegistration":
        return validateRegPassword(value, context);

      default:
        return null;
    }
  }
}
