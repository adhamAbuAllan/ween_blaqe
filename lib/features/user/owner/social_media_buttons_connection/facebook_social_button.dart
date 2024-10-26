import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';

import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/buttons/social_media_connection_button.dart';
class FacebookSocialButton extends StatelessWidget {
  const FacebookSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      createSocialConnectionController.facebookIsActive.value;
      return IntrinsicWidth(
        child: SocialMediaConnectionButton(
            isActive: NewSession.get("facebook", "user_name") != "user_name" ?
            true
                : false,

            labelUserName: "اسم المستخدم",
            socialDialogName: "فيس بوك",
            socialName: "فيس بوك",
            check: () async {
              final Uri url = Uri.parse(
                  'https://m'
                      '.me/${createSocialConnectionController.facebookController
                      .text}');
              if (!await launchUrl(url)) {
                throw Exception(
                    'Could not launch $url');
              }
            },
            userName:
            createSocialConnectionController
                .facebookController.text,
            controller:
            createSocialConnectionController
                .facebookController,
            socialIcon:
            FontAwesomeIcons.facebook,
            onChanged: (value) {
              createSocialConnectionController
                  .facebookController
                  .text = value;
            },
            onSaved: () {
              if (createSocialConnectionController
                  .facebookController
                  .text ==
                  "") {
                createSocialConnectionController
                    .facebookController
                    .text = "user_name";
                NewSession.save("facebook", "user_name");

                createSocialConnectionController
                    .facebookIsActive
                    .value = false;
              }
              createSocialConnectionController.updateSocialConnectionData();
              debugPrint("the facebook is : ${NewSession.get("facebook", "use"
                  "r_name")
              }");

              Navigator.pop(context);
            }),
      );
    });
  }
}
