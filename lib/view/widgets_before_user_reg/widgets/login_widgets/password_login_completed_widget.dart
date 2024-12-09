import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/localization.dart';
import '../../../../core/widgets/login/password_container_class_widget.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class PasswordLoginCompletedWidget extends ConsumerWidget {
  const PasswordLoginCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formLoginPasswordKey,
      child: PasswordContainerClassWidget(
        inputType: TextInputType.visiblePassword,
        validator: (value){
          return ref.watch(formFieldsNotifier)['password']?.error;
        },


        // isVisible: true,
        onObscureChanged: (newValue) {
          // setState(() {

          ref.read(isObscure.notifier).state = newValue;
          // });
        },
        isObscure: ref.watch(isObscure),

        hintInput:
            SetLocalization.of(context)!.getTranslateValue("your_password"),
        title: SetLocalization.of(context)!.getTranslateValue("password"),

        controller: ref.read(passwordLoginController),
        errorText: ref.watch(formFieldsNotifier)['password']?.error,
      ),
    );
  }
}
