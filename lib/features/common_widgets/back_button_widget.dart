import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/nums.dart';

class BackButtonWidget extends ConsumerWidget {
 final void Function()? onPressed;
  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context,WidgetRef ref,) {
    return BackButton(
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
      onPressed: onPressed,
    );
  }
}
