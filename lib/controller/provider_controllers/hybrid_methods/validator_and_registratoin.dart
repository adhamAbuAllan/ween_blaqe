import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../features/statuses/validate_text_form_field_state.dart';
import '../../../core/utils/function_that_effect_widgets/remove_plus_from_phone_number.dart';
import '../../../features/user/provider/auth_provider.dart';

void validateAndRegistration(WidgetRef ref, BuildContext context) async {
    ref.refresh(formFieldsNotifier)['phoneNumberRegistration']?.error ??
      "no error"; // this check phone
  // value then make refresh , that to check have error
    ref.refresh(formFieldsNotifier)['passwordRegistration']?.error ??
      "no error"; //// this check
// password
  // value then make refresh , that to check have error
  ref.refresh(formFieldsNotifier)['username']?.error ?? "no error";
  String phoneControllerValue = ref
      .read(phoneRegController)
      .text;
  String passwordControllerValue = ref
      .read(passwordRegController)
      .text;
  String userNameControllerValue = ref
      .read(userNameController)
      .text;
  String completePhoneNumberValue = ref.read(completePhoneNumberReg);
  String selectedCountryCodeValue = ref.read(selectedCountryCode);
  bool? formPhoneState = formPhoneKey.currentState?.validate();
  bool? formPasswordState = formRegPasswordKey.currentState?.validate();
  bool? formUsernameState = formUsernameKey.currentState?.validate();

  newRemovePlusSymbol(ref, selectedCountryCodeValue, phoneControllerValue);

  ref
      .read(formFieldsNotifier.notifier)
      .updateValue("phoneNumberRegistration", phoneControllerValue);
  ref
      .read(formFieldsNotifier.notifier)
      .updateValue("passwordRegistration", passwordControllerValue);
  ref
      .read(formFieldsNotifier.notifier)
      .updateValue("username", userNameControllerValue);
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
      completePhoneNumberValue,
      passwordControllerValue,
      1,
      1,
      ref,
      context);
}
