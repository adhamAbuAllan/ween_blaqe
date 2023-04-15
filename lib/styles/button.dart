import 'package:flutter/material.dart';
// import 'package:ween_blaqe/styles/colors.dart';
//fullbutton
final ButtonStyle fullButton = ElevatedButton.styleFrom(
  backgroundColor: Colors.orange.shade500,
  elevation: 0,
    textStyle: TextStyle(fontSize: 14,
       fontFamily: 'IBM',

    ),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(7))
)
);
//outlineButton
 final  ButtonStyle  outlineButton = OutlinedButton.styleFrom(
    primary: Colors.orange,
    textStyle: TextStyle(fontSize: 14,color: Colors.orange,
       fontFamily: 'IBM',
 ),
    side: BorderSide(width:1,color: Colors.orange),
    padding: EdgeInsets.all(0),
    alignment: Alignment.center,
    elevation: 0,
);
