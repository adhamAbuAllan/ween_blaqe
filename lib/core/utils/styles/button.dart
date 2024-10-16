import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';


// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
//fullbutton


//outlineButton

// In your styles.dart file:

// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';

import '../../../controller/function_controller/change_theme_mode.dart';

ButtonStyle fullButton({ChangeThemeMode? themeMode}) {
  return ElevatedButton.styleFrom(
    backgroundColor:
    (themeMode?.isLight??false ? kPrimaryColorLightMode : kPrimaryColorDarkMode),
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontFamily: 'IBM',
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}

ButtonStyle outlinedButton({ChangeThemeMode? themeMode}) {
  return OutlinedButton.styleFrom(
    foregroundColor:
    themeMode?.isLight??false ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
    elevation: 0,
    textStyle: TextStyle(
      fontSize: 16,
      color: themeMode?.isLight??false ? kPrimaryColorLightMode :
      kPrimaryColorDarkMode,
      fontFamily: 'IBM',
    ),
    side: BorderSide(
        width: 1,
        color: themeMode?.isLight??false ? kPrimaryColorLightMode :
        kPrimaryColorDarkMode),
    padding: const EdgeInsets.all(1),
    alignment: Alignment.center,
  );
}
