import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets/button_of_city_widget.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/subtitle_of_screen_widget.dart';

import '../../../../api/cities.dart';

class RemainingStudentsFilterWidget extends ConsumerWidget {
  const RemainingStudentsFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = ref.read(themeModeNotifier.notifier).textTheme(ref: ref);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16/2),
          child: SubtitleWidget(
            subtitle: "عدد الطلاب المتبقي",
            duration: const Duration(milliseconds: 500),
            color: textColor,
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: List.generate(5, (index) {
            final number = index + 1;
            return FadeInOnVisible(
              isUIHaveScroll: false,
              delay: Duration(milliseconds: number * 200),
              child: CityButtonWidget(
                context: context,
                city: City(),
                onClick: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref
                        .read(selectedStudentReminding.notifier)
                        .state = ref
                                .read(selectedStudentReminding.notifier)
                                .state ==
                            number
                        ? 0
                        : number;
                  });
                },
                style: ref.watch(selectedStudentReminding) == number
                    ? fullButton(
                            backgroundColor: ref
                                .read(themeModeNotifier.notifier)
                                .primaryTheme(ref: ref))
                        .copyWith(
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                          )
                    : outlinedButton(
                        primaryColor: ref
                            .read(themeModeNotifier.notifier)
                            .primaryTheme(ref: ref),
                        containerColor: ref
                            .read(themeModeNotifier.notifier)
                            .containerTheme(ref: ref),
                        context: context),
                child: Text(number.toString()),
              ),
            );
          }),
        ),
      ],
    );
  }
}
