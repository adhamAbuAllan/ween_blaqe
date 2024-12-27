import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';

class OutlinedButtonWidget extends ConsumerWidget {
  const OutlinedButtonWidget(
      {super.key,
      required this.child,
      this.onPressed,
      this.isFloatingOutlinedButton});

  final Widget child;
  final void Function()? onPressed;
  final bool? isFloatingOutlinedButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: onPressed,
      style: outlinedButton(
          isFloatingOutlinedButton: isFloatingOutlinedButton,
          forgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          backgroundColor: isFloatingOutlinedButton != null
              ? ref
                  .read(themeModeNotifier.notifier)
                  .containerTheme(ref: ref, withOpacity: 0.98)
              : ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
          primaryColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          borderColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          context: context),
      child: child,
    );
  }
}

ButtonStyle outlinedButton(
    {required Color forgroundColor,
    required Color backgroundColor,
    required Color primaryColor,
    required Color borderColor,
    required BuildContext context,
    bool? isFloatingOutlinedButton}) {
  return OutlinedButton.styleFrom(
    foregroundColor: forgroundColor,
    backgroundColor: isFloatingOutlinedButton ?? false ? backgroundColor : null,
    textStyle: TextStyle(
      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'IBM',
    ),
    side: BorderSide(width: 1, color: borderColor),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
  );
}
