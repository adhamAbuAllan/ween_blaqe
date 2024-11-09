import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:upgrader/upgrader.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/features/user/owner/account_of_owner.dart';
import '../../../constants/localization.dart';
import '../../../controller/student_controller/student_controller.dart';
import '../../../core/widgets/alirt_class_widget.dart';
import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../sesstion/new_session.dart';

// import '../../../testing_code/upgrader_package_test.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import 'from_master_home_to_show_more/new_master_home.dart';

// import 'master_home.dart';
import 'orders_of_student.dart';

class MainStudent extends StatefulWidget {
  const MainStudent({
    super.key,
  });

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  bool isTest = true;

  @override
  void initState() {
    super.initState();
    NewSession.save('isFirstTime', "OK");
    debugPrint(
        "the first time value in main Student : --${introController.isFirstTime}");

    // checkWifiStatus();
    WidgetsBinding.instance.addPostFrameCallback((_ ) {
      setState(() {
        cityModelController.getCity();
// Your state update logic here
      });
    });
  }

  var studentController = StudentController();
  int index = 0;
  String apartmentIdLocal = "";

  StudentController controller = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Obx(() {
        connectivityController.connectivity.value;
        return Scaffold(

            // appBar: AppBar(bottomOpacity: 0,leadingWidth: 20,toolbarOpacity: 0,backgroundColor: Colors.transparent,elevation: 0,shadowColor: Colors.transparent,title: Text("Your wlecome "),),
            backgroundColor: themeMode.isLight
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,
            body: GetBuilder<StudentController>(
              builder: (context) {
                return ColorfulSafeArea(
                  bottomColor: Colors.transparent,
                  color: themeMode.isLight
                      ? kPrimaryColorLightMode
                      : kPrimaryColorDarkMode,
                  child: IndexedStack(
                    index: studentController.index,
                    children: [
                      // const MasterHome(),

                      NewMasterHome(
                        scrollController: scrollController,
                      ),

                      // const NewMasterHomeTest(),
                      // NotificationOfStudentWithNotifi(),
                      const OrdersOfStudent(),
                      // const Bookmark(),
                      NewSession.get("logged", "") == ""
                          ? const AccountBeforeLoginInStudent()
                          : const AccountOfOwner()
                      // AccountOfStudent(),
                    ],
                  ),
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBarOfStudent(
              controller: studentController,
              scrollController: scrollController,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton:
                // isTest
                //     ? FloatingActionButton(
                //         onPressed: () {
                //
                //           myPushName(context, MyPagesRoutes.step1 );
                //         },
                //   foregroundColor: kPrimaryColorLightMode,
                //         child: const Icon(
                //           Icons.add_home_outlined,
                //           color: kContainerColorLightMode,
                //         ),
                //       )
                //     : FloatingActionButton(
                //         // shape: ContinuousRectangleBorder(
                //         //
                //         //     borderRadius: BorderRadius.circular(16 / 2)),
                //         onPressed: () {
                //           showCupertinoModalPopup(
                //               context: context,
                //               builder: (
                //                 context,
                //               ) {
                //                 return CupertinoActionSheet(
                //                   /*
                //             RichText(
                //                             softWrap: true,
                //
                //                             // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                //                             text: TextSpan(
                //             children: <TextSpan>[
                //           const TextSpan(
                //               text: "نصيحة:",
                //               style: TextStyle(
                //                 fontSize: 18.0,
                //                 color: Colors.orange,
                //                 
                //                 inherit: true,
                //               )),
                //                             ]),
                //                           )
                //              */
                //                   title: Text(
                //                     "إنشاء إعلان",
                //                     style: TextStyle(
                //                       color: Colors.grey[600],
                //                       fontSize: 24,
                //                       
                //                     ),
                //                   ),
                //
                //                   message: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.center,
                //                     mainAxisSize: MainAxisSize.min,
                //                     children: [
                //                       RichText(
                //                         textAlign: TextAlign.center,
                //                         softWrap: true,
                //                         text: TextSpan(
                //                           children: <TextSpan>[
                //                             TextSpan(
                //                                 text:
                //                                     "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
                //                                 style: TextStyle(
                //                                   color: Colors.grey[600],
                //                                   fontSize: 24,
                //                                   
                //                                 )),
                //                           ],
                //                         ),
                //                       ),
                //                       Divider(color: Colors.black.withOpacity(.3)),
                //                       SizedBox(
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           mainAxisSize: MainAxisSize.min,
                //                           children: [
                //                             RichText(
                //                                 text: TextSpan(children: [
                //                               TextSpan(
                //                                   style: TextStyle(
                //                                     
                //                                     fontSize: 18,
                //                                     color: Colors.grey[600],
                //                                   ),
                //                                   text: "التكلفة الشهرية: "),
                //                               TextSpan(
                //                                   style: TextStyle(
                //                                     
                //                                     color: Colors.grey[600],
                //                                     fontSize: 18,
                //                                   ),
                //                                   text: "199"),
                //                             ])),
                //                             const SizedBox(
                //                               width: 3,
                //                             ),
                //                             FaIcon(FontAwesomeIcons.shekelSign,
                //                                 size: 14, color: Colors.grey[600]),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           mainAxisSize: MainAxisSize.min,
                //                           children: [
                //                             const SizedBox(
                //                               width: 20,
                //                             ),
                //                             SizedBox(
                //                               height: 50,
                //                               width: 120,
                //                               child: RichText(
                //                                   softWrap: true,
                //                                   text: TextSpan(
                //                                     children: [
                //                                       TextSpan(
                //                                           style: TextStyle(
                //                                             
                //                                             fontSize: 18,
                //                                             color: Colors.grey[600],
                //                                           ),
                //                                           text: "التكلفة السنوية:"),
                //                                     ],
                //                                   )),
                //                             ),
                //                             SizedBox(
                //                               child: Column(
                //                                 children: [
                //                                   SizedBox(
                //                                     child: Row(
                //                                       children: [
                //                                         SizedBox(
                //                                           child: RichText(
                //                                               softWrap: true,
                //                                               text: const TextSpan(
                //                                                   children: [
                //                                                     TextSpan(
                //                                                       style:
                //                                                           TextStyle(
                //                                                         fontFamily:
                //                                                             "IBM",
                //                                                         color: Colors
                //                                                             .grey,
                //                                                         decoration:
                //                                                             TextDecoration
                //                                                                 .lineThrough,
                //                                                         decorationColor:
                //                                                             Colors
                //                                                                 .red,
                //                                                         fontSize: 20,
                //                                                       ),
                //                                                       text: "2388",
                //                                                     )
                //                                                   ])),
                //                                         ),
                //                                         const SizedBox(
                //                                           width: 3,
                //                                         ),
                //                                         FaIcon(
                //                                           size: 16,
                //                                           FontAwesomeIcons.shekelSign,
                //                                           color: Colors.grey[600],
                //                                         ),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                   SizedBox(
                //                                     child: Row(
                //                                       children: [
                //                                         SizedBox(
                //                                           child: RichText(
                //                                               text:
                //                                                   TextSpan(children: [
                //                                             TextSpan(
                //                                                 style: TextStyle(
                //                                                   
                //                                                   color: Colors
                //                                                       .grey[600],
                //                                                   fontSize: 14,
                //                                                 ),
                //                                                 text: "1999")
                //                                           ])),
                //                                         ),
                //                                         const SizedBox(
                //                                           width: 3,
                //                                         ),
                //                                         FaIcon(
                //                                             FontAwesomeIcons
                //                                                 .shekelSign,
                //                                             size: 12,
                //                                             color: Colors.grey[600]),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   // const Text(
                //                   //     "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
                //                   //     softWrap: true,
                //                   //
                //                   //     style: TextStyle(fontSize: 20, fontFamily: "IBM")),
                //
                //                   actions: [
                //                     CupertinoActionSheetAction(
                //                         onPressed: () {
                //                           sendMessageToWhatsApp(
                //                               '2569339613', "السلام عليكم،");
                //                         },
                //                         child: const Text(
                //                           "طلب الإشتراك عبر واتس أب",
                //                           style: TextStyle(
                //                             
                //                           ),
                //                         )),
                //                     CupertinoActionSheetAction(
                //                         onPressed: () {
                //                           myPushName(context,
                //                               MyPagesRoutes.theAdIsFreeOrNot);
                //                         },
                //                         child: const Text(
                //                           "عرض تفاصيل الإشتراك",
                //                           style: TextStyle(
                //                             
                //                           ),
                //                         )),
                //                   ],
                //                   cancelButton: CupertinoActionSheetAction(
                //                     child: const Text('إلغاء',
                //                         style: TextStyle(
                //                           
                //                         )),
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                 );
                //               });
                //         },
                //         backgroundColor: themeMode.isDark
                //             ? kPrimaryColorLightMode
                //             : kPrimaryColorDarkMode,
                //         child: const Icon(
                //           Icons.add_home_outlined,
                //           size: 30, // shadows: [
                //           //   BoxShadow(
                //           //       color: const Color(0xffD56300).withOpacity(.26),
                //           //       blurRadius: 5,
                //           //       offset: const Offset(3, 5),
                //           //       spreadRadius: 7)
                //           // ],
                //         ),
                //       )
                // buildSpeedDial()
            FloatingActionButton(

              tooltip: SetLocalization
                  .of(context)!.getTranslateValue("add_ad"),
              backgroundColor: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                if (connectivityController.isConnection()) {
                  NewSession.get("logged", "") == ""
                      ? alert(
                      SetLocalization.of(context)!
                          .getTranslateValue("login_to_create_ad"),
                          SetLocalization.of(context)!.getTranslateValue(
                            "login_to_add_apartment"
                          ),
                          SetLocalization.of(context)!.getTranslateValue("ok"))
                      : myPushName(context, MyPagesRoutes.step1);
                } else {
                  showSnakBar(context, SetLocalization.of(context)!.getTranslateValue("no_internet"));

                  return;
                }
              },
              child: const Icon(
                Icons.add_home_outlined,
                color: Colors.white,
              ),
            ),
        );

      }),
    );
  }

  void alert(String title, String message, String textOfButton) {
    NormalAlert.show(context, title, message, textOfButton);
  }

  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint('Wi-Fi is connected');
    } else {
      pushToNoInternetPage();
    }
  }

  void pushToNoInternetPage() {
    myPushName(context, MyPagesRoutes.noInternet);
  }
}

// SpeedDial buildSpeedDial() {
//   return SpeedDial(
//     curve: Curves.linear,
//
//     spacing: 25,
//     // activeBackgroundColor: Colors.orange[400],
//     overlayColor: Colors.grey,
//     // animatedIcon: AnimatedIcons.home_menu,
//     icon: Icons.add_home_outlined,
//     backgroundColor: kPrimaryColor,
//     renderOverlay: true,
//     closeManually: false,
//     switchLabelPosition: true,
//
//     children: [
//       SpeedDialChild(
//         child: const Icon(
//           FontAwesomeIcons.whatsapp,
//           color: Colors.white,
//         ),
//         //25D366
//         backgroundColor: const Color(0xff25D366),
//         // label: 'whatsApp',
//         onTap: () {
//           sendMessageToWhatsApp('2569339613', "هل يمكنني الاستفسار عن هذا؟");
//         },
//       ),
//       // SpeedDialChild(
//       //   child: Image.asset(m),
//       //   label: 'messenger',
//       //   onTap: () => print('Edit'),
//       // ),
//     ],
//   );
// }
