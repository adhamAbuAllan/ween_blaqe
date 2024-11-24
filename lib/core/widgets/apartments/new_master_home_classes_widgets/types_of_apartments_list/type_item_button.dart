import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

import '../../../../../constants/get_it_controller.dart';
import '../../../../../session/new_session.dart';

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
      child: TextButton(
      
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10),
            ),
            alignment: NewSession.get("language", "ar") == "en"
                ""  ? Alignment.centerLeft:
            Alignment.centerRight,
            overlayColor: WidgetStatePropertyAll(themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode),
      
          ),
          onPressed: widget.onPressed,
          child: Text(
      
            widget.textType,
              style: TextStyle(
      
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 15,
                  fontFamily: 'IBM'),),),
    );
  }
}
