import 'package:flutter/material.dart';

void showSnakBar(@required BuildContext context, @required String message,
    {bool? isIcon = false, IconData? icon, bool? isConnect,int ?  seconds =4}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration:  Duration(seconds: isConnect ??false ? seconds = 4 :seconds!+60 ) ,
    padding: isIcon??false ? const EdgeInsets.all(10) : kTabLabelPadding  ,
      // backgroundColor:state?? false ?  Colors.black.withOpacity(.86)  : Colors.grey[900] ,
      content: isIcon ?? false
          ? Icon(
              icon!,
              color: isConnect ?? false
                  ? Colors.green
                  : Colors.grey.withOpacity(.87),
              size: 28,


            )
          : Text(
              message,
              style: const TextStyle(fontSize: 16, fontFamily: "IBM"),
            )));
}
