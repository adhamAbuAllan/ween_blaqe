import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/apartment/widgets/filter_of_apartments_widgets/city_filter_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/filter_of_apartments_widgets/owner_type_filter_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/filter_of_apartments_widgets/remaining_students_filter_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/filter_of_apartments_widgets/filter_top_bar_widget.dart';
import '../../controller/provider_controllers/providers/apartment_provider.dart';
import '../common_widgets/text_widgets/create_apartment_title_widget.dart';

class ApartmentFilterUi extends ConsumerWidget {
  const ApartmentFilterUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:
      ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
      body: ColorfulSafeArea(
        color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterTopBarWidget(
              onSavePressed: () {

                Navigator.pop(context);
                ref
                    .read(fetchApartmentNotifier.notifier)
                    .fetchApartments(
                      isOwnerApartments: false,
                      ref: ref,
                  studentReminding: ref.read(selectedStudentReminding),
                      // typeOfOwnerId: typeOwnerId,
                    );

              },
            ),

            const Center(
              child: CreateApartmentTitleWidget(
                title: "تصفية الشقق",
              ),
            ),

            // City Filter Widget
            const CityFilterWidget(),

            // Owner Type Filter Widget
            const OwnerTypeFilterWidget(),

            // Remaining Students Filter Widget
            const RemainingStudentsFilterWidget(),
          ],
        ),
      ),
    );
  }
}