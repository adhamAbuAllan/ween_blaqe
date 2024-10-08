import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../../constants/nums.dart';

class AlertWithTwoBtn {
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
            backgroundColor: themeMode.isDark
                ? kContainerColorLightMode
                : kContainerColorDarkMode,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: themeMode.isDark
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode,
                    strokeAlign: 0,
                    width: 0.5)),
            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                  fontFamily: 'IBM', fontSize: 18),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode, fontFamily: 'IBM', fontSize: 18),
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    onClicked();
                  },
                  style: outlinedButton(themeMode:themeMode),
                  child: Text(
                    textOfOkButton,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBM',
                      color:
                          kPrimaryColorLightMode, //for delete apartment button
                    ),
                  )),
              // SizedBox(width: 1,),

              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: fullButton(themeMode: themeMode),


                  child: Text(textOfCancelButton)),
            ],
          );
        });
  }
}

class NormalAlert {
  static show(
      BuildContext context, String title, String message, String textOfButton) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: themeMode.isDark
                  ? kContainerColorLightMode
                  : kContainerColorDarkMode,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: themeMode.isDark
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode,
                    strokeAlign: 0,
                    width: 0.5)),
            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode, fontFamily: 'IBM', fontSize: 18),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode, fontFamily: 'IBM', fontSize: 18),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: fullButton(themeMode: themeMode),
                  child: Text(
                    textOfButton,
                  )),
            ],
          );
        });
  }
}
