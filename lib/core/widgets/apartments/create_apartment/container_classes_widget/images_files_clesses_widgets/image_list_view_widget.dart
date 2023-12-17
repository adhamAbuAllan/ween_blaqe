// import 'package:flutter/material.dart';
//
// class ImagesListView extends StatefulWidget {
//   const ImagesListView({
//     super.key,
//     required this.listImages,
//   });
//
//   final List listImages;
//
//   @override
//   State<ImagesListView> createState() => _ImagesListViewState();
// }
//
// class _ImagesListViewState extends State<ImagesListView> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 1, crossAxisSpacing: 7, mainAxisSpacing: 7),
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//             ),
//             child: Image(
//               image: NetworkImage(
//                 widget.listImages[index] ?? "",
//               ),
//               fit: BoxFit.cover,
//             ));
//       },
//     );
//   }
// }
