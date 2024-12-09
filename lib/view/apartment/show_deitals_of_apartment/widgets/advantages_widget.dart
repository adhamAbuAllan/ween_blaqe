import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../api/advantages.dart';
import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/nums.dart';
import 'show_all_advantages_button_widget.dart';

// Get the advantagesNotifier state from Riverpod
class AdvantagesWidget extends ConsumerWidget {
  const AdvantagesWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the advantages state
    // final advantageState = ref.watch(advantagesNotifer);

    // Watch the loading status to display the UI accordingly
    final advantages = oneApartment?.advantages ?? [];

    return Container(
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("advantages"),
              style: TextStyle(
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children:
                _advantageItemsWidget(advantages: advantages, context: context)
                    .toList()
                    .take(10)
                    .toList(),
          ),

          // Button to show more advantages if there are more than 10
          (advantages.length) > 10
              ? ShowAllAdvantagesButtonWidget(
                  oneApartment: oneApartment ?? DataOfOneApartment(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Iterable<Padding> _advantageItemsWidget(
      {List<Advantages>? advantages, required BuildContext context}) {
    return advantages?.map((entry) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: ListTile(
              title: entry.advName?.isNotEmpty ?? true
                  ? Text(entry.advName ?? "",
                      style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 15
                              : 16,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode))
                  : const SizedBox(
                      child: SkeletonLine(
                          style: SkeletonLineStyle(width: 50, height: 10))),
              trailing: entry.icon?.isEmpty ?? true
                  ? const SizedBox(
                      child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(width: 28, height: 28)))
                  : Image.network(
                      entry.icon!,
                      height: getIt<AppDimension>().isSmallScreen(context)
                          ? 26
                          : 30,
                      width: getIt<AppDimension>().isSmallScreen(context)
                          ? 26
                          : 30,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                            child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                          width: 28,
                          height: 28,
                        )));
                      },
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
            ),
          );
        }) ??
        [].map((e) => const Padding(
              padding: EdgeInsets.all(0),
              child: SizedBox(),
            ));
  }
}
