// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
//
// import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/advatnages_check_box/add_advantages_container_class_widget.dart';
// import '../../../../data_containers/add_ad_data_container.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import '../../../../constants/nums.dart';
// main (){
//   runApp(MaterialApp(home:SecondStep()));
// }
// class SecondStep extends StatefulWidget {
//   const SecondStep({Key? key}) : super(key: key);
//
//   @override
//   State<SecondStep> createState() => _SecondStepState();
// }
//
// class _SecondStepState extends State<SecondStep> {
//   @override
//   void initState() {
//     super.initState();
//     // print("city_id --${AddAdDataContainer.cityId} -- in second_step page");
//
// // print(AddAdDataContainer.address);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // var desktopAdvText = "مكتب";
//     // var desktopAdvIcon =
//     "assets/images/apartments_images/advantages/desktop.png";
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           backgroundColor: Colors.grey.shade200,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       OutlinedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         style: outlineButton,
//                         child: const Text("رجوع"),
//                       ),
//                       const Expanded(child: Text("")),
//                       ElevatedButton(
//                         onPressed: () {
//                           debugPrint("${AddAdDataContainer.address}");
//                           // print(AddAdDataContainer.currentCity?.name);
//                           debugPrint("${AddAdDataContainer.rooms}");
//                           debugPrint("${AddAdDataContainer.bathRooms}");
//
//                           myPushName(context, MyPagesRoutes.step3);
//                         },
//                         style: fullButton,
//                         child: const Text("التالي"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //text steps
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   child: Text(
//                     "الخطوة الثانية",
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontSize: 20,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                 ),
//                 //image steps
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
//                   child: Image.asset(
//                     'assets/'
//                     'images/'
//                     'apartments_images/'
//                     'images_to_create_apartment/'
//                     'step_two.png',
//                     width: 65,
//                     height: 65,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 //this container have 2 main items own: text of advantages , and advantages
//                 Container(
//                   // height: 100,
//                   margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                   padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(7),
//                     color: kContainerColor,
//                   ),
//                   child: Column(
//                     children: [
//                       //this row for text
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
//                             child: Text(
//                               "حدد المزايا",
//                               style: TextStyle(
//                                   fontFamily: 'IBM',
//                                   fontSize: 20,
//                                   color: Colors.grey.shade800),
//                             ),
//                           ),
//                           const Expanded(child: Text("")),
//                         ],
//                       ),
//                       //here could owner add advantages
//                       const AddAdvantages()
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
