import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets/button_of_city_widget.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/subtitle_of_screen_widget.dart';

import '../../../../api/cities.dart';

class OwnerTypeFilterWidget extends ConsumerWidget {
  const OwnerTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = ref.read(themeModeNotifier.notifier).textTheme(ref: ref);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16/2),
          child: SubtitleWidget(
            duration: const Duration(milliseconds: 450),
            subtitle: "النوع",
            color: textColor,
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: ref
              .watch(ownerTypesProvider)
              .map((ownerType) => FadeInOnVisible(
                    isUIHaveScroll: false,
                    delay: Duration(milliseconds: ownerType.id! * 150),
                    child: CityButtonWidget(
                      context: context,
                      city: City(),
                      onClick: () {
                        ref
                            .read(selectedOwnerTypeId.notifier)
                            .state = ref
                                    .read(selectedOwnerTypeId.notifier)
                                    .state ==
                                ownerType.id
                            ? 0
                            : ownerType.id ?? 0;
                      },
                      style: ownerType.id ==
                              ref.watch(selectedOwnerTypeId)
                          ? fullButton(
                                  backgroundColor: ref
                                      .read(themeModeNotifier.notifier)
                                      .primaryTheme(ref: ref))
                              .copyWith(
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                )
                          : outlinedButton(
                              primaryColor: ref
                                  .read(themeModeNotifier.notifier)
                                  .primaryTheme(ref: ref),
                              containerColor: ref
                                  .read(themeModeNotifier.notifier)
                                  .containerTheme(ref: ref),
                              context: context),
                      child: Text(ownerType.name),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
