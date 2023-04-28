import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
class TextTitleSkeletonReady extends StatelessWidget {
  const TextTitleSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SkeletonLine(
      style: SkeletonLineStyle(
          height: 28,
          width: 140,
          borderRadius: BorderRadius.circular(7/2)
      ),
    );
  }
}
class TextAdvantagesSkeletonReady extends StatelessWidget {
  const TextAdvantagesSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SkeletonAvatar(
              style: SkeletonAvatarStyle(width: 24, height: 24)),
        ),

        SkeletonLine(
          style: SkeletonLineStyle(
              height: 28,
              width: 200,
              borderRadius: BorderRadius.circular(7/2)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
          child: SkeletonAvatar(
              style: SkeletonAvatarStyle(width: 32, height: 32)),
        ),

      ],
    );
  }
}

