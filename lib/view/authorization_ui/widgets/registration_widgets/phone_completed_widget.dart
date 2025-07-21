import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/view/common_widgets/drop_down_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/animations_widgets/build_animation_widget.dart';
import '../../../common_widgets/text_form_field_widgets/text_form_filed_widget.dart';
import 'button_checker_phone_number_completed_widget.dart';

class PhoneCompletedWidget extends ConsumerWidget {
  const PhoneCompletedWidget({
    super.key,
    this.validateValue,
    this.isPhoneRegTextField,
    this.controller,
    this.hasContainer,
    this.isUIHaveScroll,
  });

  final String? validateValue;
  final bool? isPhoneRegTextField;
  final TextEditingController? controller;
  final bool? hasContainer;
  final bool? isUIHaveScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasContainer ?? false
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FadeInOnVisible(
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("phone_number"),
                        style: TextStyle(
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 16
                              : 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: FadeInOnVisible(
                isUIHaveScroll: isUIHaveScroll,
                direction: SlideDirection.x,
                child: PhoneNumberWidget(
                  hasContainer: hasContainer,
                  validateTextValue: validateValue,
                  controller: controller,
                  isPhoneRegTextField: isPhoneRegTextField,
                ),
              ),
            ),
            const SizedBox(width: 10),
             Expanded(
              child: FadeInOnVisible(
                  isUIHaveScroll: isUIHaveScroll,
                  child: DropDownMenuWidget()),
            ),
          ],
        ),
        // const Spacer(),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [CustomErrorText(validateValue ?? "")],
          ),
        ),
        FadeInOnVisible(
            isUIHaveScroll: isUIHaveScroll,
            child: const ButtonCheckerPhoneNumberCompletedWidget()),
        SizedBox(
          height: getIt<AppDimension>().isSmallScreen(context) ? 10 : 20,
        ),
      ],
    );
  }
}

//custom error text widget
class CustomErrorText extends ConsumerWidget {
  const CustomErrorText(this.validateErrorValue, {super.key});

  final String validateErrorValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return validateErrorValue != "" && validateErrorValue != "no error have"
        ? Text(
            validateErrorValue,
            softWrap: true,
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12.0,
            ),
          )
        : const SizedBox();
  }
}

//dropdown menu widget
class DropDownMenuWidget extends ConsumerWidget {
  const DropDownMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownFieldWidget(
        horizantalPadding: 0,
        isStringOnly: true,
        onChanged: (newValue) {
          ref.read(selectedCountryCode.notifier).state = newValue!;
        },
        items: ref.watch(countriesCodes));
  }
}

//phone number widget
class PhoneNumberWidget extends ConsumerWidget {
  const PhoneNumberWidget(
      {super.key,
      this.controller,
      this.isPhoneRegTextField,
      this.validateTextValue,
      this.hasContainer});

  final TextEditingController? controller;
  final bool? hasContainer;
  final bool? isPhoneRegTextField;
  final String? validateTextValue;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return TextFormFieldWidget(
      validateTextValue: validateTextValue,
      isPhoneRegTextField: isPhoneRegTextField ?? true,
      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
      controller: controller,
      labelName: hasContainer ?? false
          ? null
          : SetLocalization.of(context)!.getTranslateValue("phone_number"),
      keyboardType: TextInputType.phone,
    );
  }
}
