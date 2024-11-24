import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/auth_provider.dart';

String newRemovePlusSymbol(WidgetRef ref, String codeCountry, String phoneNumber) {
  // Remove the '+' if present at the start of codeCountry
  String cleanedCodeCountry = codeCountry.replaceFirst(RegExp(r'^\+'), '');

  // Concatenate cleaned code and phone number
  String newValue = cleanedCodeCountry + phoneNumber;

  // Update the state with the modified value
  ref.read(completePhoneNumberReg.notifier).state = newValue;

  // Log the updated phone number
  debugPrint("New value in complete phone number: $newValue");

  return newValue;
}
