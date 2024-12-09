import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';

class ThemeModeSwitcherWidget extends ConsumerWidget {
  const ThemeModeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
        inactiveThumbColor: kBackgroundAppColorLightMode,
        activeColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        dense: getIt<AppDimension>().isSmallScreen(context),
        title: Row(
          children: [
            Icon(
              themeMode.isLight
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
              size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(SetLocalization.of(context)!.getTranslateValue("appearance"),
                style: TextStyle(
                    fontSize: 16,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)),
          ],
        ),
        value: themeMode.isLight,
        onChanged: (bool value) async {
        ///  cityModelController.cityId.value = 0;
        //   setState(() {
           /// themeMode.onChanged(value);
            // sp.get('isDark');
            // myPushName(context, MyPagesRoutes.splashScreen);

            myPushNameAnimation(context);
          // });
        });
  }
}
