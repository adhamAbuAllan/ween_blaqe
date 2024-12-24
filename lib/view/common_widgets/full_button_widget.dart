import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FullButtonWidget extends ConsumerWidget {
  const FullButtonWidget({super.key, required this.child, required this.onPressed});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

ButtonStyle fullButton({required Color color}) {
  return ElevatedButton.styleFrom(
    backgroundColor: color,
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontFamily: "IBM",
      fontWeight: FontWeight.w500,
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7))),
  );
}
