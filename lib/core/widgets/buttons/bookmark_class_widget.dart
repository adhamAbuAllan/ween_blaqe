// import 'package:flutter/material.dart';
// import '../../constants/nums.dart';
//
//
//
// class BookmarkClassWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   final String location;
//   final int price;
//   final String booking;
//   bool ? isvisible = false;
//
//    BookmarkClassWidget({
//     Key? key,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.booking,
//     required this.location,
//     this.isvisible
//   }) : super(key: key);
//
//   @override
//   State<BookmarkClassWidget> createState() => _BookmarkClassWidgetState();
// }
//
// class _BookmarkClassWidgetState extends State<BookmarkClassWidget> {
//   var width = 100.0;
//   var height = 100.0;
//
//   @override
//   Widget build(BuildContext context) {
//     var image = widget.image;
//     var title = widget.title;
//     var location = widget.location;
//     var price = widget.price;
//     var booking = widget.booking;
//     var isvisable = widget.isvisible;
//
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
//                   child: Text(booking,
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
//                             text: 'الاجرة:',
//                             style: TextStyle(
//                                 fontSize: 16.0,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey.shade800),
//                           ),
//                           TextSpan(
//                               text: "$price",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IBM',
//                                 inherit: true,
//                                 color: Colors.grey.shade800,
//                               )),
//                           TextSpan(
//                               text: "شيكل/شهري",
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
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(children: [
//               const Expanded(child: Text("")),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                 child: IconButton(
//                   onPressed: () {
//                     isvisable! ? Icons.bookmark : Icons.bookmark_outline;
//                     // List<BookmarkClassWidget> bookmarkedArticles = articles.where((article) => article.isBookmarked).toList();
//
//                   },
//                   icon: const Icon(
//                     Icons.bookmark,
//                     size: 32,
//                   ),
//                 ),
//               ),
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }
