import 'package:flutter/material.dart';
import 'skeletons_ready/add_adv_skeleton_ready.dart';
import 'skeletons_ready/add_connection_media_skeleton_ready.dart';
import 'skeletons_ready/button_ready_selekton.dart';
import 'skeletons_ready/container_of_input_text_widget_ready.dart';

class RefactorApartmentSkeleton extends StatelessWidget {
  const RefactorApartmentSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          SmallButtonReadySkeleton(),
          Expanded(child: Text("")),
          SmallButtonReadySkeleton()
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
              //add Advantages skeleton
              AddAdvantagesSkeletonReady(),
              //this group like firstStep boxes
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextReadyWidgetSkeleton(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextReadyWidgetSkeleton(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextReadyWidgetSkeleton(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ContainerInputTextReadyWidgetSkeleton(),
              ),
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
