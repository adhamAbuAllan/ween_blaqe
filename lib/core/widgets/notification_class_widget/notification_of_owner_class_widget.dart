// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
// class NotificationOfStudentClassWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   final String responseFromOwner;
//   final String location;
//   final String dateOfNotification;
//   const NotificationOfStudentClassWidget(
//       {Key? key,
//       required this.title,
//       required this.image,
//       required this.responseFromOwner,
//       required this.location,
//       required this.dateOfNotification})
//       : super(key: key);
//
//   @override
//   State<NotificationOfStudentClassWidget> createState() =>
//       _NotificationOfStudentClassWidgetState();
// }
//
// class _NotificationOfStudentClassWidgetState
//     extends State<NotificationOfStudentClassWidget> {
//   var width = 100.0;
//   var height = 100.0;
//   @override
//   Widget build(BuildContext context) {
//     var image = widget.image;
//     var title = widget.title;
//     var location = widget.location;
//     var responseFromOwner = widget.responseFromOwner;
//     var dateOfNotification = widget.dateOfNotification;
//     return GestureDetector(
//       // onTap: (){
//       //   Navigator.of(context).push(
//       //     MaterialPageRoute(builder: (context) {
//       //       // return ApartmentOfOwner();
//       //     }),
//       //   );
//       // },
//       child: Container(
//         margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//         width: 373,
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           color: kContainerColor,
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const Expanded(child: Text("")),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   child: Text(dateOfNotification,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: 'IBM',
//                         inherit: true,
//                         color: Colors.grey.shade600,
//                       )),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(7),
//                     child: Image(
//                       image: AssetImage(image),
//                       width: width,
//                       height: height,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     Text(title,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'IBM',
//                           inherit: true,
//                           color: Colors.grey.shade800,
//                         )),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'العنوان:',
//                             style: TextStyle(
//                                 fontSize: 14.0,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey.shade800),
//                           ),
//                           TextSpan(
//                               text: location,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey.shade800,
//                               )),
//                         ],
//                       ),
//                     ),
//
//                     // Text(location),
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: responseFromOwner,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: kPrimaryColor,
//                               )),
//                         ],
//                       ),
//                     ),
//
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
