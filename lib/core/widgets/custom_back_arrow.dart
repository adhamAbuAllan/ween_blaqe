import 'package:flutter/material.dart';

import '../../constants/nums.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
      child: BackButton(
        style: const ButtonStyle(
          // iconSize : WidgetStateProperty.all(34),
          //    maximumSize: WidgetStateProperty.all(Size(32,
          //        32)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
      ),
    );
  }
}
