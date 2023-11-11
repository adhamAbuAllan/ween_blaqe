// import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/utils/styles/switch_style.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import 'package:ween_blaqe/constants/nums.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';

import 'registration.dart';
import '../../controller/main_controller.dart';
import '../../controller/owner_controller/owner_controller.dart';
import '../../controller/student_controller/student_controller.dart';
import 'login.dart';

//Account before login Screen

class AccountBeforeLoginInStudent extends StatefulWidget {
  const AccountBeforeLoginInStudent({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLoginInStudent> createState() =>
      _AccountBeforeLoginInStudentState();
}

bool notificationState = true;
bool isCodeActive = false;
late bool currentValue;

MainController controller = Get.find();
OwnerController ownerController = Get.find();
StudentController studentController = Get.find();

class _AccountBeforeLoginInStudentState
    extends State<AccountBeforeLoginInStudent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentValue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                    child: Text(
                      "الحساب",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'IBM',
                        inherit: true,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),

              //subtitle of title
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 55),
                    child: Text(
                      "قم بتسجيل الدخول لتحجز اول شقة لك ",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontFamily: 'IBM'),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              aline,

              // notification icon and text and switch

              GestureDetector(
                onTap: () {
                  setState(() {
                    notificationState = !currentValue;
                  });
                  currentValue = notificationState;
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 32,
                      ),
                    ),
                    const Text(
                      "الاشعارات",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'IBM',
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Switcher(
                          light1: notificationState,
                          onChanged: (currentValue) {
                            setState(() {
                              // currentValue = value;
                              notificationState = currentValue;
                              // value ==
                              // false
                              // ? toast("تم كتم الاشعارات")
                              // : toast("تم تفعيل الاشعارات");
                            });
                          }),
                    )
                  ],
                ),
              ),
              aline,
              //help
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.askForHelp);
              },
                  const Icon(
                    Icons.info_outline,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "اطلب المساعدة"),

              aline,
              //privacy policy
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.privacyPolicy);
              },
                  const Icon(
                    Icons.privacy_tip_outlined,
                    size: 32,
                    color: Colors.black87,
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
//                 const Icon(
//                   Icons.change_circle_outlined,
//                   size: 32,
//                   color: Colors.black87,
//                 ),
//                 "التبديل إلى مالك",
//               ),
              // aline,

              //share app
              // ButtonAccount(
              //     () {},
              //     const Icon(
              //       Icons.share_outlined,
              //       size: 32,
              //       color: Colors.black87,
              //     ),
              //     "شارك التطبيق"),
              aline,
              //send feedback for us
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.sendNoticeForUs);
              },
                  const Icon(
                    Icons.feedback_outlined,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "أرسل ملاحظات إلينا"),
              aline,
              //button login
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) {
                        //     return const Login();
                        //   }),
                        // );
                        showSnakBar(context,
                            "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                      },
                      style: fullButton.copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.grey)),
                      child: const Text("تسجيل الدخول")),
                ),
              ),
              //ask user if don't have count and create account
              Row(
                children: [
                  //ask user if don't have account
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "ألا تمتلك حساب؟",
                      style: TextStyle(
                        color: Colors.black87,
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
                      //     return const Register();
                      //   }),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//account before login in owner page widget
class AccountBeforeLoginInOwner extends StatefulWidget {
  const AccountBeforeLoginInOwner({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLoginInOwner> createState() =>
      _AccountBeforeLoginInOwnerState();
}

class _AccountBeforeLoginInOwnerState extends State<AccountBeforeLoginInOwner> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                    child: Text(
                      "الحساب",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'IBM',
                        inherit: true,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),

              //subtitle of title
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 55),
                    child: Text(
                      "قم تسجيل الدخول لإعلان اول شقة لك ",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontFamily: 'IBM'),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              aline,

              //notification icon and text and switch
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 32,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "الاشعارات",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBM',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Switcher(
                        light1: notificationState,
                        onChanged: (value) {
                          setState(() {
                            notificationState = value;
                            // value ==
                            // false
                            // ? toast("تم كتم الاشعارات")
                            // : toast("تم تفعيل الاشعارات");
                          });
                        }),
                  )
                ],
              ),
              aline,
              //help
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.askForHelp);
              },
                  const Icon(
                    Icons.info_outline,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "اطلب المساعدة"),

              aline,
              //privacy policy
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.privacyPolicy);
              },
                  const Icon(
                    Icons.privacy_tip_outlined,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "سياسة الخصوصية"),
              aline,
              //switch to student
              buttonAccount(
                () {
                  setState(() {
                    studentController.changeTo(0);
                    controller.changeTo(0);
                    myPushName(context, MyPagesRoutes.mainStudent);
                  });
                },
                const Icon(
                  Icons.change_circle_outlined,
                  size: 32,
                  color: Colors.black87,
                ),
                "التبديل إلى طالب",
              ),
              // aline,

              //share app
              // ButtonAccount(
              //         () {},
              //     const Icon(
              //       Icons.share_outlined,
              //       size: 32,
              //       color: Colors.black87,
              //     ),
              //     "شارك التطبيق"),
              aline,
              //send feedback for us
              buttonAccount(() {
                myPushName(context, MyPagesRoutes.sendNoticeForUs);
              },
                  const Icon(
                    Icons.feedback_outlined,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "أرسل ملاحظات إلينا"),
              aline,
              //button login
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const Login();
                          }),
                        );
                      },
                      style: fullButton.copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.grey)),
                      child: const Text("تسجيل الدخول")),
                ),
              ),
              //ask user if don't have count and create account
              Row(
                children: [
                  //ask user if don't have account
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "ألا تمتلك حساب؟",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  //reg
                  TextButton(
                    child: const Text(
                      "إنشاء حساب",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const Register();
                        }),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension MakeSwitch on bool {}
