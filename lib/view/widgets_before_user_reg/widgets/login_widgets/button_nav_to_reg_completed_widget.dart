import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../core/utils/function_that_effect_widgets/hide_keyboard.dart';
import '../../../../core/utils/styles/button.dart';
import '../../registration_ui.dart';

class ButtonNavToRegCompletedWidget extends ConsumerWidget {
  const ButtonNavToRegCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context)
            ? 55 / 1.2
            : 55,
        child: OutlinedButton(
            onPressed: () {
              hideKeyboard(context);

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const RegistrationUi();
                }),
              );
            },
            style: outlinedButton(
                context: context),
            child: Text(SetLocalization.of(context)!
                .getTranslateValue("register_new_account"))),
      ),
    );
  }
}
