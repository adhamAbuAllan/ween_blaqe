import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../controller/function_controller/change_theme_mode.dart';





ChangeThemeMode themeMode = Get.find();

final ButtonStyle outlineBox = OutlinedButton.styleFrom(

  foregroundColor: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
  textStyle: const TextStyle(
    fontFamily: 'IBM',
  ),
  side:  BorderSide(width: 0.7, color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode),
  padding: const EdgeInsets.all(0),
  alignment: Alignment.center,
  elevation: 0,
);
