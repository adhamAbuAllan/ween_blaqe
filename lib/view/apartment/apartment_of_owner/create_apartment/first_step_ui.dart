import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/session/new_session.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/images_create_apartment_stpes_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/bath_rooms_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/rooms_widget.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/create_apartment_title_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../widgets/dropdown_fields_widgets/cities_drop_down_widget.dart';
import '../widgets/text_form_field_containers_widgets/address_widget.dart';

class FirstStepUi extends ConsumerStatefulWidget {
  const FirstStepUi({super.key});

  @override
  ConsumerState createState() => _FirstStepCreateApartmentUiState();
}

class _FirstStepCreateApartmentUiState extends ConsumerState<FirstStepUi> {
  @override
  void initState() {
    super.initState();
    debugPrint("newSession lastLat ${NewSession.get("lastLat", 2.2)}");
    debugPrint("newSession lastLng ${NewSession.get("lastLng", 2.2)}");
  }
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color:
        ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: ref.read(themeModeNotifier.notifier).
            backgroundAppTheme(ref: ref),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  ButtonsCreateApartmentWidgets(
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
