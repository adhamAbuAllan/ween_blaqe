// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
// class ProfileImage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String? dateOfJoin;
//   const ProfileImage(
//       {Key? key, required this.image, required this.name, this.dateOfJoin})
//       : super(key: key);
//
//   @override
//   State<ProfileImage> createState() => _ProfileImageState();
// }
//
// class _ProfileImageState extends State<ProfileImage> {
//   @override
//   Widget build(BuildContext context) {
//     var image = widget.image;
//     var name = widget.name;
//     var dateOfJoin = widget.dateOfJoin;
//     return Container(
//       margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(7),
//         color: kContainerColor,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundImage: NetworkImage(image),
//                     radius: 30,
//                   ),
//                 ),
//                 Text(
//                   name,
//                   style: const TextStyle(fontSize: 16, fontFamily: 'IBM'),
//                 ),
//                 const Expanded(child: Text("")),
//               ],
//             ),
//           ),
//           //join history
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
//                 child: Text(
//                   "انضم في$dateOfJoin",
//                   style: const TextStyle(
//                       fontSize: 13, fontFamily: 'IBM', color: Colors.grey),
//                 ),
//               ),
//               const Expanded(child: Text(""))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
