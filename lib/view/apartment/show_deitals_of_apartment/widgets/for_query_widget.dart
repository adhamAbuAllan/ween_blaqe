import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../../core/utils/styles/button.dart';
import '../../../common_widgets/button_widgets/outline_button_widget.dart';

class ForInquiriesWidget extends ConsumerWidget {
  const ForInquiriesWidget({super.key, required this.apartment});

  final DataOfOneApartment apartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("inquiry"),
              style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          OverflowBar(
            overflowAlignment: OverflowBarAlignment.start,
            alignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: getIt<AppDimension>().isSmallScreen(context) ? 5 : 10,
                runSpacing:
                    getIt<AppDimension>().isSmallScreen(context) ? 5 : 10,
                children: [
                  IntrinsicWidth(child: WhatsAppButton(apartment: apartment)),
                  apartment.owner?.email == "user_email"
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IntrinsicWidth(
                              child: EmailButton(apartment: apartment)),
                        ),
                  IntrinsicWidth(child: PhoneButton(apartment: apartment)),
                  apartment.owner?.facebook == "user_name"
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IntrinsicWidth(
                              child: FacebookButton(apartment: apartment)),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WhatsAppButton extends ConsumerWidget {
  const WhatsAppButton({super.key, required this.apartment});

  final DataOfOneApartment apartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButtonWidget(
      onPressed: () async {
        sendMessageToWhatsApp(
          apartment.owner!.phone!,
          "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${apartment.title}",
          image: apartment.photos?[0].url,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/whatsapp.png",
              width: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
              height: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                SetLocalization.of(context)!.getTranslateValue("whatsapp"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w400,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneButton extends ConsumerWidget {
  const PhoneButton({super.key, required this.apartment});

  final DataOfOneApartment apartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButtonWidget(
      onPressed: () async {
        makePhoneCall(apartment.owner?.phone ?? "user_phone");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.phone,
                color: Colors.blueAccent,
                size: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
              child: Text(
                SetLocalization.of(context)!.getTranslateValue("phone"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w400,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailButton extends ConsumerWidget {
  const EmailButton({super.key, required this.apartment});

  final DataOfOneApartment apartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButtonWidget(
      onPressed: () async {
        sendEmail(
          apartment.owner?.email ?? "user_email",
          "يعطيك العافية معك احد مستخدمي تطبيق 'وين بلاقي'",
          "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${apartment.title}",
          image: apartment.photos?[0].url,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/gmail.png",
              width: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
              height: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                SetLocalization.of(context)!.getTranslateValue("gmail"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w400,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacebookButton extends ConsumerWidget {
  const FacebookButton({super.key, required this.apartment});

  final DataOfOneApartment apartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButtonWidget(
      onPressed: () async {
        sendMessenger(
          userName: apartment.owner?.facebook ?? "user_name",
          message:
              "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${apartment.title}",
          image: apartment.photos?[0].url,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.facebook,
                color: Colors.blue,
                size: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
              child: Text(
                SetLocalization.of(context)!.getTranslateValue("facebook"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w400,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
