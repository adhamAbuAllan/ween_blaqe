import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentShowTypesPointer extends StatelessWidget {
  const ApartmentShowTypesPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:
          themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
          borderRadius:
          BorderRadiusDirectional
              .circular(
              7 / 2),
          border: Border.all(
              color: themeMode.isLight ? kPrimaryColor300LightMode : kPrimaryColor300DarkMode,
              strokeAlign:
              BorderSide
                  .strokeAlignOutside,
              width: 7 / 2)),
      width: 50 / 2.7,
      height: 50 / 2.7,
    );
  }
}
