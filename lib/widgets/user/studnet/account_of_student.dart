import 'dart:math';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';

import '../../../classes_that_effect_widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../controller/main_controller.dart';
import '../../../main.dart';

import '../../../sesstion/new_session.dart';
import '../../../sesstion/sesstion_of_user.dart';

import '/styles/switch_style.dart';
import '/widgets/user/studnet/profile.dart';

import '../../../styles/button.dart';
import '/styles/text_style/aline_style.dart';
//account screen

class AccountOfStudent extends StatelessWidget {
    AccountOfStudent({Key? key}) : super(key: key);
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   var intValue = Random().nextInt(10); // Value is >= 0 and < 10.

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();

    return  ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(

        children: [
            //title
            Row(
              mainAxisSize: MainAxisSize.min,

              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: Text(
                    "الحساب",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),

              child: GestureDetector(

                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const Profile();
                    }),
                  );
                },
                child: Row(

                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://robohash.org/hicveldicta.png"),
                        radius: 30,
                      ),
                    ),
                    Column(

                      children:  [
                        // const Expanded(child: Text(""),flex: 1,),
                        Text(NewSession.get("name", ""),
                          style: const TextStyle(fontSize: 16,
                              fontFamily: 'IBM'
                              ,color: Colors.black87),),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(textDirection: TextDirection.rtl,textAlign: TextAlign.right,"عرض الملف الشخصي",style: TextStyle(fontSize: 12,fontFamily: 'IBM',color: Colors.grey),),
                        ),
                      ],
                    ),
                    Expanded(child: Text("")),
                    // const Expanded(child: SizedBox(child: Text(""),),flex: 1,),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black87,),
                    ),
                  ],
                ),
              ),
            ),
            aline,
            // notification icon and text and switch
          Row(
            mainAxisSize: MainAxisSize.min,

            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 10,0),
                child: Icon(Icons.notifications_outlined,size: 32,),
              ),
              Text("الاشعارات"
                ,style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'IBM',
                ),
              ),
              Expanded(child: SizedBox(child: Text(""),)),
              Padding(

                padding: EdgeInsets.fromLTRB(20, 0, 0,0),
                child: OwnSwitch(),
              )
            ],
          ),
            aline,
            // help
            ButtonAccount((){
              myPushName(context, MyPagesRoutes.askForHelp);

            },
                const Icon(Icons.info_outline,
                  size: 32,
                  color: Colors.black87,),
                "اطلب المساعدة"),

            aline,
            //privacy policy
            ButtonAccount((){
              myPushName(context, MyPagesRoutes.privacyPolicy);
            },
                const Icon(Icons.privacy_tip_outlined,
                  size: 32,color: Colors.black87,),
                "سياسة الخصوصية"),
            aline,
            //switch to student
            ButtonAccount((){
              controller.changeTo(1);
              myPushName(context, MyPagesRoutes.mainOwner);
            },
              const Icon(Icons.change_circle_outlined,
                size: 32,
                color: Colors.black87,),
              "التبديل إلى مالك",
            ),
            // aline,
            //share app
            // ButtonAccount((){},
            //     const Icon(Icons.share_outlined,
            //       size: 32,
            //       color: Colors.black87,) ,
            //     "شارك التطبيق"),
            aline,
            //send feedback for us
            ButtonAccount((){
              myPushName(context, MyPagesRoutes.sendNoticeForUs);

            },
                const Icon(Icons.feedback_outlined,
                  size: 32
                  ,color: Colors.black87,),
                "رسل ملاحظات إلينا"),
            aline,
            //button sign out
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                    onPressed: () async{
                      removeUserInfo();
                      myPushAndRemoveUntilName(context, const Main(), "");


                      },
                    style: outlineButton,
                    child: const Text("تسجيل الخروج")),
              ),
            ),
Expanded(child: Text("")),

          ],
        ),
      ),
    );
  }
}

