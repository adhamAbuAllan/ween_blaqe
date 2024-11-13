import 'package:flutter/material.dart';

import '../../constants/nums.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    );
  }
}
