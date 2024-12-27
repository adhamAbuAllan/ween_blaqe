import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/dropdown_fields_widgets/types_drop_down_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/price_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/text_widgets/create_apartment_title_widget.dart';
import '../widgets/text_form_field_containers_widgets/square_meters_widget.dart';
import '../widgets/text_form_field_containers_widgets/student_count_widget.dart';
import 'widgets/create_apartment_buttons_widgets.dart';
import 'widgets/images_create_apartment_stpes_widgets.dart';

class ThirdStepUi extends ConsumerStatefulWidget {
  const ThirdStepUi({super.key});

  @override
  ConsumerState createState() => _ThirdStepUiState();
}

class _ThirdStepUiState extends ConsumerState<ThirdStepUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(typesNotifier.notifier).fetchTypes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),

          body: SingleChildScrollView(
            child: Column(
              children: [
                CreateApartmentButtonsWidgets(
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      ref
                          .read(validatorCreateApartmentNotifier.notifier)
                          .validateThirdStep(ref, context);

                    });
                  },
                ),
                CreateApartmentTitleWidget(
                    title: SetLocalization.of(context)!
                        .getTranslateValue("third_step")),
                const ThirdStepImageWidget(),
                const PriceWidget(),
                const DropdownTypesWidget(),
                const StudentCountFieldWidget(),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                ),
                const SquareMetersFieldWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
