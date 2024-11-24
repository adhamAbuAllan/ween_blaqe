// import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

// import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/core/widgets/buttons/lines_buttons/switch_language_buttons.dart';
import 'package:ween_blaqe/testing_code/find_the_fastest_way_in_state_managment/riverpod/login_and_register_section/login_ui_test.dart';
// import 'package:ween_blaqe/session/new_session.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../constants/localization.dart';
import '../../constants/nums.dart';
import '../../constants/strings.dart';
import '../../controller/get_controllers.dart';
import '../../core/utils/funcations/get_app_version.dart';

// import '../../core/utils/funcations/snakbar.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';

import '../../controller/main_controller.dart';
import '../../controller/student_controller/student_controller.dart';

//Account before login Screen
@immutable
class AccountBeforeLoginInStudent extends StatefulWidget {
  const AccountBeforeLoginInStudent({super.key});

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
    super.initState();
    setState(() {
      currentValue = true;
      // loadValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //title
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20,
                          getIt<AppDimension>().isSmallScreen(context)
                              ? 50 / 1.6
                              : 50,
                          20,
                          0),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("my_account"),
                        style: TextStyle(
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          fontSize:
                          getIt<AppDimension>().isSmallScreen(context)
                              ? 22
                              : 26,
                          
                          fontWeight: FontWeight.w600,

                          inherit: true,
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
                  ],
                ),

                //subtitle of title
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20,
                      0,
                      20,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 75 / 1.5
                          : 75),
                  child: SizedBox(
                    width: getIt<AppDimension>().isMediumScreen(context)
                        ? 300
                        : 400,
                    child: Text(
                      // "قم بتسجيل الدخول لتحجز اول شقة لك ",
                      SetLocalization.of(context)!
                          .getTranslateValue("booking_no_account_required"),
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                          fontFamily: 'IBM'),
                      softWrap: true,
                    ),
                  ),
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
                //           
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isLight
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    // Switch(value:themeMode.isDark , onChanged:
                    // themeMode.onChanged),
                    SwitchListTile(
                        inactiveThumbColor: kBackgroundAppColorLightMode,
                        activeColor: themeMode.isLight
                            ? kPrimaryColorLightMode
                            : kPrimaryColorDarkMode,
                        dense: getIt<AppDimension>().isSmallScreen(context),
                        title: Row(
                          children: [
                            Icon(
                              themeMode.isLight
                                  ? Icons.light_mode_outlined
                                  : Icons.dark_mode_outlined,
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                              size: getIt<AppDimension>().isSmallScreen(context)
                                  ? 32 - 5
                                  : 32,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                                SetLocalization.of(context)!
                                    .getTranslateValue("appearance"),
                                style: TextStyle(
                                    fontSize: 16,
                                    
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                          ],
                        ),
                        value: themeMode.isLight,
                        onChanged: (bool value) async {
                          cityModelController.cityId.value = 0;
                          await myPushNameAnimation(context);

                          themeMode.onChanged(value);
                          // sp.get('isDark');
                          // myPushName(context, MyPagesRoutes.splashScreen);
                        }),
                    aline,
                    const SwitchLanguageButtons(),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: aline,
                    ),
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.askForHelp);
                    },
                        icon: Icons.info_outline,
                        SetLocalization.of(context)!
                            .getTranslateValue("request_help"),
                        context: context),

                    aline,
                    //privacy policy
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.privacyPolicy);
                    },
                        icon: Icons.privacy_tip_outlined,
                        SetLocalization.of(context)!
                            .getTranslateValue("privacy_policy"),
                        context: context),
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
                    /*
                        status
                        1:
                        -> check have wifi or Mobile ?
                        -> go and don't say any thing ,
                        2:
                        else :
                        go and say no Interent;
                         */
                    //send feedback for us
                    buttonAccount(() {
                      // if (connectivityController.isConnection()) {
                      // } else {
                      //   showSnakBar(context, "انت غير متصل بالانترنت");
                      // }
                      myPushName(context, MyPagesRoutes.sendNoticeForUs);
                    },
                        icon: Icons.feedback_outlined,
                        SetLocalization.of(context)!
                            .getTranslateValue("send_notify_for_us"),
                        context: context),
                    aline,
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.noInternet);
                    },
                        image: Image.asset("assets/images/tasbih.png",
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
                            width: 35,
                            height: getIt<AppDimension>().isSmallScreen(context)
                                ? 32 - 5
                                : 32),
                        SetLocalization.of(context)!.getTranslateValue("sebha"),
                        context: context),
                    aline,
                    buttonAccount(() {
                      apartmentModelController.fetchApartments(
                          isOwnerApartments: false);

                      myPushName(context, MyPagesRoutes.bookmarkApartment);
                    },
                        SetLocalization.of(context)!
                            .getTranslateValue("favorites"),
                        icon: Icons.bookmark_border,
                        context: context),
                    aline,
                    buttonAccount(
                      () {
                        String url =
                            "https://play.google.com/store/apps/details?id=com.weenbalaqee.weenbalaqee";

                        /// use this code if you upload your app to play store
                        // switch (Platform.operatingSystem) {
                        //   case 'ios':
                        //     url = "www.youtube.com";
                        //     break;
                        //   default:
                        //     // Use the original value for other platforms
                        //     break;
                        // }
                        Share.shareUri(
                          Uri.parse(url),
                        );
                      },
                      SetLocalization.of(context)!
                          .getTranslateValue("share_app"),
                      context: context,
                      icon: Icons.share_outlined,
                    ),
                  ]),
                ),
                // aline,
                //button login
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      25,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 60 / 1.8
                          : 60,
                      25,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 25 / 1.5
                          : 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 55 / 1.2
                        : 55,
                    child: ElevatedButton(
                        onPressed: () {
                          cityModelController.cityId.value = 0;
                          if (connectivityController.isConnection()) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const LoginUiTest();
                              },
                            ));
                            // myPushName(context, MyPagesRoutes.login);
                          } else {
                            myPushName(context, MyPagesRoutes.noInternet);
                          }

                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) {
                          //     return const Login();
                          //   }),
                          // );
                          // showSnakBar(context,
                          //     "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                        },
                        style: fullButton(),
                        child: Text(
                          SetLocalization.of(context)!
                              .getTranslateValue("login"),
                        )),
                  ),
                ),
                //ask user if don't have count and create account
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    //ask user if don't have account
                    Text(
                      SetLocalization.of(context)!
                          .getTranslateValue("dont_have_account"),
                      style: TextStyle(
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          fontFamily: "IBM"),
                    ),
                    //reg
                    TextButton(
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("create_account"),
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          
                        ),
                      ),
                      onPressed: () {
                        // showSnakBar(context, "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                        if (connectivityController.isConnection() // ||
                            // snapshot.data == null
                            ) {
                          // debugPrint("snapshot.data = ${snapshot.data}");
                          myPushName(context, MyPagesRoutes.register);
                        } else {
                          // debugPrint("snapshot.data = ${snapshot.data}");
                          myPushName(context, MyPagesRoutes.noInternet);
                        }

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) {
                        //     return      Register();
                        //   }),
                        // );
                      },
                    ),
                  ],
                ),
                //Beta Version
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: FutureBuilder<String>(
                      future: getAppVersion(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "${SetLocalization.of(context)!.getTranslateValue("beta_version")}: ${snapshot.data} ",
                            style: TextStyle(
                                
                                color: themeMode.isLight
                                    ? kTextColorLightMode.withOpacity(.5)
                                    : kTextColorDarkMode.withOpacity(.5)),
                            // textDirection: TextDirection.rtl,
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                              "${snapshot.error}${SetLocalization.of(context)!.getTranslateValue("error")}: ");
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )

                    // Builder(
                    //   builder: (context) {
                    //     return Text(
                    //       "الإصدار التجريبي: 3.0.1",
                    //       style: TextStyle(
                    //           color: themeMode.isDark
                    //               ? kTextColorLightMode.withOpacity(.5)
                    //               : kTextColorDarkMode.withOpacity(.5)),
                    //     );
                    //   }
                    // ),
                    )

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
                // Align(alignment: Alignment.bottomRight,child: Text("إصدار:2023.1",style: TextStyle(fontSize: 12,color: Colors.grey.withOpacity(.7)),))
              ],
            ),
          ),
        ));
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
//                         
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
//                       
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
//                       style: fullButton().copyWith(
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
//                         
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
