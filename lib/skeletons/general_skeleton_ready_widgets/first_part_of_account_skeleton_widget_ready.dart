import 'package:flutter/material.dart';
import 'package:ween_blaqe/skeletons/general_skeleton_ready_widgets/small_icon_skeleton.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/circle_of_steps_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/text_skeleton_ready.dart';
class FirstPartOfAccountSkeletonReady extends StatelessWidget {
  const FirstPartOfAccountSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleOfStepsSkeletonReady(),
        ),
        Column(
          children: const [
            TextTitleSkeletonReady(),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: SmallTextSkeletonReady()
            ),
          ],
        ),
        const Expanded(child: SizedBox(child: Text(""),)),
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0,0),
          child:SmallIconSkeletonReady()
        ),
      ],
    )  ;
  }
}
