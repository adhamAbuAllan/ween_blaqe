import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/images_create_apartment_stpes_widgets.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../controller/provider_controllers/providers/snack_bar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../apartment/apartment_of_owner/widgets/advantages_checkbox_widget.dart';
import '../../../common_widgets/text_widgets/create_apartment_title_widget.dart';

class SecondStepUi extends ConsumerStatefulWidget {
  const SecondStepUi({super.key});

  @override
  ConsumerState createState() => _SecondStepUiState();
}

class _SecondStepUiState extends ConsumerState<SecondStepUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(validatorCreateApartmentNotifier.notifier)
          .validateSecondStep(ref, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CreateApartmentButtonsWidgets(
                onPressed: () {
                  if (ref.read(advantagesNotifer).chosen.length < 5) {
                    ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                        context: context,
                        message: SetLocalization.of(context)!.getTranslateValue(
                            "should_be_at_least_five_advantages"));
                    return;
                  }
                  myPushName(context, MyPagesRoutes.step3);
                },
              ),
              CreateApartmentTitleWidget(
                title: SetLocalization.of(context)!
                    .getTranslateValue("second_step"),
              ),
              const SecondStepImageWidget(),
              const AdvantagesCheckBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
