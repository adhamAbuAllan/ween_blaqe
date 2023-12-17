// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
//
// class ContainerOrderOfStudentClassWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   final String location;
//   final int price;
//   final String dateOfBooking;
//   const ContainerOrderOfStudentClassWidget(
//       {Key? key,
//       required this.title,
//       required this.image,
//       required this.price,
//       required this.location,
//       required this.dateOfBooking})
//       : super(key: key);
//
//   @override
//   State<ContainerOrderOfStudentClassWidget> createState() =>
//       _ContainerOrderOfStudentClassWidgetState();
// }
//
// class _ContainerOrderOfStudentClassWidgetState
//     extends State<ContainerOrderOfStudentClassWidget> {
//   var width = 100.0;
//   var height = 100.0;
//   @override
//   Widget build(BuildContext context) {
//     var image = widget.image;
//     var title = widget.title;
//     var location = widget.location;
//     var price = widget.price;
//     var dateOfBooking = widget.dateOfBooking;
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
//         width: double.infinity,
//         padding: const EdgeInsets.fromLTRB(25, 20, 25, 25),
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
//                   child: Text(dateOfBooking,
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
//                           const TextSpan(
//                               text: "الاجرة:",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey,
//                               )),
//                           TextSpan(
//                               text: "$price",
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey,
//                               )),
//                           const TextSpan(
//                               text: "شيكل/شهري",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey,
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
