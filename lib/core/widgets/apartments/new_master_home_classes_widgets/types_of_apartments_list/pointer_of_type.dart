import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
class ApartmentShowTypesPointer extends StatelessWidget {
  const ApartmentShowTypesPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(   
      width: getIt<AppDimension>().isSmallScreen(context) ? (50 / 3) : (50 / 2.7),
      height: getIt<AppDimension>().isSmallScreen(context) ? (50 / 3) : (50 / 2.7),
      decoration: BoxDecoration(
        color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        borderRadius: BorderRadiusDirectional.circular(
          getIt<AppDimension>().isSmallScreen(context) ? (7 / 2.5) : (7 / 2),
        ),
        border: Border.all(
          color: themeMode.isLight ? kPrimaryColor300LightMode : kPrimaryColor300DarkMode,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: getIt<AppDimension>().isSmallScreen(context) ? (7 / 2.5) : (7 / 2),
        ),
      ),

    );
  }
}
