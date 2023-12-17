// import 'package:flutter/material.dart';
//
// import 'image_list_view_widget.dart';
//
// class ContainerAddImagesClassWidget extends StatefulWidget {
//   final String title;
//   final List images;
//   const ContainerAddImagesClassWidget({
//     Key? key,
//     required this.title,
//     required this.images,
//   }) : super(key: key);
//
//   @override
//   State<ContainerAddImagesClassWidget> createState() =>
//       _ContainerAddImagesClassWidgetState();
// }
//
// class _ContainerAddImagesClassWidgetState
//     extends State<ContainerAddImagesClassWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       child: Container(
//         margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//         // width: 373,
//         // height: 140,
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//         ),
//
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                   child: Text(
//                     widget.title,
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontSize: 16,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                 ),
//                 // const Expanded(child: Text("")),
//               ],
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: ImagesListView(listImages: widget.images),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
