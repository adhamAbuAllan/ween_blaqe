import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CircleOfStepsSkeletonReady extends StatelessWidget {
  const CircleOfStepsSkeletonReady({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
        style: SkeletonAvatarStyle(
            width: 65, height: 65, borderRadius: BorderRadius.circular(65)));
  }
}

class SmallCircleSkeletonReady extends StatelessWidget {
  const SmallCircleSkeletonReady({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
        style: SkeletonAvatarStyle(
            width: 65 / 3,
            height: 65 / 3,
            borderRadius: BorderRadius.circular(65 / 3)));
  }
}
