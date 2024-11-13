import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/features/statuses/validate_text_form_field_state.dart';

import '../../../features/user/provider/auth_provider.dart';

void validateAndLogin(WidgetRef ref, BuildContext context) async {
  // bool isValid = ref.read(formFieldsProvider.notifier).validateAllFields();
  // final phone = ref.read(formFieldsProvider)['phone']?.value ?? "";

  ref.refresh(formFieldsProvider)['phone']?.error ??
      "no error"; // this check phone
  // value then make refresh , that to check have error
  ref.refresh(formFieldsProvider)['password']?.error ??
      "no error"; //// this check
// password
  // value then make refresh , that to check have error

  String phoneControllerValue = ref.read(phoneController).text;
  String passwordControllerValue = ref.read(passwordController).text;

  bool? formPhoneState = formLoginPhoneKey.currentState?.validate();
  bool? formPasswordState = formLoginPasswordKey.currentState?.validate();
  ref
      .read(formFieldsProvider.notifier)
      .updateValue("phone", phoneControllerValue);
  ref
      .read(formFieldsProvider.notifier)
      .updateValue("password", passwordControllerValue);
  // debugPrint("error phone value ")
  String errorPhone =
      ref.read(formFieldsProvider)["phone"]?.error ?? "no error have";
  String errorPassword = ref.read(formFieldsProvider)["password"]?.error ??
     "no error have";
  if (errorPhone != "no error have") {
    debugPrint("formPhoneState is $formPhoneState");
    formLoginPhoneKey.currentState?.validate();
    return;
  }
  if (errorPassword != "no error have") {
    debugPrint("formPasswordState is $formPasswordState");
    formLoginPasswordKey.currentState?.validate();
    return;
  }
  debugPrint("no error validate from local you have ");
  await ref
      .read(loginProvider.notifier)
      .login(phoneControllerValue, passwordControllerValue, ref,context);
  if (errorPhone != "no error have" || errorPassword != "no error have") {
    return;
  }

  // Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
  }
