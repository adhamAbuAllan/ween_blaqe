import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../session/new_session.dart';
import '../../social_media_buttons_connection/email_social_button.dart';
import '../../social_media_buttons_connection/facebook_social_button.dart';
import '../../social_media_buttons_connection/phone_social_connection.dart';
import '../../social_media_buttons_connection/whatsapp_social_connection.dart';

class SocialMediaWidget extends ConsumerWidget {
  const SocialMediaWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row(children: [],),

          Text(
              SetLocalization.of(context)!
                  .getTranslateValue("available_contact_methods"),
              style: TextStyle(
                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 15,
          ),

          OverflowBar(
            children: [
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                // Spacing between buttons horizontally
                runSpacing: 10,

                children: [
                  Padding(
                    padding: NewSession.get("language", "ar") == "en"
                        ? const EdgeInsets.only(left: 10 * 2)
                        : const EdgeInsets.only(right: 10 * 2),
                    child: const WhatsAppSocialButton(),
                  ),
                  Padding(
                    padding: NewSession.get("language", "ar") == "en"
                        ? EdgeInsets.only(
                            right: getIt<AppDimension>().isSmallScreen(context)
                                ? 0
                                : 8)
                        : EdgeInsets.only(
                            left: getIt<AppDimension>().isSmallScreen(context)
                                ? 0
                                : 16),
                    child: const FacebookSocialButton(),
                  ),
                  const EmailSocialButton(),
                  const PhoneSocialButton(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
