import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../controller/get_controllers.dart';
import '../../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../../core/widgets/buttons/social_media_connection_button.dart';
import '../../../../sesstion/new_session.dart';

class WhatsAppSocialButton extends StatelessWidget {
  const WhatsAppSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IntrinsicWidth(
        child: SocialMediaConnectionButton(
          check: () {
            sendMessageToWhatsApp(
                createSocialConnectionController
                    .whatsappController.text,
                "رقم الواتس صحيح"
            );
          },
          labelUserName: " رقم الواتس اب ",
          socialDialogName: "واتس اب",
          controller:
          createSocialConnectionController
              .whatsappController,
          userName:
          NewSession.get("phone", "def"),
          isActive:
          createSocialConnectionController
              .whatsAppIsActive.value,
          socialName: "واتس اب",
          socialIcon:
          FontAwesomeIcons.whatsapp,
        ),
      );
    });
  }
}
