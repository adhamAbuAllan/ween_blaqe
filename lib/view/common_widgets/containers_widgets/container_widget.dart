import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../constants/nums.dart';

class ContainerWidget extends ConsumerWidget {
  const ContainerWidget({super.key,required this.child,this.bottomMargin});
final Widget child;
final double ? bottomMargin;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin:  EdgeInsets.fromLTRB(10, 2, 10, bottomMargin??10),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,

      ),
      child: child,
    );
  }
}
