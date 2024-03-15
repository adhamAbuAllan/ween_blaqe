import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';


// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
//fullbutton
final ButtonStyle fullButton = ElevatedButton.styleFrom(
    // foregroundColor: !themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,

    backgroundColor: !themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 15,
      fontFamily: 'IBM',
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))));
//outlineButton

final ButtonStyle outlineButton = OutlinedButton.styleFrom(
  foregroundColor: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
  elevation: 0,
  textStyle:  TextStyle(
    fontSize: 14,
    color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
    fontFamily: 'IBM',
  ),
  side:  BorderSide(width: 1,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode
  ),
  padding: const EdgeInsets.all(1),
  alignment: Alignment.center,
);
