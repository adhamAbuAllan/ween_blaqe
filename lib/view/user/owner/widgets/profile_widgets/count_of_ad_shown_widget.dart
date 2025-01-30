import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';

class CountOfAdShownWidget extends ConsumerWidget {
  const CountOfAdShownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      // height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(children: [],),

          Text(
              SetLocalization.of(context)!.getTranslateValue("ads_shown_count"),
              style: TextStyle(
                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "IBM")),
          const SizedBox(
            height: 15,
          ),
          // Text(//edit it after apartment provider done
          //     "${SetLocalization.of(context)!.getTranslateValue("you_have")}"
          //         " ${apartmentModelController.apartmentsOfOwner.value.data?.length} "
          //         " ${SetLocalization.of(context)!.getTranslateValue("of_ads_displayed")}",
          //     style: TextStyle(
          //         color: themeMode.isLight
          //             ? kTextColorLightMode
          //             : kTextColorDarkMode,
          //         fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: "IBM"))
        ],
      ),
    );
  }
}
