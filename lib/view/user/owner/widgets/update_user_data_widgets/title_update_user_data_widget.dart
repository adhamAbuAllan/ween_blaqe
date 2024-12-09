import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class TitleUpdateUserDataWidget extends ConsumerWidget {
  const TitleUpdateUserDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20,
          getIt<AppDimension>().isSmallScreen(context) ? 50 / 1.6 : 50, 20, 0),
      child: Text(
        SetLocalization.of(context)!.getTranslateValue("edit_my_data"),
        style: TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
          fontWeight: FontWeight.w600,
          inherit: true,
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
        ),
      ),
    );
  }
}
