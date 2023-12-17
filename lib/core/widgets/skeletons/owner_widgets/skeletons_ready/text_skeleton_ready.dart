// import 'package:flutter/material.dart';
// import 'package:skeletons/skeletons.dart';
//
// class TextTitleSkeletonReady extends StatelessWidget {
//   const TextTitleSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
//       child: SkeletonLine(
//         style: SkeletonLineStyle(
//             height: 28, width: 140, borderRadius: BorderRadius.circular(7 / 2)),
//       ),
//     );
//   }
// }
//
// class TextTitleApartmentSkeletonReady extends StatelessWidget {
//   const TextTitleApartmentSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//       child: SkeletonLine(
//         style: SkeletonLineStyle(
//             height: 28, width: 240, borderRadius: BorderRadius.circular(7 / 2)),
//       ),
//     );
//   }
// }
//
// class TextAdvantagesSkeletonReady extends StatelessWidget {
//   const TextAdvantagesSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Padding(
//           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//           child:
//               SkeletonAvatar(style: SkeletonAvatarStyle(width: 24, height: 24)),
//         ),
//         SkeletonLine(
//           style: SkeletonLineStyle(
//               height: 28,
//               width: 200,
//               borderRadius: BorderRadius.circular(7 / 2)),
//         ),
//         const Padding(
//           padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
//           child:
//               SkeletonAvatar(style: SkeletonAvatarStyle(width: 32, height: 32)),
//         ),
//       ],
//     );
//   }
// }
//
// class SmallTextSkeletonReady extends StatelessWidget {
//   const SmallTextSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//       child: SkeletonLine(
//         style: SkeletonLineStyle(
//             height: 28 / 1.5,
//             width: 200 / 1,
//             borderRadius: BorderRadius.circular(7 / 2)),
//       ),
//     );
//   }
// }
//
// class LongSubTextSkeletonReady extends StatelessWidget {
//   const LongSubTextSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 20, 55),
//       child: SkeletonLine(
//         style: SkeletonLineStyle(
//             height: 28 / 2,
//             width: 200,
//             borderRadius: BorderRadius.circular(7 / 2)),
//       ),
//     );
//   }
// }
//
// class TitleTextSkeletonReady extends StatelessWidget {
//   const TitleTextSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
//           child: SkeletonLine(
//             style: SkeletonLineStyle(
//               height: 34,
//               width: 120,
//               borderRadius: BorderRadius.circular(7),
//             ),
//           ),
//         ),
//         const Expanded(child: Text("")),
//       ],
//     );
//   }
// }
