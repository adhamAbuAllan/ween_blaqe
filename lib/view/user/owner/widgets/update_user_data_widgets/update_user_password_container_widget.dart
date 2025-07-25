import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../common_widgets/text_form_field_widgets/text_form_filed_password_widget.dart';

class UpdateUserPasswordContainerWidget extends ConsumerWidget {
  const UpdateUserPasswordContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInOnVisible(
      direction: SlideDirection.x,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 30, 10, 50),
        // height: 140,
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: FadeInOnVisible(
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("change_password"),
                  style: TextStyle(
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            //old password
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Column(
                children: [
                  Form(key: ref.watch(oldPasswordValidate.notifier).state !=
                      null ? oldPasswordFormKey : null ,

                      child: const OldPasswordWidget()),
                  const Column(
                      children: [
                        //new password
                        NewPasswordWidget(),
                        //sure new password
                        SureNewPasswordWidget()])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OldPasswordWidget extends ConsumerWidget {
  const OldPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormFiledPasswordWidget(
      delay: const Duration(milliseconds: 600),
      validator: (value) {
        if (ref.read(oldPasswordValidate.notifier).state == null) {
          ref.read(oldPasswordValidate.notifier).state = null;
          return null;
        }

        return ref.watch(oldPasswordValidate);
      },
      isObscure: ref.watch(isObscure),
      onObscureChanged: (newValue) {
        ref.read(isObscure.notifier).state = newValue;
      },
      controller: ref.read(oldPasswordController),
      inputType: TextInputType.visiblePassword,
      labelInput:
          SetLocalization.of(context)!.getTranslateValue("old_password"),
    );
  }
}

class NewPasswordWidget extends ConsumerWidget {
  const NewPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(newPasswordValidate.notifier).state !=
          null ? newPasswordFormKey : null ,
      child: TextFormFiledPasswordWidget(
        delay: const Duration(milliseconds: 700),

        isObscure: ref.watch(isSureObscure),
        onObscureChanged: (newValue) {
          ref.read(isSureObscure.notifier).state = newValue;
        },
        controller: ref.read(newPasswordController),
        inputType: TextInputType.visiblePassword,
        labelInput:
            SetLocalization.of(context)!.getTranslateValue("new_password"),
        validator: (value) {
          if (ref.read(newPasswordValidate.notifier).state == null) {
            ref.read(sureNewPasswordValidate.notifier).state = null;
            return null;
          }
          return ref.watch(newPasswordValidate);
        },
      ),
    );
  }
}

class SureNewPasswordWidget extends ConsumerWidget {
  const SureNewPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(sureNewPasswordValidate.notifier).state !=
          null ? sureNewPasswordFormKey : null ,
      child: TextFormFiledPasswordWidget(
        delay: const Duration(milliseconds: 800),

        validator: (value) {
          if(ref.read(newPasswordValidate.notifier).state == null){
            ref.read(sureNewPasswordValidate.notifier).state = null;
            return null;
          }
          return ref.watch(newPasswordValidate);
        },
        isObscure: ref.watch(isSureObscure),
        onObscureChanged: (newValue) {
          ref.read(isSureObscure.notifier).state = newValue;
        },
        controller: ref.read(sureNewPasswordController),
        inputType: TextInputType.visiblePassword,
        labelInput: SetLocalization.of(context)!
            .getTranslateValue("confirm_new_password"),
      ),
    );
  }
}
