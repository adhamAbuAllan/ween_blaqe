import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../controller/student_controller/student_controller.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import 'from_master_home_to_show_more/new_master_home.dart';
import 'orders_of_student.dart';

class MainStudent extends StatefulWidget {
  const MainStudent({
    Key? key,
  }) : super(key: key);

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  @override
  void initState() {
    super.initState();
    // checkWifiStatus();
  }

  var studentController = StudentController();
  int index = 0;

  StudentController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(

          // appBar: AppBar(bottomOpacity: 0,leadingWidth: 20,toolbarOpacity: 0,backgroundColor: Colors.transparent,elevation: 0,shadowColor: Colors.transparent,title: Text("Your wlecome "),),
          backgroundColor: Colors.grey.shade200,
          body: GetBuilder<StudentController>(
            builder: (context) {
              return ColorfulSafeArea(
                bottomColor: Colors.transparent,
                color: kPrimaryColor,
                child: IndexedStack(
                  index: studentController.index,
                  children: const [
                    // MasterHome(),

                    NewMasterHome(),
                    // const NewMasterHomeTest(),
                    // NotificationOfStudentWithNotifi(),
                    OrdersOfStudent(),
                    // const Bookmark(),
                    // NewSession.get("logged", "") == ""
                    //     ?
                    AccountBeforeLoginInStudent()
                    // : AccountOfStudent(),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBarOfStudent(
            controller: studentController,
          ),
// floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: FloatingActionButton(

            // shape: ContinuousRectangleBorder(
            //
            //     borderRadius: BorderRadius.circular(16 / 2)),
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (
                    context,
                  ) {
                    return CupertinoActionSheet(
                      /*
                      RichText(
                  softWrap: true,

                  // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                  text: TextSpan(
                      children: <TextSpan>[
                    const TextSpan(
                        text: "نصيحة:",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange,
                          fontFamily: 'IBM',
                          inherit: true,
                        )),
                  ]),
                )
                       */
                      title: Text(
                        "إنشاء إعلان",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 24,
                          fontFamily: "IBM",
                        ),
                      ),

                      message: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 24,
                                      fontFamily: "IBM",
                                    )),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black.withOpacity(.3)),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: "IBM",
                                        fontSize: 18,
                                        color: Colors.grey[600],
                                      ),
                                      text: "التكلفة الشهرية: "),
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: "IBM",
                                        color: Colors.grey[600],
                                        fontSize: 18,
                                      ),
                                      text: "199"),
                                ])),
                                const SizedBox(
                                  width: 3,
                                ),
                                FaIcon(FontAwesomeIcons.shekelSign,
                                    size: 14, color: Colors.grey[600]),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 120,
                                  child: RichText(
                                      softWrap: true,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              style: TextStyle(
                                                fontFamily: "IBM",
                                                fontSize: 18,
                                                color: Colors.grey[600],
                                              ),
                                              text: "التكلفة السنوية:"),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              child: RichText(
                                                  softWrap: true,
                                                  text:
                                                      const TextSpan(children: [
                                                    TextSpan(
                                                      style: TextStyle(
                                                        fontFamily: "IBM",
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationColor:
                                                            Colors.red,
                                                        fontSize: 20,
                                                      ),
                                                      text: "2388",
                                                    )
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            FaIcon(
                                              size: 16,
                                              FontAwesomeIcons.shekelSign,
                                              color: Colors.grey[600],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    style: TextStyle(
                                                      fontFamily: "IBM",
                                                      color: Colors.grey[600],
                                                      fontSize: 14,
                                                    ),
                                                    text: "1999")
                                              ])),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            FaIcon(FontAwesomeIcons.shekelSign,
                                                size: 12,
                                                color: Colors.grey[600]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // const Text(
                      //     "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
                      //     softWrap: true,
                      //
                      //     style: TextStyle(fontSize: 20, fontFamily: "IBM")),

                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () {
                              sendMessageToWhatsApp(
                                  '2569339613', "السلام عليكم،");
                            },
                            child: const Text(
                              "طلب الإشتراك عبر واتس أب",
                              style: TextStyle(
                                fontFamily: "IBM",
                              ),
                            )),
                        CupertinoActionSheetAction(
                            onPressed: () {
                              myPushName(
                                  context, MyPagesRoutes.theAdIsFreeOrNot);
                            },
                            child: const Text(
                              "عرض تفاصيل الإشتراك",
                              style: TextStyle(
                                fontFamily: "IBM",
                              ),
                            )),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('إلغاء',
                            style: TextStyle(
                              fontFamily: "IBM",
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  });
            },
            backgroundColor: kPrimaryColor,
            child: const Icon(
              Icons.add_home_outlined,
              size: 30,              // shadows: [
              //   BoxShadow(
              //       color: const Color(0xffD56300).withOpacity(.26),
              //       blurRadius: 5,
              //       offset: const Offset(3, 5),
              //       spreadRadius: 7)
              // ],
            ),
          )
          // buildSpeedDial()
          // FloatingActionButton(
          //   backgroundColor: kPrimaryColor,
          //   onPressed: () {
          //     // NewSession.get("logged", "") == ""
          //     //     ? toast("يرجى تسجيل الدخول لإنشاء إعلانك")
          //     //     :
          //     // myPushName(context, MyPagesRoutes.step1);
          //
          //   },
          //   child: const Icon(
          //     Icons.add_home_outlined,
          //     color: Colors.white,
          //   ),
          // )
          ),
    );
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
