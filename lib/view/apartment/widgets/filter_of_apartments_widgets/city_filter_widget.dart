  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
  import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets/button_of_city_widget.dart';
  import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
  import 'package:ween_blaqe/core/utils/styles/button.dart';
  import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

  import '../../../common_widgets/text_widgets/subtitle_of_screen_widget.dart';

  class CityFilterWidget extends ConsumerWidget {
    const CityFilterWidget({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          SubtitleWidget(
            subtitle: "المدينة",
            duration: const Duration(milliseconds: 300),
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          ),
          const SizedBox(height: 16 / 2),
          Wrap(
            alignment: WrapAlignment.start,
            children: ref.watch(cityNotifier).cities.map((c) => FadeInOnVisible(
              isVisibleOnScroll: false,
              delay: Duration(milliseconds: c.id! * 100),
              child: CityButtonWidget(
                context: context,
                onClick: () {
                  final currentId = ref.read(selectedCityIdToFilter.notifier).state;
                  ref.read(selectedCityIdToFilter.notifier).state =
                  currentId == c.id ? 0 : (c.id ?? 0);
                },
                style: ref.watch(selectedCityIdToFilter) == c.id &&
                    ref.watch(selectedCityIdToFilter) != 0
                    ? fullButton(
                    backgroundColor: ref
                        .read(themeModeNotifier.notifier)
                        .primaryTheme(ref: ref))
                    .copyWith(
                  foregroundColor: WidgetStateProperty.all<Color>(
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
                city: c,
              ),
            )).toList(),
          ),
        ],
      );
    }
  }
