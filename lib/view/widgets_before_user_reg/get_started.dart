// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
//
//
// class GetStarted extends StatefulWidget {
//   const GetStarted({Key? key}) : super(key: key);
//
//   @override
//   State<GetStarted> createState() => _GetStartedState();
// }
//
// class _GetStartedState extends State<GetStarted> {
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: Column(
//           children: [
//             //title-nameApp
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 50, 195, 5),
//               child: Text(
//                 "وين بلاقي",
//                 style: TextStyle(
//                     fontSize: 28,
//                     inherit: true,
//                     
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             //title
//             const Padding(
//               padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
//               child: Text(
//                 "شقق للطلاب",
//                 style: TextStyle(
//                     fontSize: 28.0,
//                     inherit: true,
//                     
//                     color: kPrimaryColor),
//               ),
//             ),
//             //follow title
//             const Padding(
//               padding: EdgeInsets.fromLTRB(180, 0, 0, 0),
//               child: Text(
//                 " والطالبات",
//                 style: TextStyle(
//                     fontSize: 28.0,
//                     inherit: true,
//                     
//                     color: kPrimaryColor),
//               ),
//             ),
//             //past-nameApp
//             const Padding(
//               padding: EdgeInsets.fromLTRB(130, 0, 0, 0),
//               child: Text(
//                 "...بتلاقي",
//                 style: TextStyle(
//                     fontSize: 28.0,
//                     inherit: true,
//                     
//                     color: Colors.blue),
//               ),
//             ),
// //image of apartment
//             Padding(
//               padding: const EdgeInsets.fromLTRB(25, 50, 25, 55),
//               child: Image.asset('assets/images/apartment_get_started.png'),
//             ),
//             //button get started
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
//               child: SizedBox(
//                 width: 350,
//                 height: 55,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       myPushReplacementNamed( MyPagesRoutes.main,context: context);
//                     },
//                     style: fullButton(),
//                     child: const Text("لنبدأ")),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
