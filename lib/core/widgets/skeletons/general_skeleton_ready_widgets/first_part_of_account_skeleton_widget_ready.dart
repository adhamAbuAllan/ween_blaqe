import 'package:flutter/material.dart';

import '../owner_widgets/skeletons_ready/circle_of_steps_skeleton_ready.dart';
import '../owner_widgets/skeletons_ready/text_skeleton_ready.dart';
import 'small_icon_skeleton.dart';

class FirstPartOfAccountSkeletonReady extends StatelessWidget {
  const FirstPartOfAccountSkeletonReady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleOfStepsSkeletonReady(),
        ),
        Column(
          children: [
            TextTitleSkeletonReady(),
            Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: SmallTextSkeletonReady()),
          ],
        ),
        Expanded(
            child: SizedBox(
          child: Text(""),
        )),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: SmallIconSkeletonReady()),
      ],
    );
  }
}
