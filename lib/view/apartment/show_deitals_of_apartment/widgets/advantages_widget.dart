import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../api/advantages.dart';
import '../../../../api/apartments_api/apartments.dart';
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
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
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
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: _advantageItemsWidget(
                    advantages: advantages, context: context, ref: ref)
                .toList()
                .take(10)
                .toList(),
          ),

          // Button to show more advantages if there are more than 10
          (advantages.length) > 10
              ? FadeInOnVisible(
            delay: const Duration(milliseconds: 1000),
            child: ShowAllAdvantagesButtonWidget(

                    oneApartment: oneApartment ?? DataOfOneApartment(),
                  ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }

  Iterable<Padding> _advantageItemsWidget(
      {List<Advantages>? advantages,
      required BuildContext context,
      required WidgetRef ref}) {
    return advantages?.map((entry) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: FadeInOnVisible(
              delay: Duration(milliseconds: advantages.indexOf(entry) * 100),
              child: ListTile(
                title: entry.advName?.isNotEmpty ?? true
                    ? Text(entry.advName ?? "",
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 15
                              : 16,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ))
                    : const SizedBox(
                        child: SkeletonLine(
                            style: SkeletonLineStyle(width: 50, height: 10))),
                trailing: entry.icon?.isEmpty ?? true
                    ? const SizedBox(
                        child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 28, height: 28)))
                    : Image.network(
                        entry.icon!.startsWith("1")
                            ? "http://${entry.icon!}"
                            : entry.icon!,
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
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .textTheme(ref: ref),
                      ),
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
