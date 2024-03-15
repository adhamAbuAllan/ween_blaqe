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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          SmallButtonReadySkeleton(),
          Expanded(child: Text("")),
          SmallButtonReadySkeleton()
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
                  child: CircleOfStepsSkeletonReady()),

              //add title box
              ContainerInputTextReadyWidgetSkeleton(),
              //description box
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputLongTextReadyWidgetSkeleton(),
              ),
              AddConnectionMediaSkeletonReady()
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton.extended(
        // extendBody: true,

        onPressed: null,
        label: Text("            "),
        backgroundColor: Colors.white,
        // foregroundColor: Colors.grey.shade800,
        // child:SkeletonAvatar(
        //     style: SkeletonAvatarStyle(width: 8, height:58 ,
        //         borderRadius: BorderRadius.circular(7))),
      ),
    ));
  }
}
