import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/images_create_apartment_stpes_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/bath_rooms_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/rooms_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/create_apartment_title_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../widgets/dropdown_fields_widgets/cities_drop_down_widget.dart';
import '../widgets/text_form_field_containers_widgets/address_widget.dart';

class FirstStepUi extends ConsumerStatefulWidget {
  const FirstStepUi({super.key});

  @override
  ConsumerState createState() => _FirstStepCreateApartmentUiState();
}

class _FirstStepCreateApartmentUiState extends ConsumerState<FirstStepUi> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: themeMode.isLight
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CreateApartmentButtonsWidgets(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        ref
                            .watch(validatorCreateApartmentNotifier.notifier)
                            .validateFirstStep(ref, context);
                      });
                    },
                  ),
                  CreateApartmentTitleWidget(
                    title: SetLocalization.of(context)!
                        .getTranslateValue("first_step"),
                  ),
                  const FirstStepImageWidget(),
                  const DropdownCitiesWidget(
                    autofocus: true,
                  ),
                  SizedBox(
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 0:10 ),
                  const AddressFieldWidget(),
                  const RoomsFieldWidget(),
                  const BathRoomsFieldWidget()
                ],
              ),
            ),
          ),
        ));
  }
}
