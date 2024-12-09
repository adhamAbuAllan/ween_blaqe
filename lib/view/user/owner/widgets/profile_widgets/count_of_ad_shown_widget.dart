import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

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
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(children: [],),

          Text(
              SetLocalization.of(context)!.getTranslateValue("ads_shown_count"),
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize: 18,
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
          //         fontSize: 16,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: "IBM"))
        ],
      ),
    );
  }
}
