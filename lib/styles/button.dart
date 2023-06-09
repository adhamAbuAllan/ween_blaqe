import 'package:flutter/material.dart';
// import 'package:ween_blaqe/styles/colors.dart';
// button style widget
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
    foregroundColor: Colors.orange,
   elevation: 0,

   textStyle: TextStyle(
     fontSize: 14,color: Colors.orange,
       fontFamily: 'IBM',
 ),
    side: BorderSide(width:1,color: Colors.orange),
    padding: EdgeInsets.all(1),
    alignment: Alignment.center,
);

