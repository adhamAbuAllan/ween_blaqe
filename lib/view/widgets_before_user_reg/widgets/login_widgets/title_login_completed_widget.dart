import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';

class TitleLoginCompletedWidget extends ConsumerWidget {
  const TitleLoginCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20,
              getIt<AppDimension>().isSmallScreen(context) ? 20 : 30, 20, 0),
          child: Text(
            SetLocalization.of(context)!.getTranslateValue("login"),
            style: TextStyle(
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
                fontWeight: FontWeight.w600,
                inherit: true,
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode),
          ),
        ),
        //nameApp
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                children: <Widget>[
                  Text(
                    SetLocalization.of(context)!.getTranslateValue("in"),
                    style: TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
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
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
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
            ),
          ],
        ),
      ],
    );
  }
}