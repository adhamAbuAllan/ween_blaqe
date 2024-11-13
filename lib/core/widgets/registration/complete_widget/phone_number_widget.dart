import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../sesstion/new_session.dart';
import '../../../utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../text_filed_class_widget.dart';

class PhoneNumberWidget extends StatefulWidget {
  const   PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Obx(() {
            userModelController.selectedCountryCode.value;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 10),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getIt<AppDimension>()
                            .isSmallScreen(context)
                            ? 20 / 2
                            : 20,
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
                  value: userModelController.selectedCountryCode.value,
                  onChanged: (newValue) {
                    userModelController.selectedCountryCode.value = newValue!;
                  },
                  dropdownColor: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                  items: userModelController.countryCodes
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            "+$value",
                            style: TextStyle(
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                              fontSize: getIt<AppDimension>().isSmallScreen
                                (context)?14:15,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          }),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Obx(() {
              userModelController.selectedCountryCode.value;
              return TextFieldClassWidget(

                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
                controller: userModelController.phoneController,
                labelName: SetLocalization.of(context)!
                    .getTranslateValue("phone_number"),
                textInputType: TextInputType.phone,
              );
            }),
          ),
        ],
      );
  }
}

    //hint under number phone filed


class HintUnderPhoneNumberField extends StatelessWidget {
  const HintUnderPhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          SetLocalization.of(context)!
              .getTranslateValue("verify_via_whatsapp"),
          // "ستصلك رسالة لتأكيد رقمك ",
          style: TextStyle(
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
            fontSize: getIt<AppDimension>()
                .isSmallScreen(context)
                ? 14
                : 16,
          ),
        ),
        // const Expanded(child: Text("")),
        Obx(() {
          userModelController.selectedCountryCode.value;
          return TextButton(
              style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 5,
                      )),
                  alignment: NewSession.get(
                      "language",
                      ""
                          "ar") ==
                      "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight),
              onPressed: () {
                userModelController.hasCheckedNumberPhone.value = true;
                sendMessageToWhatsApp(
                    userModelController.selectedCountryCode.value +
                        userModelController.phoneController.text,
                    SetLocalization.of(context)!
                        .getTranslateValue(
                        "phone_valid_account_creation"));
              },
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("verify"),
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontFamily: 'IBM'),
              ));
        })
      ],
    );
  }
}

