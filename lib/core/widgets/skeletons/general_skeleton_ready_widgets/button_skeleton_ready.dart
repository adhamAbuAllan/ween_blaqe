import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ButtonSkeletonReady extends StatelessWidget {
  const ButtonSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: SkeletonLine(
        style: SkeletonLineStyle(
            width: 350, height: 55, borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
