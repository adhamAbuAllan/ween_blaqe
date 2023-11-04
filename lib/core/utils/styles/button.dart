import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
//fullbutton
final ButtonStyle fullButton = ElevatedButton.styleFrom(
  
    backgroundColor: kPrimaryColor,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 14,
      fontFamily: 'IBM',
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))));
//outlineButton

final ButtonStyle outlineButton = OutlinedButton.styleFrom(
  foregroundColor: kPrimaryColor,
  elevation: 0,
  textStyle: const TextStyle(
    fontSize: 14,
    color: kPrimaryColor,
    fontFamily: 'IBM',
  ),
  side: const BorderSide(width: 1, color: kPrimaryColor),
  padding: const EdgeInsets.all(1),
  alignment: Alignment.center,
);
