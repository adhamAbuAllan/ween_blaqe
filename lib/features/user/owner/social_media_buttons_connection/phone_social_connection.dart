import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../widgets/profile_widgets/social_media_connection_button_widgets/social_media_connection_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/auth_provider.dart';

class PhoneSocialButton extends ConsumerWidget {
  const PhoneSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final phoneIsActivate = ref.watch(phoneIsActive);

    return IntrinsicWidth(
      child: SocialMediaConnectionButton(
        onPressedOutlinedButton: () {
          ref.watch(phoneLoginController.notifier).state.text =
          ref.watch(userData)?.phone?.substring(3) ?? "97000000000";
              // ??
              // NewSession.get
              //   ("phone", "").substring(3);
          Navigator.pop(context);
        },
        socialName: SetLocalization.of(context)!.getTranslateValue("phone"),
        labelUserName: "رق"
            "م الهاتف",
        socialDialogName: " الهاتف",
        socialIcon: FontAwesomeIcons.phone,
        controller: ref.watch(phoneLoginController),
      ),
    );
  }
}
