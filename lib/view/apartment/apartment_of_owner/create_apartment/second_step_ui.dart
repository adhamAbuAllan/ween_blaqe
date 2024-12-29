import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/widgets/images_create_apartment_stpes_widgets.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
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
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ButtonsCreateApartmentWidgets(
                onPressed: () {
                  if (ref.read(advantagesNotifer).chosen.length < 5) {
                    ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                        backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                        textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

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
