import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/session/new_session.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';

class ChangePasswordNotifier extends StateNotifier<AuthState> {
  ChangePasswordNotifier() : super(AuthState());

  Future<void> changePassword({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    String oldPasswordControllerValue =
        ref.watch(oldPasswordController.notifier).state.text;
    String newPasswordControllerValue =
        ref.watch(newPasswordController.notifier).state.text;
    String sureNewPasswordControllerValue =
        ref.watch(sureNewPasswordController.notifier).state.text;
    // StreamController streamDataController =
    //     ref.watch(streamUpdateUserDataController);

    if (newPasswordControllerValue.length < 6 &&
        newPasswordControllerValue.isNotEmpty) {
      newPasswordFormKey.currentState?.validate();
      ref.watch(newPasswordValidate.notifier).state =
          SetLocalization.of(context)!.getTranslateValue("password_too_short");
      ref
          .watch(dataHasChanged.notifier)
          .state = false;
      state = state.copyWith(isLoading: false);
      return;
    } else {
      newPasswordFormKey.currentState?.reset();
    }
    if (newPasswordControllerValue == oldPasswordControllerValue) {
      oldPasswordFormKey.currentState?.validate();
      ref
          .watch(dataHasChanged.notifier)
          .state = false;
      state = state.copyWith(isLoading: false);
      return;
    } else {
      oldPasswordFormKey.currentState?.reset();
    }

    if (newPasswordControllerValue != sureNewPasswordControllerValue) {
      sureNewPasswordFormKey.currentState?.validate();
      ref.watch(newPasswordValidate.notifier).state =
          SetLocalization.of(context)!.getTranslateValue("password_mismatch");
      ref
          .watch(dataHasChanged.notifier)
          .state = false;
      return;
    } else {
      sureNewPasswordFormKey.currentState?.reset();
    }

    debugPrint("change Password method ...");
    //password change if statement -->
    if (oldPasswordControllerValue.isNotEmpty &&
        newPasswordControllerValue.isNotEmpty &&
        sureNewPasswordControllerValue.isNotEmpty) {
      //old password and new password and new sure password controllers is
      // not empty
      if (newPasswordControllerValue == sureNewPasswordControllerValue) {
        //new password and new sure password controllers is same
        state = state.copyWith(isLoading: true);

        // streamDataController.add(SetLocalization.of(context)!
        //     .getTranslateValue("saving_changes..."));
        // sure password and new password controllers is same --> make action
        final url = Uri.parse(ServerWeenBalaqee.changePassword);
        // var token = (await sp).get("token");
        var token = NewSession.get("token", "");
        final response = await http.post(
          url,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            'id': NewSession.get("id", -1),
            'current_password': oldPasswordControllerValue,
            'new_password': newPasswordControllerValue,
            "confirm_new_password": sureNewPasswordControllerValue,
          }),
        );
        debugPrint("status code now is : ${response.statusCode}");
        debugPrint("body now is : ${response.body}");

        if (response.statusCode == 200) {

          ref.watch(oldPasswordValidate.notifier).state = null;
          ref.watch(newPasswordValidate.notifier).state = null;
          ref.watch(sureNewPasswordValidate.notifier).state = null;
          oldPasswordFormKey.currentState?.reset();
          newPasswordFormKey.currentState?.reset();
          sureNewPasswordFormKey.currentState?.reset();

          ref.watch(errorStatusCode.notifier).state = 0;

          state = state.copyWith(isLoading: false);
          ref.watch(dataHasChanged.notifier).state = true;
        }
        if (response.statusCode == 401) {
          oldPasswordFormKey.currentState?.validate();
          ref.watch(oldPasswordValidate.notifier).state =
              SetLocalization.of(context)!
                  .getTranslateValue("incorrect_password");
          ref
              .watch(dataHasChanged.notifier)
              .state = false;
          state = state.copyWith(isLoading: false);
          return;
        }
      }
    }
    state = state.copyWith(isLoading: false);
  }
}
