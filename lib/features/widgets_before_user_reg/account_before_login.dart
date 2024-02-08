// import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import '../../constants/nums.dart';
import '../../constants/strings.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';

import '../../controller/main_controller.dart';
import '../../controller/student_controller/student_controller.dart';
// import '../../main.dart';
// import 'login.dart';
main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    darkTheme: ThemeData(

      useMaterial3: false,


      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),


      // brightness: Brightness.darkf
    ),

    // themeMode: ThemeMode.system,

    theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'IBM',

        // brightness: Brightness.,

        // scaffoldBackgroundColor: Colors.grey.shade200,
        switchTheme:      const SwitchThemeData(),
        colorSchemeSeed:      const Color(0xffff9800),
        bottomNavigationBarTheme:      const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(size: 26))),
    //make screen rtl
    localizationsDelegates:      [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales:      [
      const Locale("en", "US"),
      const Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale:      const Locale("ar", "SA"),

    home:      AccountBeforeLoginInStudent(),));
}
//Account before login Screen

class AccountBeforeLoginInStudent extends StatefulWidget {
       AccountBeforeLoginInStudent({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLoginInStudent> createState() =>
      _AccountBeforeLoginInStudentState();
}

bool notificationState = true;
bool isCodeActive = false;
late bool currentValue;

MainController controller = Get.find();
// OwnerController ownerController = Get.find();
StudentController studentController = Get.find();

class _AccountBeforeLoginInStudentState
    extends State<AccountBeforeLoginInStudent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentValue = true;
      // loadValue();
    });

  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor:themeMode.isDark ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,
        body: SingleChildScrollView(
          child: Column(            children: [
              //title
                    Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                    child: Text(
                      "الحساب",
                      style: TextStyle(
                        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                        fontSize: 28.0,
                        fontFamily: 'IBM',
                        inherit: true,
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),

              //subtitle of title
              Row(
                children: [
                  Padding(
                    padding:      const EdgeInsets.fromLTRB(0, 0, 10, 75),
                    child: Text(
                      // "قم بتسجيل الدخول لتحجز اول شقة لك ",
                      "لا يتطلب حجز شقة حساب جديد أو تسجيل الدخول ",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontFamily: 'IBM'),
                    ),
                  ),
                       const Expanded(child: Text("")),
                ],
              ),
              // aline,

              // notification icon and text and switch

              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       notificationState = !currentValue;
              //     });
              //     currentValue = notificationState;
              //   },
              //   child: Row(
              //     children: [
              //            Padding(
              //         padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              //         child: Icon(
              //           Icons.notifications_outlined,
              //           size: 32,
              //         ),
              //       ),
              //            Text(
              //         "الاشعارات",
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontFamily: 'IBM',
              //         ),
              //       ),
              //            Spacer(),
              //       Padding(
              //         padding:      EdgeInsets.fromLTRB(20, 0, 0, 0),
              //         child: Switcher(
              //             light1: notificationState,
              //             onChanged: (currentValue) {
              //               setState(() {
              //                 // currentValue = value;
              //                 notificationState = currentValue;
              //                 // value ==
              //                 // false
              //                 // ? toast("تم كتم الاشعارات")
              //                 // : toast("تم تفعيل الاشعارات");
              //               });
              //             }),
              //       )
              //     ],
              //   ),
              // ),
              // aline,
              //help
              Container(
                padding:      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                margin:      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color:themeMode.isDark ? kContainerColorLightMode : kContainerColorDarkMode,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                        // Switch(value:themeMode.isDark , onChanged:
                        // themeMode.onChanged),
                      SwitchListTile(

                          title:Text("الشكل", style:TextStyle(
                              fontSize: 16, fontFamily: 'IBM', color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode)),
                          value: themeMode.isDark, onChanged: (bool value)async{

                        setState(() {
                          themeMode.onChanged(value);
                          // sp.get('isDark');
                          // myPushName(context, MyPagesRoutes.splashScreen);


                          myPushNameAnimation(context);
                        });
                      }),
                  aline,
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.askForHelp);
                  },
                            Icon(
                        Icons.info_outline,
                        size: 32,
                        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                      ),
                      "اطلب المساعدة"),

                  aline,
                  //privacy policy
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.privacyPolicy);
                  },
                            Icon(
                        Icons.privacy_tip_outlined,
                        size: 32,
                        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                      ),
                      "سياسة الخصوصية"),
                  // aline,
                  //switch to owner
              //               buttonAccount(
              //                 () {
              // // myPushReplacementNamed(context,MyPagesRoutes.mainOwner);
              //                   myPushName(context, MyPagesRoutes.mainOwner);
              //                   setState(() {
              //                     ownerController.changeTo(0);
              //                     controller.changeTo(1);
              //
              //                     myPushName(context, MyPagesRoutes.mainOwner);
              //                   });
              //                   // showSnakBar(
              //                   //     context, "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
              //                 },
              //                      Icon(
              //                   Icons.change_circle_outlined,
              //                   size: 32,
              //                   color: kTextColor,
              //                 ),
              //                 "التبديل إلى مالك",
              //               ),
                  // aline,

                  //share app
                  // ButtonAccount(
                  //     () {},
                  //          Icon(
                  //       Icons.share_outlined,
                  //       size: 32,
                  //       color: kTextColor,
                  //     ),
                  //     "شارك التطبيق"),
                  aline,
                  //send feedback for us
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.sendNoticeForUs);
                  },
                            Icon(
                        Icons.feedback_outlined,
                        size: 32,
                        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                      ),
                      "أرسل ملاحظات إلينا"),


                ]),
                            ),
              // aline,
              //button login
              Padding(
                padding:      const EdgeInsets.fromLTRB(25, 75, 25, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) {
                        //     return      Login();
                        //   }),
                        // );
                        showSnakBar(context,
                            "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                      },
                      style: fullButton.copyWith(
                          backgroundColor:
                               const MaterialStatePropertyAll(Colors.grey)),
                      child:      const Text("تسجيل الدخول")),
                ),
              ),
              //ask user if don't have count and create account
              Row(
                children: [
                  //ask user if don't have account
                        Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "ألا تمتلك حساب؟",
                      style: TextStyle(
                        color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                      ),
                    ),
                  ),
                  //reg
                  TextButton(
                    child: Text(
                      "إنشاء حساب",
                      style: TextStyle(
                        color: isCodeActive ? Colors.black : Colors.grey,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),
                    ),
                    onPressed: () {
                      showSnakBar(context,
                          "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return      Register();
                      //   }),
                      // );
                    },
                  ),
                ],
              ),

              // Padding(
              //   padding:      EdgeInsets.only(top: 20*9.5,bottom: 30*2),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         IconButton(
              //         onPressed: (){},
              //           icon: Icon(FontAwesomeIcons.facebookMessenger,color: Colors.black.withOpacity(.65),size: 30)),
              //         IconButton(
              //         onPressed: (){},
              //           icon: Icon(FontAwesomeIcons.whatsapp,color: Colors.black.withOpacity(.65),size: 30,)),
              //         IconButton(
              //         onPressed: (){},
              //           icon: Icon(FontAwesomeIcons.facebook,color: Colors.black.withOpacity(.65),size: 30)),
              //         IconButton(
              //         onPressed: (){},
              //           icon: Icon(FontAwesomeIcons.tiktok,color: Colors.black.withOpacity(.65),size: 30)),
              //
              //       ]),
              //   // child: Divider(color: Colors.black.withOpacity(.6),thickness: 7,indent: 10,endIndent: 10),
              // ),
              //      SizedBox(height: 150,),
               // Align(alignment: Alignment.bottomRight,child: Text("إصدار:2023.1",style: TextStyle(fontFamily: "IBM",fontSize: 12,color: Colors.grey.withOpacity(.7)),))


            ],
          ),
        ),
      ),
    );
  }

}
//
// //account before login in owner page widget
// class AccountBeforeLoginInOwner extends StatefulWidget {
//        AccountBeforeLoginInOwner({Key? key}) : super(key: key);
//
//   @override
//   State<AccountBeforeLoginInOwner> createState() =>
//       _AccountBeforeLoginInOwnerState();
// }
//
// class _AccountBeforeLoginInOwnerState extends State<AccountBeforeLoginInOwner> {
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
//       bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               //title
//                    Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                     child: Text(
//                       "الحساب",
//                       style: TextStyle(
//                         fontSize: 28.0,
//                         fontFamily: 'IBM',
//                         inherit: true,
//                       ),
//                     ),
//                   ),
//                   Expanded(child: Text("")),
//                 ],
//               ),
//
//               //subtitle of title
//               Row(
//                 children: [
//                   Padding(
//                     padding:      EdgeInsets.fromLTRB(0, 0, 10, 55),
//                     child: Text(
//                       "قم تسجيل الدخول لإعلان اول شقة لك ",
//                       style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontSize: 14,
//                           fontFamily: 'IBM'),
//                     ),
//                   ),
//                        Expanded(child: Text("")),
//                 ],
//               ),
//               aline,
//
//               //notification icon and text and switch
//               Row(
//                 children: [
//                        Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                     child: Icon(
//                       Icons.notifications_outlined,
//                       size: 32,
//                     ),
//                   ),
//                        Expanded(child: SizedBox()),
//                        Text(
//                     "الاشعارات",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'IBM',
//                     ),
//                   ),
//                   Padding(
//                     padding:      EdgeInsets.fromLTRB(20, 0, 0, 0),
//                     child: Switcher(
//                         light1: notificationState,
//                         onChanged: (value) {
//                           setState(() {
//                             notificationState = value;
//                             // value ==
//                             // false
//                             // ? toast("تم كتم الاشعارات")
//                             // : toast("تم تفعيل الاشعارات");
//                           });
//                         }),
//                   )
//                 ],
//               ),
//               aline,
//               //help
//               buttonAccount(() {
//                 myPushName(context, MyPagesRoutes.askForHelp);
//               },
//                        Icon(
//                     Icons.info_outline,
//                     size: 32,
//                     color: kTextColor,
//                   ),
//                   "اطلب المساعدة"),
//
//               aline,
//               //privacy policy
//               buttonAccount(() {
//                 myPushName(context, MyPagesRoutes.privacyPolicy);
//               },
//                        Icon(
//                     Icons.privacy_tip_outlined,
//                     size: 32,
//                     color: kTextColor,
//                   ),
//                   "سياسة الخصوصية"),
//               aline,
//               //switch to student
//               buttonAccount(
//                 () {
//                   setState(() {
//                     studentController.changeTo(0);
//                     controller.changeTo(0);
//                     myPushName(context, MyPagesRoutes.mainStudent);
//                   });
//                 },
//                      Icon(
//                   Icons.change_circle_outlined,
//                   size: 32,
//                   color: kTextColor,
//                 ),
//                 "التبديل إلى طالب",
//               ),
//               // aline,
//
//               //share app
//               // ButtonAccount(
//               //         () {},
//               //          Icon(
//               //       Icons.share_outlined,
//               //       size: 32,
//               //       color: kTextColor,
//               //     ),
//               //     "شارك التطبيق"),
//               aline,
//               //send feedback for us
//               buttonAccount(() {
//                 myPushName(context, MyPagesRoutes.sendNoticeForUs);
//               },
//                        Icon(
//                     Icons.feedback_outlined,
//                     size: 32,
//                     color: kTextColor,
//                   ),
//                   "أرسل ملاحظات إلينا"),
//               aline,
//               //button login
//               Padding(
//                 padding:      EdgeInsets.fromLTRB(25, 25, 25, 25),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(builder: (context) {
//                         //     return      Login();
//                         //   }),
//                         // );
//                       },
//                       style: fullButton.copyWith(
//                           backgroundColor:
//                                    MaterialStatePropertyAll(Colors.grey)),
//                       child:      Text("تسجيل الدخول")),
//                 ),
//               ),
//               //ask user if don't have count and create account
//               Row(
//                 children: [
//                   //ask user if don't have account
//                        Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                     child: Text(
//                       "ألا تمتلك حساب؟",
//                       style: TextStyle(
//                         color: kTextColor,
//                         fontFamily: "IBM"
//                       ),
//                     ),
//                   ),
//                   //reg
//                   TextButton(
//                     child:      Text(
//                       "إنشاء حساب",
//                       style: TextStyle(
//                         color: Colors.black,
//                         decoration: TextDecoration.underline,
//                         fontFamily: 'IBM',
//                       ),
//                     ),
//                     onPressed: () {
//                       // Navigator.of(context).push(
//                       //   MaterialPageRoute(builder: (context) {
//                       //     return      Register();
//                       //   }),
//                       // );
//                     },
//                   ),
//                 ],
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// extension MakeSwitch on bool {}
