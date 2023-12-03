// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/firebase_funcations/check_current_auth_state.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
// import 'package:ween_blaqe/core/utils/styles/switch_style.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
// import '../../../controller/main_controller.dart';
// import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
// import 'profile_of_owner.dart';
// import '../../../sesstion/new_session.dart';
// import '../../../sesstion/sesstion_of_user.dart';
//
// import 'main_owner.dart';
//
// //account screen
// class AccountOfOwner extends StatefulWidget {
//   const AccountOfOwner({Key? key}) : super(key: key);
//
//   @override
//   State<AccountOfOwner> createState() => _AccountOfOwnerState();
// }
//
// class _AccountOfOwnerState extends State<AccountOfOwner> {
//   bool notificationState = true;
//
//   // static const String rountName = "/accountOfOwner";
//   @override
//   Widget build(BuildContext context) {
//     MainController controller = Get.find();
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //title
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                   child: Text(
//                     "الحساب",
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
//             const SizedBox(
//               height: 50,
//             ),
//
//             //use GestureDetector that when user click on container make action
//
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) {
//                       return const ProfileOfOwner();
//                     }),
//                   );
//                 },
//                 child: Row(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             "https://robohash.org/hicveldicta.png/"),
//                         radius: 30,
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           NewSession.get("name", ""),
//                           style: const TextStyle(
//                               fontSize: 16,
//                               fontFamily: 'IBM',
//                               color: Colors.black87),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                           child: Text(
//                             "عرض الملف الشخصي",
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontFamily: 'IBM',
//                                 color: Colors.grey),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Expanded(
//                         child: SizedBox(
//                       child: Text(""),
//                     )),
//                     const Padding(
//                       padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                       child: Icon(
//                         Icons.arrow_forward_ios_rounded,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             aline,
//             //notification icon and text and switch
//              Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Icon(
//                       Icons.notifications_outlined,
//                       size: 32,
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   "الاشعارات",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'IBM',
//                   ),
//                 ),
//                 const Expanded(child: SizedBox()),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                   child: Switcher(light1: notificationState,onChanged: (value){
//                     setState(() {
//                       notificationState = value;
//                       // value ==
//                       // false
//                       // ? toast("تم كتم الاشعارات")
//                       // : toast("تم تفعيل الاشعارات");
//                     });
//                   }),
//                 )
//               ],
//             ),
//             aline,
//
//             //help
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
//                 controller.changeTo(0);
//
//                 myPushName(context, MyPagesRoutes.main);
//               },
//               const Icon(
//                 Icons.change_circle_outlined,
//                 size: 32,
//                 color: Colors.black87,
//               ),
//               "التبديل إلى طالب",
//             ),
//             // aline,
//             //share app
//             // ButtonAccount((){
//             //
//             // },
//             //     Icon(Icons.share_outlined,
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
//                     onPressed: () {
//                       removeUserInfo();
//                       checkCurrentAuthState(context);
//                       // myPushAndRemoveUntilName(context, const MainOwner(), "");
//                     },
//                     style: outlineButton,
//                     child: const Text("تسجيل الخروج")),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
