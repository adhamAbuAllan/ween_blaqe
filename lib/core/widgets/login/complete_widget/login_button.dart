import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../constants/localization.dart';
import '../../../../controller/get_controllers.dart';
// import '../../../utils/function_that_effect_widgets/hide_keyboard.dart';
// import '../../../utils/function_that_effect_widgets/remove_plus_from_phone_number.dart';
import '../../../utils/styles/button.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key, this.onPressed,

  });
  final VoidCallback? onPressed ;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
          style: fullButton(),
          onPressed:widget.onPressed  ,
          child: userModelController.isLoading.value
              ? const CircularProgressIndicator(
            color: Colors.white,
          )
              : Text(SetLocalization.of(context)!
              .getTranslateValue("login")));
    });
  }
}
