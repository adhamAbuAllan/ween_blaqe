// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/utils/function_that_effect_widgets/visable_invsable.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
// import 'package:ween_blaqe/sesstion/new_session.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
// //profile screen...
// //that could use input and modification about her info
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   void toggle2() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var visible = true;
//
//     var toggle = VisibilityInVisibility(toggle: () {
//       visible;
//     });
//     debugPrint("$visible");
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               //back arrow button
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black87,
//                         )),
//                   ),
//                   const Expanded(child: Text(""))
//                 ],
//               ),
//               //title
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                     child: Text(
//                       "الملف الشخصي",
//                       style: TextStyle(
//                         fontSize: 26.0,
//                         fontFamily: 'IBM',
//                         inherit: true,
//                       ),
//                     ),
//                   ),
//                   Expanded(child: Text(""))
//                 ],
//               ),
//               //image and name of user
//                Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 35, 10, 5),
//                 child: Row(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             'https://robohash.org/hicveldicta.png'),
//                         radius: 30,
//                       ),
//                     ),
//                     Text(
//                       NewSession.get("name", ""),
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'IBM',
//                           color: Colors.black87),
//                     ),
//                   ],
//                 ),
//               ),
//               //join history
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 35),
//                     child: Text(
//                       "انضم في ديسمبر 2023",
//                       style: TextStyle(
//                           fontSize: 12, fontFamily: 'IBM', color: Colors.grey),
//                     ),
//                   ),
//                   Expanded(child: Text(""))
//                 ],
//               ),
//               //about user
//               Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   ),
//                   //about user text
//                   const Text(
//                     "نبذة عني",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                   const Expanded(child: SizedBox()),
//                   //add TextButton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: TextButton(
//                       child: const Text(
//                         "إضافة",
//                         style: TextStyle(
//                           color: Colors.black,
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'IBM',
//                         ),
//                       ),
//                       onPressed: () {
//                         toggle;
//                         debugPrint("$toggle");
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               //input something about your self text
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
//                     child: Visibility(
//                       visible: !visible,
//                       child: const Text("أدخل شيئًا عن نفسك",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'IBM',
//                           )),
//                     ),
//                   ),
// // Padding(
// //                   padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
// //                   child: Visibility(
// //                     visible: visible,
// //                     child: TextFormField(
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         ),
// //                       decoration: InputDecoration(
// //                           border: InputBorder.none,
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(
// //                               width: 1,
// //                               color: kPrimaryColor,
// //                             ),
// //                           ),
// //                           enabledBorder: OutlineInputBorder(
// //                               borderSide: BorderSide(
// //                                 width: 0.5,
// //                                 color: kPrimaryColor300,
// //                               ),
// //                               borderRadius: BorderRadius.circular(7))
// //                       ),
// //
// //
// //                     ),
// //
// //                   ),
// //                 ),
//                 ],
//               ),
//               aline,
//               //location
//               Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   ),
//                   //about user text
//                   const Text(
//                     "الموقع",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                   const Expanded(child: SizedBox()),
//                   //add TextButton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: TextButton(
//                       child: const Text(
//                         "إضافة",
//                         style: TextStyle(
//                           color: Colors.black,
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'IBM',
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(builder: (context) {
//                         //     return const Register();
//                         //   }),
//                         // );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               //input your location
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(270, 0, 10, 10),
//                 child: Text("أدخل موقعك",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'IBM',
//                     )),
//               ),
//               aline,
//               // major
//               Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   ),
//                   //about user text
//                   const Text(
//                     "التعليم",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                   const Expanded(child: SizedBox()),
//                   //add TextButton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: TextButton(
//                       child: const Text(
//                         "إضافة",
//                         style: TextStyle(
//                           color: Colors.black,
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'IBM',
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(builder: (context) {
//                         //     return const Register();
//                         //   }),
//                         // );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               //input your major
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(260, 0, 10, 10),
//                 child: Text("أدخل تخصصك",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'IBM',
//                     )),
//               ),
//               aline,
//               //university
//               Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   ),
//                   //about user text
//                   const Text(
//                     "الجامعة",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                   const Expanded(child: SizedBox()),
//                   //add TextButton
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: TextButton(
//                       child: const Text(
//                         "تعديل",
//                         style: TextStyle(
//                           color: Colors.black,
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'IBM',
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(builder: (context) {
//                         //     return const Register();
//                         //   }),
//                         // );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               //input your university
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(190, 0, 10, 10),
//                 child: Text("جامعة بولتكنك فلسطين",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'IBM',
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
