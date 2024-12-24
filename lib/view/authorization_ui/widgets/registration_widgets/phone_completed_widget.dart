import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../common_widgets/text_form_field_widgets/text_form_filed_widget.dart';
import 'button_checker_phone_number_completed_widget.dart';

class PhoneCompletedWidget extends ConsumerWidget {
  const PhoneCompletedWidget({
    super.key,
    this.validateValue,
    this.isPhoneRegTextField,
    this.controller,
  });

  final String? validateValue;
  final bool? isPhoneRegTextField;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            SetLocalization.of(context)!.getTranslateValue("phone_number"),
            style: TextStyle(
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: PhoneNumberWidget(
                validateTextValue: validateValue,
                controller: controller,
                isPhoneRegTextField: isPhoneRegTextField,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: DropDownMenuWidget(),
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
        const ButtonCheckerPhoneNumberCompletedWidget(),
        const SizedBox(
          height: 10,
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
    return validateErrorValue != "" &&  validateErrorValue != "no error have"
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
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical:
                getIt<AppDimension>().isSmallScreen(context) ? 20 / 2 : 20,
            horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themeMode.isLight
                  ? kPrimaryColor300LightMode
                  : kPrimaryColor300DarkMode,
              width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              width: 1),
        ),
      ),
      value: ref.read(selectedCountryCode),
      onChanged: (newValue) {
        ref.read(selectedCountryCode.notifier).state = newValue!;
      },
      dropdownColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      items: ref
          .watch(countriesCodes)
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            textDirection: TextDirection.ltr,
            value,
            style: TextStyle(
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 15,
            ),
          ),
        );
      }).toList(),
    );
  }
}

//phone number widget
class PhoneNumberWidget extends ConsumerWidget {
  const PhoneNumberWidget(
      {super.key,
      this.controller,
      this.isPhoneRegTextField,
      this.validateTextValue});

  final TextEditingController? controller;

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
      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
      controller: controller,
      labelName: SetLocalization.of(context)!.getTranslateValue("phone_number"),
      keyboardType: TextInputType.phone,
    );
  }
}
