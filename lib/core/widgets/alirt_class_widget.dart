import 'package:flutter/material.dart';
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
            actionsAlignment: MainAxisAlignment.spaceEvenly,
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
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,

                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?18:20,fontWeight:FontWeight.w800 ),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,


                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?15:17,fontWeight: FontWeight.w400),
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);},
                  style: outlinedButton(themeMode: themeMode,context:
                  context).copyWith(textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 16
                            : 18,
                      )
                  )),
                  child: Text(
                    textOfCancelButton,

                  )),
              // SizedBox(width: 1,),

              ElevatedButton(
                  onPressed: () {
                    onClicked();


                  },
                  style: fullButton().copyWith(textStyle: WidgetStateProperty.all(
          TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context)
          ? 16
              : 18,
          )
          )),
                  child: Text(textOfOkButton,))
            ],
          );
        });
  }
}

class NormalAlert {
  static show(
      BuildContext context, String title, String message, String
      textOfOkButton) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
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
            title: Text(
              title,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,

                  
                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?18:20,fontWeight:FontWeight.w800 ),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ?15:17,fontWeight: FontWeight.w400 ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);},
                  style: fullButton().copyWith(textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 16
                            : 18,
                      )
                  )),
                  child: Text(
                    textOfOkButton,

                  )),
            ],
          );
        });
  }
}
