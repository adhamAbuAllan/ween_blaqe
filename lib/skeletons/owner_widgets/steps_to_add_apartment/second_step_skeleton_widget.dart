import 'package:flutter/material.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/add_adv_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/button_ready_selekton.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/circle_of_steps_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/text_skeleton_ready.dart';
class SecondStepSkeletonWidget extends StatelessWidget {
  const SecondStepSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      SmallButtonReadySkeleton(),

                      Expanded(child: Text("")),
                      SmallButtonReadySkeleton()
                    ],
                  ),
                ),
                //text steps
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: const [
                        Expanded(child: Text("")),
                        TextTitleSkeletonReady(),
                        Expanded(child: Text("")),

                      ],
                    )
                ),
                //image steps
                const Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 30),
                    child: CircleOfStepsSkeletonReady()
                ),
                AddAdvantagesSkeletonReady()



              ],
            ),
          ),
        ),
      ),
    );
  }
}
