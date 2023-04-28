import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
class SmallButtonReadySkeleton extends StatelessWidget {
  const SmallButtonReadySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
      child: SkeletonAvatar(
          style: SkeletonAvatarStyle(width: 55, height:38 )),
    );
  }
}
