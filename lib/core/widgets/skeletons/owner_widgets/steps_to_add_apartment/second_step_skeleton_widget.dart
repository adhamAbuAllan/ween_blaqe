// import 'package:flutter/material.dart';
//
// import '../skeletons_ready/add_adv_skeleton_ready.dart';
// import '../skeletons_ready/button_ready_selekton.dart';
// import '../skeletons_ready/circle_of_steps_skeleton_ready.dart';
// import '../skeletons_ready/text_skeleton_ready.dart';
//
// class SecondStepSkeletonWidget extends StatelessWidget {
//   const SecondStepSkeletonWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: const SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       SmallButtonReadySkeleton(),
//                       Expanded(child: Text("")),
//                       SmallButtonReadySkeleton()
//                     ],
//                   ),
//                 ),
//                 //text steps
//                 Padding(
//                     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                     child: Row(
//                       children: [
//                         Expanded(child: Text("")),
//                         TextTitleSkeletonReady(),
//                         Expanded(child: Text("")),
//                       ],
//                     )),
//                 //image steps
//                 Padding(
//                     padding: EdgeInsets.fromLTRB(25, 5, 25, 30),
//                     child: CircleOfStepsSkeletonReady()),
//                 AddAdvantagesSkeletonReady()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
