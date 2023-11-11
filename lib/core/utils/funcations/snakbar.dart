import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnakBar(@required BuildContext context, @required String message,
    {bool? isIcon = false, IconData? icon, bool? isConnect,int ?  seconds}) {
  ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
       clipBehavior: Clip.antiAliasWithSaveLayer,
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    duration:   Duration(seconds: isConnect??false ? 3: 5 ) ,
    padding: isIcon??false ? const EdgeInsets.all(10) : kTabLabelPadding
          ,
      // backgroundColor:state?? false ?  Colors.black.withOpacity(.86)  : Colors.grey[900] ,
      content: isIcon ?? false
          ?
      Icon(
              icon!,
              color: isConnect ?? false
                  ? Colors.green
                  : Colors.grey.withOpacity(.87),
              size: 28,


            ):Text(
        message,
        style: const TextStyle(fontSize: 16, fontFamily: "IBM"),
      ),
        margin: const EdgeInsets.only( bottom: 65,left: 25,right: 25),
        ) );
}
