import 'package:flutter/material.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/add_adv_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/add_connection_media_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/button_ready_selekton.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/circle_of_steps_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/container_of_input_text_widget_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/text_skeleton_ready.dart';
class RefactorApartmentSkeleton extends StatelessWidget {
  const RefactorApartmentSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.white,
            actions: [
                  SmallButtonReadySkeleton(),
                  Expanded(child: Text("")),
                  SmallButtonReadySkeleton()
            ],
          ),
      backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //city box
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),
                  ),
                  //location box
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),

                  ),
                  //rooms box
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),

                  ),
                  //bathrooms box
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ContainerInputTextReadyWidgetSkeleton(),

                  ),
                  //add Advantages skeleton
                  AddAdvantagesSkeletonReady(),
                  //this group like firstStep boxes
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),

                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextReadyWidgetSkeleton(),

                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ContainerInputTextReadyWidgetSkeleton(),

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
    ));
  }
}
