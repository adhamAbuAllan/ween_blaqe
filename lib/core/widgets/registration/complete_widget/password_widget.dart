import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../../constants/localization.dart';
import '../text_field_of_password_class_widget.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      userModelController.isObscure.value;
      return TextFieldOfPasswordClassWidget(
        validator: (value){
          if(userModelController.passwordValidationMsg.value != ""){
            return userModelController.passwordValidationMsg.value;
          }else{
            return null;
          }

        },
        isObscure: userModelController.isObscure.value,
        onObscureChanged: (newValue) {
          userModelController.isObscure.value = newValue;
        },
        controller: userModelController.passwordController,
        inputType: TextInputType.visiblePassword,
        labelInput: SetLocalization.of(context)!
            .getTranslateValue("password"),
        // onFieldSubmitted: () {
        //   focusNodeOfSurePassword.requestFocus();
        // },
      );
    });
  }
}
// class SurePassword extends StatelessWidget {
//   const SurePassword({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return
    //sure password field is [optional]
    // TextFieldOfPasswordClassWidget(
    //   isObscure: isSureObscure,
    //   onObscureChanged: (newValue) {
    //     setState(() {
    //       isSureObscure = newValue;
    //     });
    //   },
    //   // focusNode: fn,
    //   controller: surePasswordController,
    //   // focusNode: focusNodeOfPassword,
    //
    //   inputType: textFormFieldTypePassword,
    //   labelInput: SetLocalization.of(context)!.getTranslateValue("confirm_password"),
    //   // onFieldSubmitted: () {
    //   //   foucsNodeOfType.requestFocus();
    //   // },
    //   // focusNode: focusNodeOfSurePassword,
    // ),
    // SizedBox(
    //   height:
    //       getIt<AppDimension>().isSmallScreen(context)
    //           ? 20 / 1.6
    //           : 20,
    // ),

  // }
// }

