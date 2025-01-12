import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../session/new_session.dart';

  class ButtonCheckerPhoneNumberCompletedWidget extends ConsumerWidget {
  const ButtonCheckerPhoneNumberCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          SetLocalization.of(context)!.getTranslateValue("verify_via_whatsapp"),
          style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          ),
        ),
        TextButton(
            style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                  horizontal: 5,
                )),
                alignment: NewSession.get(
                            "language",
                            ""
                                "ar") ==
                        "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight),
            onPressed: () {
              ref.read(hasCheckedPhone.notifier).state = true;

              sendMessageToWhatsApp(ref.read(selectedCountryCode) + ref.read
                (phoneRegController).text,
                  SetLocalization.of(context)!
                      .getTranslateValue("phone_valid_account_creation"));

            },
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("verify"),
              style: const TextStyle(
                  color: Colors.blue, fontSize: 16, fontFamily: 'IBM'),
            ))
      ],
    );
  }
}
