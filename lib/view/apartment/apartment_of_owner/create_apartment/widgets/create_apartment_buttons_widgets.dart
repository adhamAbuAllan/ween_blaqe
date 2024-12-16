import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../core/utils/styles/button.dart';

class CreateApartmentButtonsWidgets extends ConsumerWidget {
  const CreateApartmentButtonsWidgets({super.key,required this.onPressed});
final void Function()? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const BackButton(),
          const Expanded(child: SizedBox()),
          NextButtonWidget(onPressed: onPressed),
        ],
      ),
    );
  }
}

class NextButtonWidget extends ConsumerWidget {
  const NextButtonWidget({super.key,required this.onPressed});
final void Function()? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: fullButton(),
      child: Text(SetLocalization.of(context)!.getTranslateValue("next")),
    );
  }
}

class BackButton extends ConsumerWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: outlinedButton(themeMode: themeMode, context: context),
      child: Text(SetLocalization.of(context)!.getTranslateValue("cancel")),
    );
  }
}
