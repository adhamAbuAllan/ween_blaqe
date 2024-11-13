/*
isSureObscure

 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/api_methods/auth_methods/register.dart';

import '../../statuses/load_button_state.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/login_method.dart';
import '../../statuses/validate_text_form_field_state.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, AuthState>(
    (ref) => RegisterNotifier());

final loginProvider = StateNotifierProvider<LoginNotifier, AuthState>(
  (ref) {
    return LoginNotifier();
    }
);

final formFieldsProvider =
    StateNotifierProvider<FormFieldsNotifier, Map<String, TextFieldState>>(
        (ref) => FormFieldsNotifier());

final phoneController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final passwordController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final userNameController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final isObscure = StateProvider<bool>((ref) => true);
final isCheckedPhone = StateProvider<bool>((ref) => false);
final isPhoneNumberIsAlreadyTaken = StateProvider<bool>((ref) => false);

final phoneRegisterValidationMsg = StateProvider<String>((ref) => "");
final passwordRegisterValidationMsg = StateProvider<String>((ref) => "");
final userNameValidationMsg = StateProvider<String>((ref) => "");
final loginPhoneValidationMsg = StateProvider<String>((ref) => "");
final loginPasswordValidationMsg = StateProvider<String>((ref) => "");

final selectedCountryCode = StateProvider<String>((ref) => "+970");
final countriesCodes = StateProvider<List<String>>((ref) => [
      "+970",
      "+972",
    ]);
final formLoginPhoneKey = GlobalKey<FormState>();
final formLoginPasswordKey = GlobalKey<FormState>();
