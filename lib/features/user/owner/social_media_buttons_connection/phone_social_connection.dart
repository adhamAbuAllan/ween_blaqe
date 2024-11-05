import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/buttons/social_media_connection_button.dart';
class PhoneSocialButton extends StatelessWidget {
  const PhoneSocialButton({
    super.key,
    required this.formattedPhone,
  });

  final String formattedPhone;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IntrinsicWidth(
        child: SocialMediaConnectionButton(
          isActive:
          createSocialConnectionController
              .phoneIsActive.value,
          socialName: SetLocalization.of(context)!.getTranslateValue("phone"),
          labelUserName: "رق"
              "م الهاتف",
          socialDialogName: " الهاتف",
          socialIcon: FontAwesomeIcons.phone,
          userName: formattedPhone,
          controller:
          createSocialConnectionController
              .phoneController,
        ),
      );
    });
  }
}
