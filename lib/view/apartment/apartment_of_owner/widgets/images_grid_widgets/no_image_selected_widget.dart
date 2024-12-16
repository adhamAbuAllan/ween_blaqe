import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
class NoImageSelectedWidget extends ConsumerWidget {
  const NoImageSelectedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        SetLocalization.of(context)!
            .getTranslateValue("selected_images_displayed_here"),
        style: TextStyle(
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
