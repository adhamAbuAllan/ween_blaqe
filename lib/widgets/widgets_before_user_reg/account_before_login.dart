import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/styles/button_of_acount.dart';
import 'package:ween_blaqe/styles/switch_style.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import 'package:ween_blaqe/widgets/user/owner/main_owner.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
import '../../classes_that_effect_widgets/buttons/lines_buttons/line_buttons.dart';
import '../../controller/main_controller.dart';
import '../../controller/owner_controller/owner_controller.dart';
import '../../controller/student_controller/student_controller.dart';
import '../../funcations/route_pages/my_pages_routes.dart';
import '../../funcations/route_pages/push_routes.dart';
import '../user/studnet/main_student.dart';
import '/styles/text_style/aline_style.dart';
import '../../styles/button.dart';
import 'login.dart';

//Account before login Screen

class AccountBeforeLoginInStudent extends StatefulWidget {
  const AccountBeforeLoginInStudent({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLoginInStudent> createState() => _AccountBeforeLoginInStudentState();
}
MainController controller = Get.find();
OwnerController ownerController= Get.find();
StudentController studentController= Get.find();

class _AccountBeforeLoginInStudentState extends State<AccountBeforeLoginInStudent> {
  @override


  Widget build(BuildContext context) {

    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Row(
                children: const [
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

              //notification icon and text and switch
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 32,
                    ),
                  ),
                  Text(
                    "الاشعارات",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBM',
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: OwnSwitch(),
                  )
                ],
              ),
              aline,
              //help
              ButtonAccount(
                  () {
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
              ButtonAccount(
                  () {
                    myPushName(context, MyPagesRoutes.privacyPolicy);
                    },
                  const Icon(
                    Icons.privacy_tip_outlined,
                    size: 32,
                    color: Colors.black87,
                  ),
                  "سياسة الخصوصية"),
              aline,
              //switch to owner
                   ButtonAccount((){
// myPushReplacementNamed(context,MyPagesRoutes.mainOwner);
                   setState(() {
                     ownerController.changeTo(0);
                     controller.changeTo(1);

                     myPushName(context, MyPagesRoutes.mainOwner);


                   });

                    },
                      const Icon(
                        Icons.change_circle_outlined,
                        size: 32,
                        color: Colors.black87,
                      ),
                 "التبديل إلى مالك",),
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
              ButtonAccount(
                  () {
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
                      style: fullButton,
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
                          return  Register();
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
//account before login in owner page widget
class AccountBeforeLoginInOwner extends StatefulWidget {
  const AccountBeforeLoginInOwner({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLoginInOwner> createState() => _AccountBeforeLoginInOwnerState();
}

class _AccountBeforeLoginInOwnerState extends State<AccountBeforeLoginInOwner> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Row(
                children: const [
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
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 32,
                    ),
                  ),
                  Text(
                    "الاشعارات",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBM',
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: OwnSwitch(),
                  )
                ],
              ),
              aline,
              //help
              ButtonAccount(
                      () {
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
              ButtonAccount(
                      () {
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
              ButtonAccount((){
setState(() {


                studentController.changeTo(0);
                controller.changeTo(0);
                myPushName(context,
                    MyPagesRoutes.mainStudent);

});

              },
                const Icon(
                  Icons.change_circle_outlined,
                  size: 32,
                  color: Colors.black87,
                ),
                "التبديل إلى طالب",),
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
              ButtonAccount(
                      () {
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
                      child: Text("تسجيل الدخول"),
                      style: fullButton),
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
                          return Register();
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

