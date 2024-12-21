import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../core/utils/styles/button.dart';

class CreateApartmentButtonsWidgets extends ConsumerWidget {
  const CreateApartmentButtonsWidgets({super.key, this.onPressed,this.title});
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
          NextButtonWidget(onPressed: onPressed,title: title,),
        ],
      ),
    );
  }
}

class NextButtonWidget extends ConsumerWidget {
  const NextButtonWidget({super.key,required this.onPressed,this.title});
final void Function()? onPressed;
final String? title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: fullButton(),
      child: Text(title??SetLocalization.of(context)!.getTranslateValue
        ("next")),
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
      style: outlinedButton(themeMode: themeMode, context: context),
      child: Text(SetLocalization.of(context)!.getTranslateValue("cancel")),
    );
  }
}
