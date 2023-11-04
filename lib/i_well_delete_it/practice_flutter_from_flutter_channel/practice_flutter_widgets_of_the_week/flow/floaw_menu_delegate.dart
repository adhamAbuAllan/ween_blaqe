import 'package:flutter/material.dart';
class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> menuAnimation;

  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0;
    for (int i = 0; i < context.childCount; i++) {
      // dx = context.getChildSize(i)!.width * i;
      // context.paintChild(i,
      //     transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0));

      final offset = i * menuAnimation.value * -50;
      context.paintChild(i,
          transform: Matrix4.translationValues(-offset, offset, 0));
      debugPrint("the offest is : $offset");
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }
}