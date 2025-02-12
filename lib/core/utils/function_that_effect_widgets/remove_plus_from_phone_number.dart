import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<String> newRemovePlusSymbol({required WidgetRef ref,required String codeCountry,required String phoneNumber})async {
  // Remove the '+' if present at the start of codeCountry
  String cleanedCodeCountry = codeCountry.replaceFirst(RegExp(r'^\+'), '');

  // Concatenate cleaned code and phone number
  String newValue =  cleanedCodeCountry + phoneNumber;

  // Update the state with the modified value
  phoneNumber = 
   newValue;

  // Log the updated phone number
  debugPrint("New value in complete phone number: $newValue");

  return  newValue;
}
