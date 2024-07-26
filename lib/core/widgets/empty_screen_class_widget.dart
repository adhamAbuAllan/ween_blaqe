import 'package:flutter/material.dart';

import '../../constants/nums.dart';

class EmptyScreenClassWidget extends StatefulWidget {
  const EmptyScreenClassWidget(
      {super.key, required this.centerIcon, required this.centerText, required this.underCenterText});

  final IconData centerIcon;
  final String centerText;
  final String underCenterText;

  @override
  State<EmptyScreenClassWidget> createState() => _EmptyScreenClassWidgetState();
}

class _EmptyScreenClassWidgetState extends State<EmptyScreenClassWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(widget.centerIcon),
        Text(
          widget.centerText,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'IBM',
            color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
          ),
        )  ,      Text(
          widget.underCenterText,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'IBM',
            color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
          ),
        ),
      ],
    );
  }
}
