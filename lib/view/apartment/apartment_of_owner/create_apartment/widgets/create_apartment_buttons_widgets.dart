import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../core/utils/styles/button.dart';
import '../../../../common_widgets/button_widgets/elevated_button_widget.dart';

class ButtonsCreateApartmentWidgets extends ConsumerWidget {
  const ButtonsCreateApartmentWidgets({super.key, this.onPressed, this.title});

  final void Function()? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const OutlinedBackButtonWidget(),
          const Expanded(child: SizedBox()),
          NextButtonWidget(
            onPressed: onPressed,
            title: title,
            ref: ref,
          ),
        ],
      ),
    );
  }
}

class NextButtonWidget extends ConsumerWidget {
  const NextButtonWidget(
      {super.key, required this.onPressed, this.title, required this.ref});

  final void Function()? onPressed;
  final String? title;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButtonWidget(
      onPressed: onPressed,
      child: ref.watch(createApartmentNotifier).isLoading ||
              ref.watch(updateApartmentNotifier).isUpdating
          ?  const CircularProgressIndicator(color: Colors.white,)
          : Text(
              title ?? SetLocalization.of(context)!.getTranslateValue("next")),
    );
  }
}

class OutlinedBackButtonWidget extends ConsumerWidget {
  const OutlinedBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: outlinedButton(primaryColor: ref.read(themeModeNotifier
          .notifier).primaryTheme(ref: ref),containerColor: ref.read
        (themeModeNotifier.notifier).containerTheme(ref: ref), context: 
      context),
      child: Text(SetLocalization.of(context)!.getTranslateValue("cancel")),
    );
  }
}
