/*
isSureObscure

 */
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/api_methods/auth_methods/refresh_user_data.dart';
import 'package:ween_blaqe/controller/provider_controllers/api_methods/auth_methods/register.dart';

import '../../../api/users.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/update_user_methods/change_data_of_user_method.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/update_user_methods/change_password_method.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/update_user_methods/compress_and_upload_profile_image.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/load_profile_image.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/update_user_methods/social_connection_data_updater.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/update_user_methods/updater_data_user_method.dart';
import '../../../controller/provider_controllers/hybrid_methods/refresh_and_set_social_data.dart';
import '../../../controller/provider_controllers/hybrid_methods/validator_and_update_data_of_user.dart';
import '../../../controller/provider_controllers/local_methods/image_profile_picker.dart';
// import '../../../controller/provider_controllers/local_methods/switcher_theme_mode.dart';
import '../../statuses/auth_state.dart';
import '../../../controller/provider_controllers/api_methods/auth_methods/login_method.dart';
import '../../statuses/validate_text_form_field_state.dart';

final registerNotifier = StateNotifierProvider<RegisterNotifier, AuthState>(
    (ref) => RegisterNotifier());

final loginNotifier = StateNotifierProvider<LoginNotifier, AuthState>((ref) {
  return LoginNotifier();
});
final loadProfileImageNotifier =
    StateNotifierProvider<LoadProfileImageNotifier, AuthState>(
        (ref) => LoadProfileImageNotifier());
final compressAndUploadImageNotifier =
    StateNotifierProvider<CompressAndUploadProfileImageNotifier, AuthState>(
        (ref) => CompressAndUploadProfileImageNotifier());

final formFieldsNotifier =
    StateNotifierProvider<FormFieldsNotifier, Map<String, TextFieldState>>(
        (ref) => FormFieldsNotifier());

final imageProfilePickerNotifier =
    StateNotifierProvider<ImageProfilePickerNotifier, AuthState>(
        (ref) => ImageProfilePickerNotifier());

final socialConnectionDataUpdaterNotifier =
    StateNotifierProvider<SocialConnectionDataUpdaterNotifier, AuthState>(
        (ref) => SocialConnectionDataUpdaterNotifier());

final refreshUserDataNotifier =
    StateNotifierProvider<RefreshUserDataNotifier, AuthState>(
        (ref) => RefreshUserDataNotifier());

final refreshAndSetSocialDataNotifier =
    StateNotifierProvider<RefreshAndSetSocialDataNotifier, AuthState>(
  (ref) => RefreshAndSetSocialDataNotifier(),
);

final changeDataOfUserMethodNotifier =
    StateNotifierProvider<ChangeDataOfUserMethodNotifier, AuthState>(
  (ref) => ChangeDataOfUserMethodNotifier(),
);
final changePasswordMethodNotifier =
    StateNotifierProvider<ChangePasswordMethodNotifier, AuthState>(
  (ref) => ChangePasswordMethodNotifier(),
);
final updaterDataUserNotifier =
    StateNotifierProvider<UpdaterDataUserNotifier, AuthState>(
  (ref) => UpdaterDataUserNotifier(),
);
final validatorAndUpdateDataOfUserNotifier =
    StateNotifierProvider<ValidatorAndUpdateDataOfUserNotifier, AuthState>(
  (ref) => ValidatorAndUpdateDataOfUserNotifier(),
);


final phoneLoginController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final phoneRegController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final passwordLoginController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final passwordRegController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final newPasswordController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final sureNewPasswordController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final oldPasswordController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final updateUsernameController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final updatePhoneNumberController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final streamUpdateUserDataController = StateProvider<StreamController<String>>(
  (ref) {
    final controller = StreamController<String>.broadcast();
    ref.onDispose(() => controller.close());
    return controller;
  },
);
final whatsappController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final facebookController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});

final emailController = StateProvider<TextEditingController>((ref) {
  //Reg => registration
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
final hasCheckedPhone = StateProvider<bool>((ref) => false);
final isPhoneNumberIsAlreadyTaken = StateProvider<bool>((ref) => false);
final isPop = StateProvider<bool>((ref) => false);
final whatsAppIsActive = StateProvider<bool>((ref) => true);
final phoneIsActive = StateProvider<bool>((ref) => true);
final emailIsActive = StateProvider<bool>((ref) => false);
final facebookIsActive = StateProvider<bool>((ref) => false);
final isOldPassword = StateProvider<bool>((ref) => false);
final dataHasChanged = StateProvider<bool>((ref) => false);
final isSureObscure = StateProvider<bool>((ref) => true);
final isUpdateImageProfile = StateProvider<bool>((ref) => false);
final completePhoneNumberReg = StateProvider<String>((ref) => "");
final email = StateProvider<String>((ref) => "");
final facebook = StateProvider<String>((ref) => "");
final phone = StateProvider<String>((ref) => "");
final whatsapp = StateProvider<String>((ref) => "");
final updateUserNameValidate = StateProvider<String?>((ref) => null);
final oldPasswordValidate = StateProvider<String?>((ref) => null);
final newPasswordValidate = StateProvider<String?>((ref) => null);
final sureNewPasswordValidate = StateProvider<String?>((ref) => null);
final updatePhoneValidate = StateProvider<String?>((ref) => null);
final selectedCountryCode = StateProvider<String>((ref) => "+970");
final countriesCodes = StateProvider<List<String>>((ref) => [
      "+970",
      "+972",
    ]);
final errorStatusCode = StateProvider<int>((ref) => 0);
final profileImageFile = StateProvider<XFile?>((ref) => null);
final imagePicker = StateProvider<ImagePicker?>((ref) => ImagePicker());

final userData = StateProvider<User?>((ref) => User());

final formLoginPhoneKey = GlobalKey<FormState>();
final formLoginPasswordKey = GlobalKey<FormState>();
final formPhoneKey = GlobalKey<FormState>();
final formRegPasswordKey = GlobalKey<FormState>();
final formUsernameKey = GlobalKey<FormState>();
final updateUsernameFormKey = GlobalKey<FormState>();
final updatePhoneNumberFormKey = GlobalKey<FormState>();
final oldPasswordFormKey = GlobalKey<FormState>();
final newPasswordFormKey = GlobalKey<FormState>();
final sureNewPasswordFormKey = GlobalKey<FormState>();
