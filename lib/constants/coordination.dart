import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimension {
  // the icons will be more adaptive by check a width of screen
  //a upperLimit is the max size of icon according width of screen and a
  // lowerLimit is the min size of icon according width of screen too ,
  // and another one is a mediumLimit that will be the middle size of icon
  //this make a icons more adaptive in UI
  double iconImageSize(BuildContext context,
      {double? upperLimit, lowerLimit, mediumLimit}) {
    return MediaQuery.sizeOf(context).width >= 414
        ? upperLimit ?? 32.w
        : (MediaQuery.sizeOf(context).width >= 390
            ? mediumLimit ?? 28.w
            : lowerLimit ?? 24.w);
  }

  //usage this method instade a SizeBox widget that make app more adaptive UI
  double spaceBetweenWidgets(BuildContext context,
      {double? upperLimit, double? lowerLimit, double? mediumLimit}) {
    return MediaQuery.of(context).size.width >= 414
        ? upperLimit ?? 60.h
        : (MediaQuery.sizeOf(context).width >= 390
            ? mediumLimit ?? 40.h
            : lowerLimit ?? 30.h);
  }

  //you can use a Flexable instade this method
  double endSpaceOfScreenBetweenWidgets(BuildContext context,
      {double? upperLimit, double? lowerLimit, double? mediumLimit}) {
    return MediaQuery.sizeOf(context).width >= 414
        ? lowerLimit ?? 0
        : (MediaQuery.sizeOf(context).width >= 390
            ? mediumLimit ?? 40.h
            : upperLimit ?? 100.h);
  }

  //if an Image child of Flexible this method will be called
  Widget makeImageMoreSmall(BuildContext context) {
    return MediaQuery.sizeOf(context).height <= 600
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
    return MediaQuery.sizeOf(context).height >= 600 &&
        MediaQuery.sizeOf(context).height <= 900;
  }

//if a screen under 600dp height give true or if screen between 600dp and 900dp give true else give false

  // bool isSmallScreen(BuildContext context, {bool isEmulator = true}) {
  //   // Get screen size in pixels
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double screenHeight = MediaQuery.of(context).size.height;
  //
  //   // Get device pixel ratio (DPI scaling)
  //   double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  //
  //   // Convert pixels to physical screen size (in inches)
  //   double physicalWidthInches = screenWidth /
  //       devicePixelRatio /
  //       160; // 160 DPI is the standard baseline
  //   double physicalHeightInches = screenHeight / devicePixelRatio / 160;
  //
  //   // Calculate diagonal screen size in inches using Pythagorean theorem
  //   double diagonalInches =
  //       sqrt(pow(physicalWidthInches, 2) + pow(physicalHeightInches, 2));
  //   debugPrint("the inch of screen is $diagonalInches");
  //   // Check if screen is smaller than 5 inches
  //   if (isEmulator) {
  //     return diagonalInches < 2;
  //   } else {
  //     return diagonalInches < 5;
  //   }
  // }
  bool isSmallScreen(BuildContext context) {// Get the screen size in pixels
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;

    // Calculate the diagonal in pixels
    final double diagonalPixels =
    sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight));

    // Get the device's pixel density (DPI)
    final double dpi = mediaQuery.devicePixelRatio * 160;

    // Debugging: Print screen dimensions and DPI
    print('Screen Width: $screenWidth, Height: $screenHeight');
    print('Device Pixel Ratio: ${mediaQuery.devicePixelRatio}');
    print('Calculated DPI: $dpi');

    // Handle simulators/emulators with low DPI
    final double effectiveDpi = dpi < 160 ? 160 : dpi;

    // Convert diagonal from pixels to inches
    final double diagonalInches = diagonalPixels / effectiveDpi;

    // Debugging: Print the calculated diagonal in inches
    print('Diagonal Inches: $diagonalInches');

    // Return true if the screen size is less than 5 inches
    return dpi < 450 ;
  }

  bool isSmallScreenToAppBar(BuildContext context) {
    return MediaQuery.sizeOf(context).height <= 765;
  }
}
