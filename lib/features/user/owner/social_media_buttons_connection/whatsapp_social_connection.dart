import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../widgets/profile_widgets/social_media_connection_button_widgets/social_media_connection_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WhatsAppSocialButton extends ConsumerWidget {
  const WhatsAppSocialButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final whatsappIsActivate = ref.watch(whatsAppIsActive);

    return IntrinsicWidth(
      child: SocialMediaConnectionButton(

        onPressedOutlinedButton: () {
          if(ref.watch(whatsappController).text != ref.watch(userData)?.phone){
              ref.watch(whatsappController.notifier).state.text =
                ref.watch(userData)?.phone ?? "97000000000";
          }
                  // ?? NewSession.get("phone", "");
          Navigator.pop(context);
        },

        check: () {
          sendMessageToWhatsApp(
              ref.watch(whatsappController).text,
              ref.watch(whatsappController.notifier).state.text.length != 12
                  ? " ${SetLocalization.of(context)!.getTranslateValue("validw_whatsapp_number")}"
                  : " ${SetLocalization.of(context)!.getTranslateValue("phone_valid")}");
        },
        labelUserName:
            SetLocalization.of(context)!.getTranslateValue("whatsapp_number"),
        socialDialogName:
            SetLocalization.of(context)!.getTranslateValue("whatsapp"),
        controller: ref.watch(whatsappController),
        socialName: "whatsapp",
        socialIcon: FontAwesomeIcons.whatsapp,
      ),
    );
  }
}
