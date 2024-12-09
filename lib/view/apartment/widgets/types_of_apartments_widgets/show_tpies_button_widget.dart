import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../core/utils/styles/button.dart';

// Assuming ChangeThemeMode is a provider that holds theme data

class ShowTypesButtonWidgetWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final String? text;

  const ShowTypesButtonWidgetWidget({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the theme mode from Riverpod state
    var isBoxVisible = ref.watch(isSebhaVisibleNotifier);
    return SizedBox(
      child: isBoxVisible
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 102),
              child: Opacity(
                opacity: .95,
                child: BtnShowTypesOfApartments(
                  onPressed: onPressed,
                  text: text,
                  themeMode: themeMode,
                ),
              ),
            )
          : null,
    );
  }
}

class BtnShowTypesOfApartments extends ConsumerWidget {
  const BtnShowTypesOfApartments(
      {super.key, required this.onPressed, this.text, required this.themeMode});

  final void Function()? onPressed;
  final String? text;
  final ChangeThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return OutlinedButton(
      style: outlinedButton(
        themeMode: themeMode,
        context: context,
        isFloatingOutlinedButton: true,
      ),
      onPressed: (){
        ref.watch(isListOfTypesNotifier.notifier).state = !ref.watch
          (isListOfTypesNotifier);
      },
      child: Text(
        text?.isNotEmpty ?? false
            ? text!
            : SetLocalization.of(context)!
                .getTranslateValue("housing_type_btn"),
      ),
    );
  }
}
