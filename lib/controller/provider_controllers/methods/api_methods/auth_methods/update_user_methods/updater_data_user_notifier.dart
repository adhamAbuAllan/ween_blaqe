import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/view/user/owner/update_data_of_user_ui.dart';
import '../../../../../../constants/strings.dart';
import '../../../../statuses/auth_state.dart';
import '../../../../../../main.dart';
import '../../../../../../session/new_session.dart';

class UpdaterDataUserNotifier extends StateNotifier<AuthState> {
  UpdaterDataUserNotifier() : super(AuthState());
/// a [updateUserData] usage to check if user make update that if make that, 
/// that the user Or owner will take a massage in the UI that has been make 
/// chagnes, else that the update method of api will not working.
/// that mean this method take actoin according of controller of owner data 
/// field in [UpdateUserDataUi].
  Future<void> updateUserData(WidgetRef ref, BuildContext context) async {
    ref.watch(streamUpdateUserDataController.notifier).state.add(
          SetLocalization.of(context)!.getTranslateValue("verifying"),
        );
    ref.watch(updatePhoneValidate.notifier).state = null;

    ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get(PrefKeys.id, -1),
        );

    await ref
        .watch(changePasswordMethodNotifier.notifier)
        .changePassword(ref: ref, context: context);
    if (ref.read(updateUsernameController.notifier).state.text !=
        (await sp).getString(PrefKeys.name) || ref.read(updatePhoneNumberController
        .notifier).state.text != (await sp).getString(PrefKeys.phone)) {
      await ref
          .watch(changeDataOfUserMethodNotifier.notifier)
          .updateDataOfUser(ref, context);
    }
    ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get(PrefKeys.id, -1),
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
