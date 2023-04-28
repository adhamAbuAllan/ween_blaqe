import 'package:flutter/material.dart';

import '../skeletons_ready/add_connection_media_skeleton_ready.dart';
import '../skeletons_ready/button_ready_selekton.dart';
import '../skeletons_ready/circle_of_steps_skeleton_ready.dart';
import '../skeletons_ready/container_of_input_text_widget_ready.dart';
import '../skeletons_ready/text_skeleton_ready.dart';
class FourthStepSkeletonWidget extends StatelessWidget {
  const FourthStepSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
                    child: CircleOfStepsSkeletonReady()
                ),
                //add title box
                ContainerInputTextReadyWidgetSkeleton(),
                //description box
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputLongTextReadyWidgetSkeleton(),

                ),
                AddConnectionMediaSkeletonReady()

              ],
            ),
          ),
        ),
        floatingActionButton:
          FloatingActionButton.extended(
          // extendBody: true,

            onPressed: null,
            label: Text("            "),
            backgroundColor: Colors.white,
            // foregroundColor: Colors.grey.shade800,
            // child:SkeletonAvatar(
            //     style: SkeletonAvatarStyle(width: 8, height:58 ,
            //         borderRadius: BorderRadius.circular(7))),
          ),
      )
    );
  }
}
