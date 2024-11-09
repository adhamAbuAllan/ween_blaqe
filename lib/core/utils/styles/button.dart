import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
//fullbutton

//outlineButton

// In your styles.dart file:

// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../controller/function_controller/change_theme_mode.dart';

ButtonStyle fullButton() {
  return ElevatedButton.styleFrom(
    backgroundColor:
        themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontFamily: "IBM",
      fontWeight: FontWeight.w500,
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}

ButtonStyle outlinedButton(
    {ChangeThemeMode? themeMode,
    required BuildContext context,
    bool? isFloatingOutlinedButton}) {
  return OutlinedButton.styleFrom(
    foregroundColor: themeMode?.isLight ?? false
        ? kPrimaryColorLightMode
        : kPrimaryColorDarkMode,
    // elevation: 1,
    backgroundColor: isFloatingOutlinedButton ?? false
        ? themeMode?.isLight ?? false
        ? kContainerColorLightMode
        : kContainerColorDarkMode
        : null,
    textStyle: TextStyle(
      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
      color: themeMode?.isLight ?? false
          ? kPrimaryColorLightMode
          : kPrimaryColorDarkMode,
      fontWeight: FontWeight.w500 ,
      fontFamily: 'IBM',
    ),
    side: BorderSide(
        width: 1,
        color: themeMode?.isLight ?? false
            ? kPrimaryColorLightMode
            : kPrimaryColorDarkMode),
    padding: const EdgeInsets.all(1),
    alignment: Alignment.center,
  );
}
