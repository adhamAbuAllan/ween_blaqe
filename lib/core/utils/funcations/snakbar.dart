import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';

void  showSnakBar( BuildContext context,String message,
    { IconData? icon,bool ? withButton,String ?textOfButton,void Function()? onPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(


      SnackBar(

       clipBehavior: Clip.antiAliasWithSaveLayer,
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    duration:   Duration(seconds: connectivityController.isConnection() ?
    3: 5 ) ,
    padding: icon != null ? const EdgeInsets.all(10) : kTabLabelPadding
          ,
      // backgroundColor:state?? false ?  Colors.black..86)  : Colors.grey[900] ,
      content: icon != null
          ?
      Row(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [

          Icon(
                  icon,
                  color: connectivityController.isConnection()
                      ? Colors.green
                      : Colors.grey.withValues(alpha: .87),
                  size: 28,


                ),
        withButton??false ? TextButton(onPressed: onPressed, child:Text(textOfButton??"") ): const SizedBox()
        ],
      ):Text(
        message,
        style: TextStyle(fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16, fontFamily: "Cairo"),
      ),
        margin: const EdgeInsets.only( bottom: 20,left: 25,right: 25),
        ) );
}
