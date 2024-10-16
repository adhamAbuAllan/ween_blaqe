// import 'dart:ui_web';

import 'package:flutter/material.dart';

import '../../constants/nums.dart';

class EmptyScreenClassWidget extends StatefulWidget {
  const EmptyScreenClassWidget({
    super.key,
    required this.centerIcon,
    required this.centerText,
     this.underCenterText,
     this.centerIconInUnderCenterText,
     this.underCenterTextAfterIcon,
     this.underCenterTextBeforeIcon,
    // this.isUnderCenterTextHaveIcon
  });

  final IconData centerIcon;
  final String centerText;
  final String ?underCenterText;
  final IconData? centerIconInUnderCenterText;
  final String ?underCenterTextAfterIcon;
  final String? underCenterTextBeforeIcon;

  // final bool? isUnderCenterTextHaveIcon;

  @override
  State<EmptyScreenClassWidget> createState() => _EmptyScreenClassWidgetState();
}

class _EmptyScreenClassWidgetState extends State<EmptyScreenClassWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,

        // textDirection: TextDirection.rtl,

        children: [
          Icon(
            size: 100 * 2,
            widget.centerIcon,
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          ),
          Text(
            widget.centerText,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'IBM',
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            ),
          ),
          widget.centerIconInUnderCenterText != null
              ? CustomUnderCenterText(
                  centerIconInUnderCenterText: widget
                      .centerIconInUnderCenterText??Icons.emoji_emotions_outlined,
                  underCenterTextBeforeIcon: widget.underCenterTextBeforeIcon??"",
                  underCenterTextAfterIcon: widget.underCenterTextAfterIcon??"",)
              : Text(
                  widget.underCenterText??"put your under center text here",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBM',
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  ),
                ),
        ],
      ),
    );
  }
}

class CustomUnderCenterText extends StatefulWidget {
  const CustomUnderCenterText(
      {super.key,
      required this.centerIconInUnderCenterText,
      required this.underCenterTextBeforeIcon,
      required this.underCenterTextAfterIcon});

  final IconData centerIconInUnderCenterText;
  final String underCenterTextAfterIcon;
  final String underCenterTextBeforeIcon;

  @override
  State<CustomUnderCenterText> createState() => _CustomUnderCenterTextState();
}

class _CustomUnderCenterTextState extends State<CustomUnderCenterText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: "${widget.underCenterTextBeforeIcon} ",style:
          TextStyle(
            fontSize: 16,
            fontFamily: 'IBM',
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
          )),
          TextSpan(
            children: [
              WidgetSpan(
                child: Icon(widget.centerIconInUnderCenterText, size: 20,
                  color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,),
              ),
            ],
          ),
          TextSpan(text: " ${widget.underCenterTextAfterIcon}", style:
          TextStyle(
            fontSize: 16,
            fontFamily: 'IBM',
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
          )),
        ],
      ),
    );
  }
}
