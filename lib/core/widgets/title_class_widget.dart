import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
class TitleClassWidget extends StatelessWidget {
  const TitleClassWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  20),
          child: Text(
            title,
            style:   TextStyle(
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
              fontWeight: FontWeight.w600,
              
              inherit: true,
              color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode
            ),
          ),
        ),
        const Expanded(child: Text("")),
      ],
    );
  }
}
