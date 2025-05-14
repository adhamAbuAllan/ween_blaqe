import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../features/statuses/validate_text_form_field_state.dart';
import '../../../../../../core/utils/function_that_effect_widgets/remove_plus_from_phone_number.dart';
import '../../../../providers/auth_provider.dart';

Future<void> validateAndRegistration(
    WidgetRef ref, BuildContext context) async {
  ref.refresh(formFieldsNotifier)['phoneNumberRegistration']?.error ??
      "no error"; // this check phone
  // value then make refresh , that to check have error
  ref.refresh(formFieldsNotifier)['passwordRegistration']?.error ??
      "no error"; //// this check
// password
  // value then make refresh , that to check have error
  ref.refresh(formFieldsNotifier)['username']?.error ?? "no error";
  String phoneControllerValue = ref.read(phoneRegController).text;
  String passwordControllerValue = ref.read(passwordRegController).text;
  String userNameControllerValue = ref.read(userNameController).text;
  int typeOfUserValue = ref.read(dropdownProvider);
  String selectedCountryCodeValue = ref.read(selectedCountryCode);
  bool? formPhoneState = formPhoneKey.currentState?.validate();
  bool? formPasswordState = formRegPasswordKey.currentState?.validate();
  bool? formUsernameState = formUsernameKey.currentState?.validate();

await   newRemovePlusSymbol(ref: ref,codeCountry:  selectedCountryCodeValue,phoneNumber:  phoneControllerValue);

  ref.read(formFieldsNotifier.notifier).updateValue(
      "phoneNumberRegistration", phoneControllerValue,
      context: context);
  ref.read(formFieldsNotifier.notifier).updateValue(
      "passwordRegistration", passwordControllerValue,
      context: context);
  ref
      .read(formFieldsNotifier.notifier)
      .updateValue("username", userNameControllerValue, context: context);
  String errorPhone =
      ref.read(formFieldsNotifier)["phoneNumberRegistration"]?.error ??
          "no error have";
  String errorPassword =
      ref.read(formFieldsNotifier)["passwordRegistration"]?.error ??
          "no error have";
  String errorUsername = ref.read(formFieldsNotifier)["username"]?.error ??
      "no"
          " error have";
  if (errorUsername != "no error have") {
    formUsernameState;
    return;
  }
  if (errorPhone != "no error have") {
    // debugPrint("formPhoneState is $formPhoneState");
    if (errorPassword == "fill_field") {
      // debugPrint("phone number error is aaa : $errorPhone");
    }
    debugPrint(errorPhone);
    formPhoneState;
    return;
  }

  if (errorPassword != "no error have") {
    formPasswordState;
    return;
  }
  // debugPrint("no error validate from local you have ");
  await ref.read(registerNotifier.notifier).register(
      userNameControllerValue,
      phoneControllerValue,
      passwordControllerValue,
      typeOfUserValue,
      1,
      ref,
      context);
}
