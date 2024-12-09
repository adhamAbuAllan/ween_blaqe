import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../statuses/auth_state.dart';
import '../../../../../../main.dart';
import '../../../../../../session/new_session.dart';

class UpdaterDataUserNotifier extends StateNotifier<AuthState> {
  UpdaterDataUserNotifier() : super(AuthState());

  Future<void> updateUserData(WidgetRef ref, BuildContext context) async {
    ref.watch(streamUpdateUserDataController.notifier).state.add(
          SetLocalization.of(context)!.getTranslateValue("verifying"),
        );
    ref.watch(updatePhoneValidate.notifier).state = null;

    ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get("id", -1),
        );

    await ref
        .watch(changePasswordMethodNotifier.notifier)
        .changePassword(ref: ref, context: context);
    if (ref.read(updateUsernameController.notifier).state.text !=
        (await sp).getString("name") || ref.read(updatePhoneNumberController
        .notifier).state.text != (await sp).getString("phone")) {
      await ref
          .watch(changeDataOfUserMethodNotifier.notifier)
          .changeDataOfUser(ref, context);
    }
    ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get("id", -1),
        );
    if (ref.watch(dataHasChanged)) {
      ref
          .watch(streamUpdateUserDataController)
          .add(SetLocalization.of(context)!.getTranslateValue("changes_saved"));
    }else{
      ref
          .watch(streamUpdateUserDataController)
          .add(SetLocalization.of(context)!.getTranslateValue("no_changes_made_yet"));
    }
    await Future.delayed(const Duration(seconds: 3), () {
      ref.watch(streamUpdateUserDataController).add("");
    });
  }
}
