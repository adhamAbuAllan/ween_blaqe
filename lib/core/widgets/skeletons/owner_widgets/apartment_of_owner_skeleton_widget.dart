// import 'package:skeletons/skeletons.dart';
//
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
//
//
// class ApartmentOfOwnerSkeletonWidget extends StatefulWidget {
//   const ApartmentOfOwnerSkeletonWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ApartmentOfOwnerSkeletonWidget> createState() =>
//       _ApartmentOfOwnerSkeletonWidgetState();
// }
//
// class _ApartmentOfOwnerSkeletonWidgetState
//     extends State<ApartmentOfOwnerSkeletonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: SingleChildScrollView(
//             child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //back arrow skeleton button
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                   child: SkeletonAvatar(
//                       style: SkeletonAvatarStyle(width: 38, height: 28)),
//                 ),
//                 Expanded(child: Text("")),
//               ],
//             ),
//             //this widget for image only
//             SkeletonAvatar(
//               style: SkeletonAvatarStyle(
//                   width: 373,
//                   height: 240,
//                   borderRadius: BorderRadius.circular(7)),
//             ),
//             //general info
//             Container(
//               padding: const EdgeInsets.all(10.0),
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //general info apartment skeleton text
//                   Row(
//                     children: [
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18,
//                             width: 100,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       const Expanded(child: Text("")),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   //title and price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //title
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18,
//                             width: 200,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       //price
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18,
//                             width: 100,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   //location and sum of students allowed
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //title
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18,
//                             width: 200,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       //price
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18,
//                             width: 100,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             //about apartment skeleton
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 children: [
//                   //about apartment  text
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
//                         child: SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 18,
//                               width: 100,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ),
//                       const Expanded(child: Text("")),
//                     ],
//                   ),
//
//                   //about apartment items
//                   const SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 80,
//                             )),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 80,
//                             )),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 80,
//                             )),
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//             //advantages
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 children: [
//                   //text of adv skeleton
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                         child: SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 18,
//                               width: 100,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ),
//                       const Expanded(child: Text("")),
//                     ],
//                   ),
//                   //advantages skeleton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 50,
//                               width: 340,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //button of advantages skeleton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 20, 10, 15),
//                     child: Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               width: 350,
//                               height: 55,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //notes of owner
//             Container(
//                 padding: const EdgeInsets.all(10.0),
//                 margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
//                 width: 373,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   color: kContainerColor,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     //general info apartment skeleton text
//                     Row(
//                       children: [
//                         SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 18,
//                               width: 100,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                         const Expanded(child: Text("")),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
//                       child: Column(
//                         children: [
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(height: 5),
//                           SkeletonLine(
//                             style: SkeletonLineStyle(
//                                 height: 18,
//                                 width: 400,
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 )),
//             //social buttons skeleton
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 children: [
//                   //about apartment  text
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
//                         child: SkeletonLine(
//                           style: SkeletonLineStyle(
//                               height: 18,
//                               width: 100,
//                               borderRadius: BorderRadius.circular(4)),
//                         ),
//                       ),
//                       const Expanded(child: Text("")),
//                     ],
//                   ),
//
//                   const SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 40,
//                             )),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 40,
//                             )),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
//                             child: SkeletonAvatar(
//                                 style: SkeletonAvatarStyle(
//                               width: 100,
//                               height: 40,
//                             )),
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//             //two buttons refactor and delete
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 20, 30, 25),
//                   child: SizedBox(
//                     width: 150,
//                     height: 65,
//                     child: SkeletonAvatar(),
//                   ),
//                 ),
//                 Expanded(child: Text("")),
//                 Padding(
//                     padding: EdgeInsets.fromLTRB(30, 20, 0, 25),
//                     child: SizedBox(
//                       width: 150,
//                       height: 65,
//                       child: SkeletonAvatar(),
//                     )),
//               ],
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
