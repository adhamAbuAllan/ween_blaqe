import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimension {
  // the icons will be more adaptive by check a width of screen
  //a upperLimit is the max size of icon according width of screen and a
  // lowerLimit is the min size of icon according width of screen too ,
  // and another one is a mediumLimit that will be the middle size of icon
  //this make a icons more adaptive in UI
  double iconImageSize(BuildContext context,
      {double? upperLimit, lowerLimit, mediumLimit}) {
    return MediaQuery.of(context).size.width >= 414
        ? upperLimit ?? 32.w
        : (MediaQuery.of(context).size.width >= 390
            ? mediumLimit ?? 28.w
            : lowerLimit ?? 24.w);
  }
  //usage this method instade a SizeBox widget that make app more adaptive UI
  double spaceBetweenWidgets(BuildContext context,
      {double? upperLimit, double? lowerLimit, double? mediumLimit}) {
    return MediaQuery.of(context).size.width >= 414
        ? upperLimit ?? 60.h
        : (MediaQuery.of(context).size.width >= 390
            ? mediumLimit ?? 40.h
            : lowerLimit ?? 30.h);
}
  //you can use a Flexable instade this method
  double endSpaceOfScreenBetweenWidgets(BuildContext context,
      {double? upperLimit, double? lowerLimit, double? mediumLimit}) {
    return MediaQuery.of(context).size.width >= 414
        ? lowerLimit ?? 0
        : (MediaQuery.of(context).size.width >= 390
            ? mediumLimit ?? 40.h
            : upperLimit ?? 100.h);
  }
  //if an Image child of Flexible this method will be called
  Widget makeImageMoreSmall(BuildContext context) {
    return MediaQuery.of(context).size.height <= 600
        ? const Flexible(flex: 2, child: SizedBox())
        : const SizedBox();
  }
  //mkate a listTile margin dynamically according to screen height
  double marginInsideListTile(BuildContext context) {
    if (isSmallScreen(context)) {
      return 2;
    } else if (isMediumScreen(context)) {
      return 3;
    } else {
      return 4;
    }
  }

  // if a screen height under or equal 600dp give true else give false
  // bool isSmallScreen(BuildContext context) {
  //   return MediaQuery.of(context).size.height <= 600;
  // }

  // if a screen height above or equal 600dp  and in under or equal 900 give true else give false

  bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.height >= 600 &&
        MediaQuery.of(context).size.height <= 900;
  }

//if a screen under 600dp height give true or if screen between 600dp and 900dp give true else give false
  bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.height <= 670;
  }

  bool isSmallScreenToAppBar(BuildContext context) {
    return MediaQuery.of(context).size.height <= 765;
  }
}
