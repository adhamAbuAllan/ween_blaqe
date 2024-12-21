import 'package:flutter/cupertino.dart';

import '../../../../../../constants/localization.dart';

// import 'package:ween_blaqe/features/user/provider/auth_provider.dart';
/**
a Validator class for only the login and reg
that here, when and where should text error should user to got it,
so how a validate work ?
the validate work according the String value , that if not empty got me a validate
for e.g , in [validatePhone] that is a method return a String value , if it return
a null value that mean is now error have , and that should to know that the method
itself return a String value according the value of controller of textFormField
that for e.g if it empty then return a String value for [validatePhone]
that I use the switch case in [validateField] to check if any method in Validator class
return a string.
 **/

class Validator {
  ///[validatePhone] that only for login
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
///[validatePassword] that only in login
  static String? validatePassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }

    return null;
  }
///[validateRegPhone] that only in reg
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
  ///[validateRegPassword] that only in reg

  static String? validateRegPassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return SetLocalization.of(context)?.getTranslateValue('fill_field');
    }
//
    if (value.length < 6) return SetLocalization.of(context)?.getTranslateValue('weak_password');

    return null;
  }
  ///[validateUsername] that only in reg

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

/// [validateField] a validateField that check
  ///  [updateValue] have two parameters [fieldKey] and [value]
  ///  a [fieldKey] to put the error in 'if-exist' in current textFormField Widget.
  ///   a[value] to take a value of textFormField controller and then to match it
  ///  in validate method.
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
