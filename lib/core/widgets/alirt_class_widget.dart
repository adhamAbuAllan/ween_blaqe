import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../../constants/get_it_controller.dart';
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
            backgroundColor: themeMode.isLight
                ? kContainerColorLightMode
                : kContainerColorDarkMode,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: themeMode.isLight
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode,
                    strokeAlign: 0,
                    width: 0.5)),
            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
                  ?16:18),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
               fontSize: getIt<AppDimension>().isSmallScreen(context)
                  ?16:18),
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    onClicked();
                  },
                  style: outlinedButton(themeMode: themeMode,context: context),
                  child: Text(
                    textOfOkButton,
                    style:  TextStyle(
                                fontSize: getIt<AppDimension>().isSmallScreen(context)
          ?14:16,
                      
                      color:
                          kPrimaryColorLightMode, //for delete apartment button
                    ),
                  )),
              // SizedBox(width: 1,),

              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: fullButton(),
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
            backgroundColor: themeMode.isLight
                ? kContainerColorLightMode
                : kContainerColorDarkMode,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: themeMode.isLight
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode,
                    strokeAlign: 0,
                    width: 0.5)),
            actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?15:16),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?14:16, ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: fullButton(),
                  child: Text(
                    textOfButton,
                    style: TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 13
                            : 15,fontWeight: FontWeight.w100,fontFamily: "IBM",),
                  )),
            ],
          );
        });
  }
}
