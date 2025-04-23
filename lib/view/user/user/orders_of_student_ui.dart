import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ween_blaqe/constants/localization.dart';

// import 'package:get/get.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/text_widgets/subtitle_of_screen_widget.dart';
import '../../common_widgets/text_widgets/title_of_screen_widget.dart';

class OrdersOfStudentUi extends ConsumerWidget {
  const OrdersOfStudentUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
          ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
      body: UpgradeAlert(
        barrierDismissible: true,
        showReleaseNotes: false,
        upgrader: Upgrader(
          debugDisplayAlways: false,
          languageCode: 'ar',
          countryCode: 'ps',
          // debugDisplayAlways: true,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TitleWidget(
                    title: SetLocalization.of(context)!
                        .getTranslateValue("bookings")),
                SubtitleWidget(
                    subtitle: SetLocalization.of(context)!
                        .getTranslateValue("booking_list")),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getIt<AppDimension>().isSmallScreen(context)
                          ? 0
                          : 25),
                  child: Image.asset(
                    "assets/images/mobile-development.png",
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 130 * 2
                        : (420 / 1.1),
                    width: getIt<AppDimension>().isSmallScreen(context)
                        ? 130 * 2
                        : (450 / 1.1),
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: getIt<AppDimension>().isSmallScreen(context)
                          ? 25
                          : 0),
                  child: Text(
                    SetLocalization.of(context)!.getTranslateValue(
                        "booking_advantage_in_development"),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .textTheme(ref: ref)),
                    softWrap: true,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
