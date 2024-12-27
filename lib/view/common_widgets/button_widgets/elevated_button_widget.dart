import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/color_provider.dart';
class ElevatedButtonWidget extends ConsumerWidget {
  const ElevatedButtonWidget({super.key, required this.child, required this
      .onPressed,this.color,this.onLongPress});
  final void Function()? onPressed;
  final Widget child;
  final Color? color;
  final  void Function()?onLongPress;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onLongPress: onLongPress,
      onPressed: onPressed
      ,style: fullButton(color: color??ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref))
      , child: child,);
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
