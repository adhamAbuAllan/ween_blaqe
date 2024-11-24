import 'package:flutter/cupertino.dart';

// import 'package:ween_blaqe/features/user/provider/auth_provider.dart';


class Validator {
  static String? validatePhone(String value) {
    debugPrint("value phone validate = $value");
    if (value.isEmpty) return 'fill_field';
    if (!value.startsWith('97')) {
      return "phone number should start with country code";
    }
    if (value.length > 12 || value.length < 12) {
      return "the phone number is not suitable";
    }

    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'fill_field';

    return null;
  }

  static String? validateRegPhone(String value) {
    //Reg => registration

    if (value.isEmpty) return 'fill_field';
    if (value.length > 9 || value.length < 9) {
      return "the phone number is not suitable";
    }

    return null;
  }

  static String? validateRegPassword(String value) {
    if (value.isEmpty) return 'fill_field';

    if (value.length < 6) return 'weak_password';

    return null;
  }

  static String? validateUsername(String value) {
    if (value.isEmpty) return 'fill_field';
    if (value.contains(RegExp(r'[^a-zA-Z0-9]'))) {
      return 'Username must not contain special characters'; //should not have symbols
    }
    // if (value.length < 3) return 'Username must be at least 3 characters';
    return null;
  }

  static String? validateUpdatePhoneNumber(String value, {String? apiValue}) {
    if (value.length > 9 || value.length < 9) {
      return "the phone number is not"
          " suitable";
    }
    if (value.contains(RegExp(r'[^0-9]'))) {
      return 'phone number must not contain special characters';
    }

    return null;
  }

  static String? validateField(
    String fieldKey,
    String value,
  ) {
    switch (fieldKey) {
      case 'phone':
        return validatePhone(value);
      case 'password':
        return validatePassword(value);
      case 'username':
        return validateUsername(value);
      case 'phoneNumberRegistration':
        return validateRegPhone(value);
      case "passwordRegistration":
        return validateRegPassword(value);

      default:
        return null;
    }
  }
}
