/*
    userModelController.formRegisterKey
                                            .currentState!.validate();
                                        userModelController
                                            .userNameValidationMsg.value = "";

                                        String fillAllFields = SetLocalization
                                            .of(context)!
                                            .getTranslateValue("fill_field");
                                        // String passwordMismatch =
                                        //     SetLocalization.of(context)!
                                        //         .getTranslateValue(
                                        //             "password_mismatch");//
                                        //             enable it if [sure password field] enabled
                                        // String enterMatchingPasswords =
                                        //     SetLocalization.of(context)!
                                        //         .getTranslateValue(
                                        //             "enter_matching_password
                                        //             s"); enable it if [sure password field] enabled
                                        String phoneVerification = SetLocalization
                                            .of(context)!
                                            .getTranslateValue(
                                            "phone_verification");
                                        String unverifiedPhone = SetLocalization
                                            .of(context)!
                                            .getTranslateValue(
                                            "unverified_phone");
                                        String ok =
                                        SetLocalization.of(context)!
                                            .getTranslateValue("ok");
                                        String tryDifferentPhone = SetLocalization
                                            .of(context)!
                                            .getTranslateValue(
                                            "try_different_phone");

                                        // isLoading = true;


                                        if (userModelController.phoneController
                                            .text.isEmpty) {
                                          debugPrint("");

                                          userModelController.phoneValidationMsg
                                              .value =
                                              fillAllFields;
                                          userModelController.isLoading.value =
                                          false;
                                        } else {
                                          userModelController.phoneValidationMsg
                                              .value =
                                          "";
                                        }
                                        if (userModelController
                                            .userNameController.text.isEmpty) {
                                          userModelController
                                              .userNameValidationMsg.value =
                                              fillAllFields;
                                          userModelController.isLoading.value =
                                          false;
                                        } else {
                                          userModelController
                                              .userNameValidationMsg.value = "";
                                        }
                                        if (userModelController
                                            .passwordController.text.isEmpty) {
                                          userModelController
                                              .passwordValidationMsg.value =
                                              fillAllFields;
                                          userModelController.isLoading.value =
                                          false;
                                        } else {
                                          userModelController
                                              .passwordValidationMsg.value = "";
                                        }
                                        // if(userModelController.passwordController.text.length < 8){
                                        //   userModelController.passwordValidationMsg.value =
                                        //       SetLocalization.of(context)!.getTranslateValue("weak_password");
                                        //   userModelController.isLoading.value = false;
                                        //   return;
                                        // }


                                        await userModelController
                                            .checkerPhoneNumber(
                                          userModelController.phoneController
                                              .text,
                                        );

                                        if (userModelController
                                            .isPhoneNumberIsAlreadyTaken
                                            .value) {
                                          userModelController.isLoading.value =
                                          false;
                                          userModelController
                                              .phoneValidationMsg
                                              .value =
                                              tryDifferentPhone;
                                          return;
                                        }
                                        userModelController.phoneController
                                            .text =
                                            removePlusSymbol
                                              (userModelController
                                                .phoneController.text);
                                        // if(){};
                                        /*
                                      check matching passwords is [optional]
                                       */
                                        // if (passwordController.text !=
                                        //     surePasswordController.text) {
                                        //   NormalAlert.show(
                                        //       // ignore: use_build_context_synchronously
                                        //       context,
                                        //       passwordMismatch,
                                        //       enterMatchingPasswords,
                                        //       ok);
                                        //   return;
                                        // }

                                        if (!userModelController
                                            .hasCheckedNumberPhone.value &&
                                            userModelController.phoneController
                                                .text.isNotEmpty &&
                                            userModelController.phoneController
                                                .text.length == 9) {
                                          await NormalAlert.show(
                                            // ignore: use_build_context_synchronously
                                              context,
                                              phoneVerification,
                                              unverifiedPhone,
                                              ok);
                                          return;
                                        } else
                                        if (userModelController.phoneController
                                            .text.length > 9 ||
                                            userModelController.phoneController
                                                .text.length > 9) {
                                          userModelController.phoneValidationMsg
                                              .value =
                                              SetLocalization.of(context)!
                                                  .getTranslateValue(
                                                  "the_phone_number_is_not_suitable");
                                          userModelController.isLoading.value =
                                          false;
                                          return;

 */
                    // await userModelController.register(
                                        //     userModelController
                                        //         .userNameController.text,
                                        //     userModelController.phoneController
                                        //         .text,
                                        //     userModelController
                                        //         .passwordController.text,
                                        //     1,
                                        //     1,
                                        //     context);

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

    // if (value.length < 6) return 'Password must be at least 6 characters';
    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return 'Password must contain at least one uppercase letter';
    // }
    // if (!RegExp(r'[0-9]').hasMatch(value)) {
    //   return 'Password must contain at least one number';
    // }
    return null;
  }


  static String? validateUsername(String value) {
    if (value.isEmpty) return 'fill_field';
    // if (value.length < 3) return 'Username must be at least 3 characters';
    return null;
  }
  static String? validatePhoneNumberRegistration(String value) {
    if (value.isEmpty) {
      return "رقم الهاتف لا يجب أن يكون فارغًا";
    } else if (value.length != 9) {
      return "رقم الهاتف غير مناسب";
    }
    return null;
  }

  static String? validateField(String fieldKey, String value) {
    switch (fieldKey) {
      case 'phone':
        return validatePhone(value);
      case 'password':
        return validatePassword(value);
        case 'username':
        return validateUsername(value);
      case 'phoneNumberRegistration':
        return validatePhoneNumberRegistration(value);
    // Add more cases as needed
      default:
        return null;
    }
  }

}


