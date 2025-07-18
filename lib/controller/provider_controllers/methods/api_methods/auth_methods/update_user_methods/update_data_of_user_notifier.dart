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

class UpdateDataOfUserNotifier extends StateNotifier<AuthState> {
  UpdateDataOfUserNotifier() : super(AuthState());
/// a [updateDataOfUser] method that usage to update data of user in database.
  Future<void> updateDataOfUser(WidgetRef ref, BuildContext context) async {
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
          'id': NewSession.get(PrefKeys.id, -1),
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
          (await sp).remove(PrefKeys.name);
          (await sp).setString(PrefKeys.name, usernameControllerValue);
        }
        if (phoneControllerValue != ref
            .watch(userData)
            ?.phone) {
          (await sp).remove(PrefKeys.phone);
          (await sp).setString(PrefKeys.phone, phoneControllerValue);
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
