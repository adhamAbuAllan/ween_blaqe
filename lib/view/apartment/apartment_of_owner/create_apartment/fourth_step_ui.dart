import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/images_create_apartment_stpes_widgets.dart';
import 'package:ween_blaqe/view/common_widgets/text_widgets/create_apartment_title_widget.dart';

import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../widgets/floating_button_add_delete_image_widget.dart';
import '../widgets/text_form_field_containers_widgets/add_title_widget.dart';
import '../widgets/text_form_field_containers_widgets/description_widget.dart';
import 'add_image_ui.dart';

class FourthStepUi extends ConsumerStatefulWidget {
  const FourthStepUi({super.key});

  @override
  ConsumerState createState() => _FourthStepUiState();
}

class _FourthStepUiState extends ConsumerState<FourthStepUi> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

      child: Scaffold(
        backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),

        body: SingleChildScrollView(
          child: Column(
            children: [
              ButtonsCreateApartmentWidgets(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    ref
                        .read(validatorCreateApartmentNotifier.notifier)
                        .validateFourthStep(ref, context);
                  });
                },
                title: SetLocalization.of(context)!.getTranslateValue("save"),
              ),
              CreateApartmentTitleWidget(
                  title: SetLocalization.of(context)!
                      .getTranslateValue("final_step")),
              const FourthStepImageWidget(),
              const AddTitleFieldWidget(),
              const DescriptionFieldWidget(),
            ],
          ),
        ),
        floatingActionButton: ImageGridFloatingButtonWidget(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddImageUi()));
          },
          title: SetLocalization.of(context)?.getTranslateValue("add_photos"),
        ),
      ),
    );
  }
}
