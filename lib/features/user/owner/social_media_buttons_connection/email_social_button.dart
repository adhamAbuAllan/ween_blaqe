import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/buttons/social_media_connection_button.dart';
import '../../../../sesstion/new_session.dart';

class EmailSocialButton extends StatelessWidget {
  const EmailSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      createSocialConnectionController.emailIsActive.value;

      return IntrinsicWidth(
        child: SocialMediaConnectionButton(
            labelUserName:
            " البريد الالكتروني "
                "الخاص بك",
            socialDialogName: "جيميل",
            isActive:
NewSession.get("email", "user_email") != "user_email"
                ? true : false,
            userName:
            createSocialConnectionController
                .emailController.text,
            controller:
            createSocialConnectionController
                .emailController,
            socialName: "جيميل",
            socialIcon:
            FontAwesomeIcons.envelope,
            onSaved: () {
              if (createSocialConnectionController
                  .emailController.text ==
                  "") {
                createSocialConnectionController
                    .emailController
                    .text = "user_email";
                createSocialConnectionController
                    .emailIsActive
                    .value = false;
                NewSession.save("email", "user_email");
              }

              createSocialConnectionController.updateSocialConnectionData();
              debugPrint("the email is -- ${NewSession.get("email", "user_email")}");
              Navigator.pop(context);
            },
            check:
            createSocialConnectionController
                .emailController
                .text !=
                "user_e"
                    "mail"
                ? () async {
              final Uri emailUri =
              Uri(
                scheme: 'mailto',
                path: createSocialConnectionController
                    .emailController
                    .text,
              );

              if (await canLaunchUrl(
                  emailUri)) {
                await launchUrl(
                    emailUri);
              } else {
                throw 'Could not launch email client';
              }
            }
                : null,
            onChanged: (value) {
              createSocialConnectionController
                  .emailController
                  .text = value;
            }),
      );
    });
  }
}
