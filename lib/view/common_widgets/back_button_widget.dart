import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/nums.dart';

class BackButtonWidget extends ConsumerWidget {
 final void Function()? onPressed;
 final ButtonStyle? style;
  const BackButtonWidget({super.key, this.onPressed,this.style});

  @override
  Widget build(BuildContext context,WidgetRef ref,) {
    return BackButton(
      style: style,
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
      onPressed: onPressed,
    );
  }
}
