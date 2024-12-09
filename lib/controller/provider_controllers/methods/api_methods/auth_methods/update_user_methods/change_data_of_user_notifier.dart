import 'dart:async';
import 'dart:convert';

import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/session/new_session.dart';

import '../../../../../../constants/strings.dart';
import '../../../../../../main.dart';

class ChangeDataOfUserNotifier extends StateNotifier<AuthState> {
  ChangeDataOfUserNotifier() : super(AuthState());

  Future<void> changeDataOfUser(WidgetRef ref, BuildContext context) async {
    String usernameControllerValue =
        ref
            .watch(updateUsernameController.notifier)
            .state
            .text;
    String phoneControllerValue =
        ref
            .watch(updatePhoneNumberController.notifier)
            .state
            .text;
    // StreamController streamDataController =
    // ref.watch(streamUpdateUserDataController);
    String selectedCountryCodeValue = ref.watch(selectedCountryCode);
    if (phoneControllerValue != ref
        .watch(userData)
        ?.phone ||
        usernameControllerValue != ref
            .watch(userData)
            ?.name) {
      state = state.copyWith(isLoading: true);
      // streamDataController.add(
      //     SetLocalization.of(context)!.getTranslateValue("saving_changes"));  //
      // newRemovePlusSymbol(
      //     ref, ref.read(selectedCountryCode), phoneControllerValue);



      final url = Uri.parse(ServerWeenBalaqee.userUpdate);

      final response = await http.post(
        url,
        body: jsonEncode({
          'id': NewSession.get("id", -1),
          'name': usernameControllerValue,
          'phone': selectedCountryCodeValue.substring(1) + phoneControllerValue,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {

        updatePhoneNumberFormKey.currentState?.reset();
        updateUsernameFormKey.currentState?.reset();
        ref
            .watch(updateUserNameValidate.notifier)
            .state = null;
        if (usernameControllerValue != ref
            .watch(userData)
            ?.name) {
          (await sp).remove("name");
          (await sp).setString("name", usernameControllerValue);
        }
        if (phoneControllerValue != ref
            .watch(userData)
            ?.phone) {
          (await sp).remove("phone");
          (await sp).setString("phone", phoneControllerValue);
        }

        debugPrint('User updated successfully');

        ref
            .watch(dataHasChanged.notifier)
            .state = true;
      } else if (response.statusCode == 500) {
        updatePhoneNumberFormKey.currentState?.validate();
        ref
            .watch(updatePhoneValidate.notifier)
            .state = SetLocalization.of(context)!.getTranslateValue
          ("try_different_phone");
        ref
            .watch(dataHasChanged.notifier)
            .state = false;

      }
    } else {

    }

    state = state.copyWith(isLoading: false);
  }
}
