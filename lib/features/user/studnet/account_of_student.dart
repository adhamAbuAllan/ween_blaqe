// import 'dart:math';
//
// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/firebase_funcations/check_current_auth_state.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
// import 'package:ween_blaqe/core/utils/styles/switch_style.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
// import 'package:ween_blaqe/core/widgets/title_class_widget.dart';
// import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
//
// import '../../../controller/main_controller.dart';
// import '../../../main.dart';
//
// import '../../../sesstion/new_session.dart';
// import '../../../sesstion/sesstion_of_user.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
// import 'profile.dart';
//
// //account screen
//
// class AccountOfStudent extends StatefulWidget {
//   const AccountOfStudent({Key? key}) : super(key: key);
//
//   @override
//   State<AccountOfStudent> createState() => _AccountOfStudentState();
// }
//
// class _AccountOfStudentState extends State<AccountOfStudent> {
//   // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final intValue = Random().nextInt(10);
//   bool notificationState = true;
//
//   // Value is >= 0 and < 10.
//   @override
//   Widget build(BuildContext context) {
//     MainController controller = Get.find();
//
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: Column(
//           children: [
//             //title
//             accountTitle(),
//             const SizedBox(
//               height: 50,
//             ),
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) {
//                       return const Profile();
//                     }),
//                   );
//                 },
//                 child: showProfile(),
//               ),
//             ),
//             aline,
//             // notification icon and text and switch
//              switcherClassWidget(),
//             aline,
//             // help
//             buttonAccount(() {
//               myPushName(context, MyPagesRoutes.askForHelp);
//             },
//                 const Icon(
//                   Icons.info_outline,
//                   size: 32,
//                   color: Colors.black87,
//                 ),
//                 "اطلب المساعدة"),
//
//             aline,
//             //privacy policy
//             buttonAccount(() {
//               myPushName(context, MyPagesRoutes.privacyPolicy);
//             },
//                 const Icon(
//                   Icons.privacy_tip_outlined,
//                   size: 32,
//                   color: Colors.black87,
//                 ),
//                 "سياسة الخصوصية"),
//             aline,
//             //switch to student
//             buttonAccount(
//               () {
//                 controller.changeTo(1);
//                 myPushName(context, MyPagesRoutes.mainOwner);
//               },
//               const Icon(
//                 Icons.change_circle_outlined,
//                 size: 32,
//                 color: Colors.black87,
//               ),
//               "التبديل إلى مالك",
//             ),
//             // aline,
//             //share app
//             // ButtonAccount((){},
//             //     const Icon(Icons.share_outlined,
//             //       size: 32,
//             //       color: Colors.black87,) ,
//             //     "شارك التطبيق"),
//             aline,
//             //send feedback for us
//             buttonAccount(() {
//               myPushName(context, MyPagesRoutes.sendNoticeForUs);
//             },
//                 const Icon(
//                   Icons.feedback_outlined,
//                   size: 32,
//                   color: Colors.black87,
//                 ),
//                 "أرسل ملاحظات إلينا"),
//             aline,
//             //button sign out
//             Padding(
//               padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: OutlinedButton(
//                     onPressed: () async {
//                       removeUserInfo();
//                       checkCurrentAuthState(context);
//                       myPushAndRemoveUntilName(context, const Main(), "");
//                     },
//                     style: outlineButton,
//                     child: const Text("تسجيل الخروج")),
//               ),
//             ),
//             const Expanded(child: Text("")),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget accountTitle() {
//     return const TitleClassWidget(title: "الحساب");
//   }
//
//   Row showProfile() {
//     return Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           "https://robohash.org/hicveldicta.png"),
//                       radius: 30,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       // const Expanded(child: Text(""),flex: 1,),
//                       Text(
//                         NewSession.get("name", ""),
//                         style: const TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'IBM',
//                             color: Colors.black87),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         child: Text(
//                           textDirection: TextDirection.rtl,
//                           textAlign: TextAlign.right,
//                           "عرض الملف الشخصي",
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: 'IBM',
//                               color: Colors.grey),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Expanded(child: Text("")),
//                   // const Expanded(child: SizedBox(child: Text(""),),flex: 1,),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               );
//   }
//
//   Row switcherClassWidget() {
//     return Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
//                 child: Icon(
//                   Icons.notifications_outlined,
//                   size: 32,
//                 ),
//               ),
//               const Text(
//                 "الاشعارات",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'IBM',
//                 ),
//               ),
//               const Expanded(
//                   child: SizedBox(
//                 child: Text(""),
//               )),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Switcher(light1: notificationState,onChanged: (value){
//                   setState(() {
//                     notificationState = value;
//                     // value ==
//                     // false
//                     // ? toast("تم كتم الاشعارات")
//                     // : toast("تم تفعيل الاشعارات");
//                   });
//                 }),
//               )
//             ],
//           );
//   }
// }
