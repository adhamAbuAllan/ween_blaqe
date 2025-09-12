import 'package:flutter/material.dart';

// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
//fullbutton

//outlineButton

// In your styles.dart file:

// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';

ButtonStyle fullButton({Color? backgroundColor}) {
  return ElevatedButton.styleFrom(
    backgroundColor:
       backgroundColor,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontFamily: "Cairo",
      fontWeight: FontWeight.w500,
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}

ButtonStyle outlinedButton(
    {
      Color ?containerColor,
      Color ?primaryColor,
    required BuildContext context,
    bool? isFloatingOutlinedButton}) {
  return OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    // elevation: 1,
    backgroundColor: isFloatingOutlinedButton ?? false
        ? containerColor        : null,
    textStyle: TextStyle(

      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
      color: primaryColor,
      fontWeight: FontWeight.w500 ,
      fontFamily: 'Cairo',
    ),
    side: BorderSide(
        width: 1,
        color: primaryColor?? Colors.blue),

    padding: const EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
  );
}
