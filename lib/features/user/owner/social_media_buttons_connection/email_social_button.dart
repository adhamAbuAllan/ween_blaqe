import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/features/user/provider/auth_provider.dart';
import '../../../../constants/nums.dart';
import '../widgets/profile_widgets/social_media_connection_button_widgets/social_media_connection_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailSocialButton extends ConsumerWidget {
  const EmailSocialButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailIsActivate = ref.watch(emailIsActive);

    return IntrinsicWidth(
      child: SocialMediaConnectionButton(
        onPressedOutlinedButton: (){
          if( ref.watch(emailController.notifier).state.text.isNotEmpty && ref.watch(emailController).text
              != ref.read(userData)?.email){
            ref.read(emailController.notifier).state.text = ref.read(userData)?.email ?? "";
          }
          if(ref.read(userData)?.email != "user_email"&& ref.watch
            (emailController).text.isEmpty){
            ref.read(emailController.notifier).state.text = ref.read(userData)?.email ?? "";
          }

          Navigator.pop(context);
        },
        onPressed: () async {


          if (ref.read(socialConnectionDataUpdaterNotifier).isLoading) {
            return;
          }
          if (ref.read(emailController).text == ref.read(userData)?.email &&
              ref.read(userData)?.email != "user_email") {
            return;
          }
          await ref
              .read(socialConnectionDataUpdaterNotifier.notifier)
              .socialConnectionDataUpdater(
            ref,
            context,
          );
          if (ref.read(emailController.notifier).state.text.isNotEmpty) {
            ref.read(emailIsActive.notifier).state = true;
          }else{
            ref.read(emailIsActive.notifier).state = false;
          }


        },
        labelUserName:
            SetLocalization.of(context)!.getTranslateValue("your_email"),
        socialDialogName:
            SetLocalization.of(context)!.getTranslateValue("gmail"),
        controller: ref.read(emailController),
        socialName: SetLocalization.of(context)!.getTranslateValue("gmail"),
        socialIcon: FontAwesomeIcons.envelope,
        contentColor: emailIsActivate
            ? (themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode)
            : Colors.grey,
        borderColor: emailIsActivate
            ? (themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode)
            : (themeMode.isLight
                ? kPrimaryColor300LightMode
                : kPrimaryColor300DarkMode),
        fontWeight: emailIsActivate ? FontWeight.w500 : FontWeight.w400,
        check: () async {
          final Uri emailUri =
              Uri(scheme: 'mailto', path: ref.watch(emailController).text);

          if (await canLaunchUrl(emailUri)) {
            await launchUrl(emailUri);
          } else {
            throw 'Could not launch email client';
          }
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            ref.read(emailController.notifier).state.text = value;
          }
        },
      ),
    );
  }
}

// onSaved: () {
//   if (ref.watch(emailController).text == "") {
//     ref.watch(emailIsActive.notifier).state = false;
//     ref
//         .read(emailController)
//         .text = "";
//   }
//
//   ref.read(socialConnectionDataUpdaterNotifier.notifier)
//       .socialConnectionDataUpdater(ref);
//   ref.read(refreshUserDataNotifier.notifier).refreshUserData(
//       NewSession.get("id", -1), ref);
//   debugPrint(
//       "user email controller value is : ${ref.read(emailController).text}");
//   // debugPrint(
//   //     "the email is -- ${NewSession.get("email", "user_email")}");
//   Navigator.pop(context);
// },
