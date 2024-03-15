import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentShowTypesContainer extends StatelessWidget {
  const ApartmentShowTypesContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 7,
                color:themeMode.isDark ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,
                strokeAlign: BorderSide.strokeAlignOutside),
            color: themeMode.isDark ? kContainerColorLightMode : kContainerColorDarkMode,
            borderRadius: BorderRadiusDirectional.circular(7),
          ),
          height: 200,
          width: 150,
          child: child),
    );
  }
}
