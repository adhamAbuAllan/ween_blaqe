import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/localization.dart';
import '../../../../core/widgets/registration/text_field_of_password_class_widget.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class PasswordRegCompletedWidget extends ConsumerWidget {
  const   PasswordRegCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formRegPasswordKey,
          child: TextFieldOfPasswordClassWidget(
            validator: (value) {
              return ref.watch(formFieldsNotifier)['passwordRegistration']?.error;
            },
            isObscure:ref.watch(isObscure),
            onObscureChanged: (newValue) {
              ref.read(isObscure.notifier).state = newValue;
            },
            controller: ref.read(passwordRegController),
            inputType: TextInputType.visiblePassword,
            labelInput: SetLocalization.of(context)!.getTranslateValue("password"),
            errorText: ref.watch(formFieldsNotifier)['passwordRegistration']?.error,

          ),
        ),

      ],
    );
  }
}
