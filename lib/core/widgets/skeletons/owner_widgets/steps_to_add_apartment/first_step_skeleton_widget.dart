import 'package:flutter/material.dart';
import '../skeletons_ready/button_ready_selekton.dart';
import '../skeletons_ready/circle_of_steps_skeleton_ready.dart';
import '../skeletons_ready/container_of_input_text_widget_ready.dart';
import '../skeletons_ready/text_skeleton_ready.dart';

class FirstStepSkeleton extends StatelessWidget {
  const FirstStepSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SmallButtonReadySkeleton(),
                      Expanded(child: Text("")),
                      SmallButtonReadySkeleton()
                    ],
                  ),
                ),
                //text steps
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: [
                        Expanded(child: Text("")),
                        TextTitleSkeletonReady(),
                        Expanded(child: Text("")),
                      ],
                    )),
                //image steps
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 30),
                    child: CircleOfStepsSkeletonReady()),
                //city box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextReadyWidgetSkeleton(),
                ),
                //location box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextReadyWidgetSkeleton(),
                ),
                //rooms box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextReadyWidgetSkeleton(),
                ),
                //bathrooms box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ContainerInputTextReadyWidgetSkeleton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
