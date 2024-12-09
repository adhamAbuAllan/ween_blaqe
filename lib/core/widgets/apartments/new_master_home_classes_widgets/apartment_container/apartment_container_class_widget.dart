import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentContainer extends StatelessWidget {
  const ApartmentContainer({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 23),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight ? kContainerColorLightMode : kContainerColorDarkMode,
      ),
      child: child,
    );
  }
}
