import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/view/user/owner/update_data_of_user_ui.dart';
import '../../../../../../constants/strings.dart';
import '../../../../statuses/auth_state.dart';
import '../../../../../../session/new_session.dart';

class UpdaterDataUserNotifier extends StateNotifier<AuthState> {
  UpdaterDataUserNotifier() : super(AuthState());

  /// a [updateUserData] usage to check if user make update that if make that,
  /// that the user Or owner will take a massage in the UI that has been make
  /// chagnes, else that the update method of api will not working.
  /// that mean this method take actoin according of controller of owner data
  /// field in [UpdateUserDataUi].
  Future<void> updateUserData(WidgetRef ref, BuildContext context) async {
    final localization = SetLocalization.of(context)!;
    final verifying = localization.getTranslateValue("verifying");
    final changesSaved = localization.getTranslateValue("changes_saved");
    final noChangesMadeYet =
        localization.getTranslateValue("no_changes_made_yet");

    ref.watch(streamUpdateUserDataController.notifier).state.add(
          verifying,
        );
    ref.watch(updatePhoneValidate.notifier).state = null;

    await ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get(PrefKeys.id, -1),
        );

    if (!context.mounted) return;
    await ref
        .watch(changePasswordMethodNotifier.notifier)
        .changePassword(ref: ref, context: context);

    if (!context.mounted) return;
    final fullPhone = ref.read(selectedCountryCode).substring(1) +
        ref.read(updatePhoneNumberController.notifier).state.text;
    if (ref.read(updateUsernameController.notifier).state.text !=
            NewSession.get(PrefKeys.name, "") ||
        fullPhone != NewSession.get(PrefKeys.phone, "")) {
      await ref
          .watch(changeDataOfUserMethodNotifier.notifier)
          .updateDataOfUser(ref, context);
    }

    if (!context.mounted) return;
    await ref.watch(refreshUserDataNotifier.notifier).refreshUserData(
          ref: ref,
          userId: NewSession.get(PrefKeys.id, -1),
        );
    if (ref.watch(dataHasChanged)) {
      ref.watch(streamUpdateUserDataController).add(changesSaved);
    } else {
      ref.watch(streamUpdateUserDataController).add(
            noChangesMadeYet,
          );
    }
    await Future.delayed(const Duration(seconds: 3), () {
      ref.watch(streamUpdateUserDataController).add("");
    });
  }
}
