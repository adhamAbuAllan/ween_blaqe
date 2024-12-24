import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';

class OutlineButtonWidget extends ConsumerWidget {
  const OutlineButtonWidget({super.key, required this.child, this.onPressed});
final Widget child;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(onPressed: onPressed, child: child);
  }
}

ButtonStyle outlinedButton(
    {required Color forgroundColor,
    required   Color backgroundColor,
    required   Color primaryColor,
      required Color borderColor,
      required BuildContext context,
      bool? isFloatingOutlinedButton}) {
  return OutlinedButton.styleFrom(
    foregroundColor: forgroundColor,

    backgroundColor: isFloatingOutlinedButton ?? false
        ? backgroundColor
        : null,
    textStyle: TextStyle(

      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
      color:
    primaryColor,
      fontWeight: FontWeight.w500 ,
      fontFamily: 'IBM',
    ),
    side: BorderSide(
        width: 1,
        color: borderColor
    ),

    padding: const EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
  );
}
