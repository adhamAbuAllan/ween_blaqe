// import 'package:flutter/material.dart';
// import '../../../core/widgets/notification_class_widget/notification_of_owner_class_widget.dart';
// import '../../../data_containers/add_ad_data_container.dart';
//
// class NotificationOfStudent extends StatefulWidget {
//   const NotificationOfStudent({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationOfStudentWithNotifi> createState() =>
//       _NotificationOfStudentWithNotifiState();
// }
//
// class _NotificationOfStudentWithNotifiState
//     extends State<NotificationOfStudentWithNotifi> {
//   var show = false;
//   @override
//   Widget build(BuildContext context) {
//     var title = "شقة للطلاب في مدينة الخليل";
//     var location = "الخليل - واد الهرية";
//     var responseFromOwner = "تمت الموافقة على طلب الحجز";
//     var image = "assets/images/apartments_images/image1.png";
//     var dateOfNotification = "تاريخ 04/14/2020";
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//
//         child: Column(
//
//           children: [
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                   child: Text(
//                     "الاشعارات",
//                     style: TextStyle(
//                       fontSize: 26.0,
//                       fontFamily: 'IBM',
//                       inherit: true,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Text("")),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 20, 55),
//                   child: Text(
//                     "قائمة الاشعارات",
//                     style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 14,
//                         fontFamily: 'IBM'),
//                   ),
//                 ),
//                 const Expanded(child: Text("")),
//               ],
//             ),
//             Row(
//               children: [
//                 const Expanded(child: Text("")),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: AddAdDataContainer.ownerId == null
//                       ? const Text("")
//                       : TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "مسح الكل",
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.black87,
//                                 fontSize: 16,
//                                 fontFamily: 'IBM'),
//                           )),
//                 ),
//               ],
//             ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 25),
//                 child: Image.asset("assets/images/zzz_notifiction.png",width: 450/1.3,height: 420/1.3,color: Colors.black.withOpacity(.7)),
//               ),
//             show == false
//                 ? Center(
//                     child: Container(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           // show = true;
//                         });
//                       },
//                       child: Text("لا يوجد لديك إشعارات",
//                           style: TextStyle(
//                             fontFamily: "IBM",
//                             color: Colors.grey.shade800,
//                             fontSize: 16,
//                           )),
//                     ),
//                   ))
//                 : NotificationOfStudentClassWidget(
//                     title: title,
//                     image: image,
//                     responseFromOwner: responseFromOwner,
//                     location: location,
//                     dateOfNotification: dateOfNotification)
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NotificationOfStudentWithNotifi extends StatefulWidget {
//   const NotificationOfStudentWithNotifi({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationOfStudentWithNotifi> createState() =>
//       _NotificationOfStudentWithNotifiState();
// }
//
// class NotificationOfStudentState
//     extends State<NotificationOfStudentWithNotifi> {
//   @override
//   Widget build(BuildContext context) {
//     var title = "شقة للطلاب في مدينة الخليل";
//     var location = "الخليل - واد الهرية";
//     var responseFromOwner = "تمت الموافقة على طلب الحجز";
//     var image = "assets/images/apartments_images/image1.png";
//     var dateOfNotification = "تاريخ 04/14/2020";
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                   child: Text(
//                     "الاشعارات",
//                     style: TextStyle(
//                       fontSize: 26.0,
//                       fontFamily: 'IBM',
//                       inherit: true,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Text("")),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 20, 55),
//                   child: Text(
//                     "قائمة الاشعارات",
//                     style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 14,
//                         fontFamily: 'IBM'),
//                   ),
//                 ),
//                 const Expanded(child: Text("")),
//               ],
//             ),
//             Row(
//               children: [
//                 const Expanded(child: Text("")),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: AddAdDataContainer.ownerId == null
//                       ? const Text("")
//                       : TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "مسح الكل",
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.black87,
//                                 fontSize: 16,
//                                 fontFamily: 'IBM'),
//                           )),
//                 ),
//               ],
//             ),
//             NotificationOfStudentClassWidget(
//                 title: title,
//                 image: image,
//                 responseFromOwner: responseFromOwner,
//                 location: location,
//                 dateOfNotification: dateOfNotification)
//           ],
//         ),
//       ),
//     );
//   }
// }
