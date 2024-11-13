import 'package:flutter/material.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
class TitleScreenWidget extends StatelessWidget {
  const TitleScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      //title signup
      Padding(
        padding: EdgeInsets.fromLTRB(
            20,
            getIt<AppDimension>().isSmallScreen(context)
                ? 20
                : 30,
            20,
            0),
        child: Text(

          SetLocalization.of(context)!
              .getTranslateValue("start_registration"),
          style: TextStyle(

            fontSize:
            getIt<AppDimension>().isSmallScreen(context)
                ? 22
                : 26,
            inherit: true,
            fontWeight: FontWeight.w600,
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
          ),
        ),
      );
    //nameApp

  }
}
class NameOfApp extends StatelessWidget {
  const NameOfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
        children: [
          Text(
            SetLocalization.of(context)!
                .getTranslateValue("in"),
            style: TextStyle(
                fontSize: getIt<AppDimension>()
                    .isSmallScreen(context)
                    ? 22
                    : 26,
                inherit: true,
                fontWeight: FontWeight.w600,
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode),
          ),
          Text(
            SetLocalization.of(context)!
                .getTranslateValue("ween_balaqee"),
            style: TextStyle(
              fontSize: getIt<AppDimension>()
                  .isSmallScreen(context)
                  ? 22
                  : 26,
              inherit: true,
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
