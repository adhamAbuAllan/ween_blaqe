import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/button_list_tile_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';

Widget buttonAccount(Function onClick, String title,
    {Image? image,
    IconData? icon,
    Color? color,
    required BuildContext context}) {
  return ListTile(
    iconColor: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    onTap: () {
      onClick.call();
    },
    dense: getIt<AppDimension>().isSmallScreen(context),
    splashColor: themeMode.isLight
        ? kBackgroundAppColorLightMode
        : kBackgroundAppColorDarkMode,
    // minVerticalPadding: ,

    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    leading: image ??
        Icon(
          icon,
          size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
        ),
    title: Text(
      title,
      style: TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
    ),
    trailing: Icon(
      size: getIt<AppDimension>().isSmallScreen(context) ? 24 -4  : 24,
      Icons.arrow_forward_ios_rounded,
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    ),
  );
}

Widget askForHelpButton(Function onClick, String title,
    BuildContext context
    ) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
    // minVerticalPadding: ,
    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    title: Text(
      title,
      style: TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
          
          fontWeight: FontWeight.w600,
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
    ),
    trailing: Icon(
      size: getIt<AppDimension>().isSmallScreen(context) ? 24 -4  : 24,
      Icons.arrow_forward_ios_rounded,
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    ),
  );
}

Widget buttonHaveTitleAndIcon(Function onClick, String title,
    {IconData? icon, bool? isIcon, Image? image,Color? color}) {
  return ButtonListTileWidget(
    title: title,
    color: color,
    icon: icon,
    image: image,
    onTap: () => {onClick.call()},
  );
}
