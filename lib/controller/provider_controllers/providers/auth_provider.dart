import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/api_methods/auth_methods/refresh_user_data_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/hybrid_methods/auth_validator/login_and_reg_validators/validator.dart';

import '../../../api/users.dart';
import '../methods/api_methods/auth_methods/register_notifier.dart';
import '../methods/api_methods/auth_methods/send_noice_for_us_notifier.dart';
import '../methods/api_methods/auth_methods/update_user_methods/update_data_of_user_notifier.dart';
import '../methods/api_methods/auth_methods/update_user_methods/change_password_notifier.dart';
import '../methods/api_methods/auth_methods/update_user_methods/compress_and_upload_profile_image_notifier.dart';
import '../methods/api_methods/auth_methods/load_profile_image_notifier.dart';
import '../methods/api_methods/auth_methods/update_user_methods/social_connection_data_updater_notifier.dart';
import '../methods/api_methods/auth_methods/update_user_methods/updater_data_user_notifier.dart';
import '../methods/hybrid_methods/refresh_and_set_social_data.dart';
import '../methods/hybrid_methods/auth_validator/login_and_reg_validators/text_field_validate_notifier.dart';
import '../methods/hybrid_methods/auth_validator/update_user_data_validator/validator_and_update_data_of_user.dart';

// import '../../../controller/provider_controllers/local_methods/switcher_theme_mode.dart';
import '../methods/api_methods/auth_methods/login_notifier.dart';
import '../methods/local_methods/bottom_navigation_bar_notifier.dart';
import '../statuses/auth_state.dart';
import '../statuses/validate_text_form_field_state.dart';

final btmNavBarIndexNotifier =
    StateNotifierProvider<BtmNavBarIndexNotifier, int>(
  (ref) => BtmNavBarIndexNotifier(),
);
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
/// a [formFieldsNotifier] only usage for textFormField widgets in two UI Screens
/// [LoginUi] and [RegistrationUi]
final formFieldsNotifier =
    StateNotifierProvider<FormFieldsNotifier, Map<String, TextFieldState>>(
        (ref) => FormFieldsNotifier());



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
    StateNotifierProvider<UpdateDataOfUserNotifier, AuthState>(
  (ref) => UpdateDataOfUserNotifier(),
);
final changePasswordMethodNotifier =
    StateNotifierProvider<ChangePasswordNotifier, AuthState>(
  (ref) => ChangePasswordNotifier(),
);
final updaterDataUserNotifier =
    StateNotifierProvider<UpdaterDataUserNotifier, AuthState>(
  (ref) => UpdaterDataUserNotifier(),
);
final validatorAndUpdateDataOfUserNotifier =
    StateNotifierProvider<ValidatorAndUpdateDataOfUserNotifier, AuthState>(
  (ref) => ValidatorAndUpdateDataOfUserNotifier(),
);
final sendNoticeForUsNotifier =
    StateNotifierProvider<SendNoticeForUsNotifier, AuthState>(
  (ref) => SendNoticeForUsNotifier(),
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
final sendNoticeForUcController = StateProvider<TextEditingController>(
        (ref) {
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
final selectedCountryCode = StateProvider<String>((ref) => "+970");
/// those string value is the errors that show in TextFormField widget
final updateUserNameValidate = StateProvider<String?>((ref) => null);
final oldPasswordValidate = StateProvider<String?>((ref) => null);
final newPasswordValidate = StateProvider<String?>((ref) => null);
final sureNewPasswordValidate = StateProvider<String?>((ref) => null);
final updatePhoneValidate = StateProvider<String?>((ref) => null);

final countriesCodes = StateProvider<List<String>>((ref) => [
      "+970",
      "+972",
    ]);

final errorStatusCode = StateProvider<int>((ref) => 0);

final profileImageFile = StateProvider<XFile?>((ref) => null);


final userData = StateProvider<User?>((ref) => User());
///that the [formLoginPhoneKey],[formLoginPasswordKey],[formPhoneKey],
///[formRegPasswordKey],[formUsernameKey] , use the [Validator] class
///and [FormFieldsNotifier] , and every method in hybrid_method folder
/// to make validate for tow screens [LoginUi] and [RegistrationUi]
/// only.
final formLoginPhoneKey = GlobalKey<FormState>();
final formLoginPasswordKey = GlobalKey<FormState>();
final formPhoneKey = GlobalKey<FormState>();
final formRegPasswordKey = GlobalKey<FormState>();
final formUsernameKey = GlobalKey<FormState>();
/// the  [updateUsernameFormKey] ,[updatePhoneNumberFormKey],
/// [oldPasswordFormKey],[newPasswordFormKey],[sureNewPasswordFormKey] usage
/// for [UpdateUserDataUi] screen only.
final updateUsernameFormKey = GlobalKey<FormState>();
final updatePhoneNumberFormKey = GlobalKey<FormState>();
final oldPasswordFormKey = GlobalKey<FormState>();
final newPasswordFormKey = GlobalKey<FormState>();
final sureNewPasswordFormKey = GlobalKey<FormState>();
