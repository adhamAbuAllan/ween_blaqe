import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

class ApartmentShowTypesTextButton extends StatefulWidget {
  final String textType;
  final void Function()? onPressed;

  const ApartmentShowTypesTextButton(
      {super.key, this.onPressed, required this.textType});

  @override
  State<ApartmentShowTypesTextButton> createState() =>
      _ApartmentShowTypesTextButtonState();
}

class _ApartmentShowTypesTextButtonState
    extends State<ApartmentShowTypesTextButton> {
  ChangeThemeMode themeMode = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: TextButton(
          style:  ButtonStyle(
              overlayColor: WidgetStatePropertyAll(themeMode.isLight ? kPrimaryColor300LightMode : kPrimaryColor300DarkMode)),
          onPressed: widget.onPressed,
          child: Text("${widget.textType}           ",
              style:  TextStyle(
                  color:themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode, fontFamily: 'IBM'))),
    );
  }
}
