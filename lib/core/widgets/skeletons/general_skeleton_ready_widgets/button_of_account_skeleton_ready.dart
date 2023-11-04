import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ButtonOfAccountSkeletonReady extends StatelessWidget {
  const ButtonOfAccountSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 34, height: 34)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 26,
                width: 200,
                borderRadius: BorderRadius.circular(7 / 2)),
          ),
          const Expanded(child: Text("")),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 30, height: 30)),
          ),
        ],
      ),
    );
  }
}

class ButtonOfAccountWithSwitchSkeletonReady extends StatelessWidget {
  const ButtonOfAccountWithSwitchSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 34, height: 34)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 26,
                width: 200 / 1.5,
                borderRadius: BorderRadius.circular(7 / 2)),
          ),
          const Expanded(child: Text("")),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 50, height: 26)),
          ),
        ],
      ),
    );
  }
}

class ButtonOfAccountSkeletonReady2 extends StatelessWidget {
  const ButtonOfAccountSkeletonReady2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 34, height: 34)),
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                height: 26,
                width: 200 / 1.5,
                borderRadius: BorderRadius.circular(7 / 2)),
          ),
          const Expanded(child: Text("")),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 30, height: 30)),
          ),
        ],
      ),
    );
  }
}
