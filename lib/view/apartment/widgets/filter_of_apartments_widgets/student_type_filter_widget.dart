import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/cities.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/hybrid_methods/type_of_apartment_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/subtitle_of_screen_widget.dart';

import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../cities_of_apartments_widgets/button_of_city_widget.dart';

class StudentTypeFilterWidget extends ConsumerWidget {
  const StudentTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final apartmentTypeNotifier = ref.watch(apartmentTypeNotifierProvider);
   final selectedType = apartmentTypeNotifier.selectedType;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        SubtitleWidget(
          subtitle: "نوع السكن",
          duration: const Duration(milliseconds: 600),
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        ),
        const SizedBox(height: 16 / 2),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
      
            _buildTypeButton(
              context: context,
              ref: ref,
              type: ApartmentType.families,
              label: 'عائلات',
              isSelected: selectedType == ApartmentType.families
            ),
            _buildTypeButton(
              context: context,
              ref: ref,
              type: ApartmentType.boyStudents,
              label: 'طلاب',
              isSelected: selectedType == ApartmentType.boyStudents 
            ),
            _buildTypeButton(
              context: context,
              ref: ref,
              type: ApartmentType.girlStudents,
              label: 'طالبات',
              isSelected: selectedType == ApartmentType.girlStudents 
            ),
                  _buildTypeButton(
              context: context,
              ref: ref,
              type: ApartmentType.all,
              label: 'الكل',
                isSelected: ref.read(isAllTypesOfApartmentNotifier),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeButton({
    required BuildContext context,
    required WidgetRef ref,
    required ApartmentType type,
    required String label,
    required bool isSelected,
  }) {
    return FadeInOnVisible(
      isVisibleOnScroll: false,
      delay: Duration(milliseconds: type.value * 250),
      child: CityButtonWidget(
        city: City(),
        context: context,
        onClick: () {
          ref.read(apartmentTypeNotifierProvider.notifier).selectApartmentType(type,ref: ref);
        },
        style: isSelected
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
        child: Text(label),
      ),
    );
  }
}
