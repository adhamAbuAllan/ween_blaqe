import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/outline_button_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_ui.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/elevated_button_sebha_widget.dart';

class ButtonsOfSebhaWidgets extends ConsumerStatefulWidget {
  const ButtonsOfSebhaWidgets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ButtonsOfSebhaWidgetsState();
}

class _ButtonsOfSebhaWidgetsState extends ConsumerState<ButtonsOfSebhaWidgets> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
          child: const ElevatedButtonSebhaWidget(),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
          child: OutlinedButtonWidget(
              onPressed: () {
                setState(() {
                  ref.read(noInternetNotfierProvider.notifier).reset();
                });
              },
              child: Text(
                  SetLocalization.of(context)!.getTranslateValue("reset"))),
        ),
      ],
    );
  }
}
