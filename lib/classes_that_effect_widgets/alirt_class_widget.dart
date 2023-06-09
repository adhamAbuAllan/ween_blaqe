import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/styles/show_more_widget/about_apartment_style.dart';

class AlertWithTwoBtn{
  // var  visible = true;

  static show(
    BuildContext context,
    String title,
    String message,
      String textOfOkButton,
      String textOfCancelButton,
      Function onClicked,

      ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),side: const BorderSide(color: Colors.orange,
              strokeAlign: 0,
              width: 0.5)),

            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
            title: Text(title,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: 'IBM',
              fontSize: 18
            )
              ,
            ),
            content: Text(message,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM',
                  fontSize: 18

              ),
            ),
            actions: [

              ElevatedButton(
                  onPressed: () {
                    onClicked();



                  },style: fullButton,
                  child:  Text(textOfOkButton,

                  )),
              // SizedBox(width: 1,),

              OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },style: outlineButton,
                  child:  Text(textOfCancelButton

                  )),


            ],
          );
        });
  }


}
class NormalAlert  {
  static show(
    BuildContext context,
    String title,
    String message,
      String textOfButton
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),side: const BorderSide(color: Colors.orange,
                strokeAlign: 0,
                width: 0.5)),
            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),

            title: Text(title,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: 'IBM',
              fontSize: 18
            )
              ,
            ),
            content: Text(message,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM',
                  fontSize: 18

              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },style: fullButton,
                  child:  Text(textOfButton,

                  )),

            ],
          );
        });
  }


}
