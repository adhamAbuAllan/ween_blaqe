import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../constants/nums.dart';
import '../widgets/profile_widgets/social_media_connection_button_widgets/social_media_connection_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/auth_provider.dart';

class FacebookSocialButton extends ConsumerWidget {
  const FacebookSocialButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facebookIsActivate = ref.watch(facebookIsActive);

    return IntrinsicWidth(

      child: SocialMediaConnectionButton(
        onPressedOutlinedButton: () {
          if (ref.watch(facebookController).text.isNotEmpty && ref.watch
            (facebookController).text != ref.read(userData)?.facebook) {
            ref.read(facebookController.notifier).state.text =
                ref.read(userData)?.facebook ?? "";

          }
          if(ref.read(userData)?.facebook != "user_name"&& ref.watch
            (facebookController).text.isEmpty){
            ref.read(facebookController.notifier).state.text = ref.read(userData)?.facebook ?? "";
          }
          Navigator.pop(context);
        },
        onPressed: () async {


          if (ref.read(socialConnectionDataUpdaterNotifier).isLoading) {
            return;
          }
          await ref
              .read(socialConnectionDataUpdaterNotifier.notifier)
              .socialConnectionDataUpdater(
            ref,
            context,
          );
          if (ref.read(facebookController).text ==
                  ref.read(userData)?.facebook &&
              ref.read(userData)?.facebook != "user_name") {
            return;
          }
          if (ref.read(facebookController).text.isNotEmpty) {
            ref.read(facebookIsActive.notifier).state = true;
          } else {
            ref.read(facebookIsActive.notifier).state = false;
          }

        },
        contentColor: facebookIsActivate
            ? (themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode)
            : Colors.grey,
        borderColor: facebookIsActivate
            ? (themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode)
            : (themeMode.isLight
                ? kPrimaryColor300LightMode
                : kPrimaryColor300DarkMode),
        fontWeight: facebookIsActivate ? FontWeight.w500 : FontWeight.w400,
        controller: ref.read(facebookController),
        socialIcon: FontAwesomeIcons.facebook,
        labelUserName:
            SetLocalization.of(context)!.getTranslateValue("username"),
        socialDialogName:
            SetLocalization.of(context)!.getTranslateValue("facebook"),
        socialName: SetLocalization.of(context)!.getTranslateValue("facebook"),
        check: () async {
          final Uri url = Uri.parse('https://m'
              '.me/${ref.read(facebookController).text}');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            ref.read(facebookController.notifier).state.text = value;
          }
        },
      ),
    );
  }
}
