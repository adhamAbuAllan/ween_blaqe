import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import '../../../classes_that_effect_widgets/buttons/account_buttons/acount_button.dart';
import '../../../controller/main_controller.dart';
import '../../../main.dart';
import '../../../sesstion/main_session.dart';
import '../../../sesstion/sesstion_of_user.dart';
import '../../../urls_of_project/localhost_urls.dart';
import '../../widgets_before_user_reg/login.dart';
import '/styles/button_of_acount.dart';
import '/styles/switch_style.dart';
import '/widgets/user/studnet/profile.dart';
import '/widgets/widgets_before_user_reg/account_before_login.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
import '../../../styles/button.dart';
import '/styles/text_style/aline_style.dart';
//account screen

class AccountOfStudent extends StatelessWidget {
   AccountOfStudent({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();

    return  Scaffold(
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
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 10, 35),
              //use GestureDetector that when user click on container make action
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Profile();
                    }),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("https://robohash.org/hicveldicta.png"),
                          radius: 30,
                        ),
                      ),
                      Column(
                        children: [

                          Text(Session.get("name", ""),style: TextStyle(fontSize: 16,fontFamily: 'IBM',color: Colors.black87),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                            child: Text("عرض الملف الشخصي",style: TextStyle(fontSize: 12,fontFamily: 'IBM',color: Colors.grey),),
                          ),


                        ],
                      ),
                      Expanded(child: SizedBox(child: Text(""),)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black87,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            aline,
            //notification icon and text and switch
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
                  child: Icon(Icons.notifications_outlined,size: 32,),
                ),
                Text("الاشعارات"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0,0),
                  child: OwnSwitch(),
                )
              ],
            ),
            aline,
            //help
            ButtonAccount((){},
                Icon(Icons.info_outline,
                  size: 32,
                  color: Colors.black87,),
                "اطلب المساعدة"),
            aline,
            //Terms of Service
            ButtonAccount((){},
                const Icon(Icons.content_paste,
                  size: 32,
                  color: Colors.black87,),
                "بنود الخدمة"),
            aline,
            //privacy policy
            ButtonAccount((){},
                const Icon(Icons.privacy_tip_outlined,
                  size: 32,color: Colors.black87,),
                "سياسة الخصوصية"),
            aline,
            //switch to student
            ButtonAccount((){
              controller.changeTo(1);
            },
              Icon(Icons.change_circle_outlined,
                size: 32,
                color: Colors.black87,),
              "التحويل إلى مالك",
            ),
            aline,
            //share app
            ButtonAccount((){},
                Icon(Icons.share_outlined,
                  size: 32,
                  color: Colors.black87,) ,
                "شارك التطبق"),
            aline,
            //send feedback for us
            ButtonAccount((){},
                Icon(Icons.feedback_outlined,
                  size: 32
                  ,color: Colors.black87,),
                "رسل ملاحظات إلينا"),
            aline,
            //button sign out
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: SizedBox(
                width: 350,
                height: 55,
                child: OutlinedButton(
                    onPressed: () async{
                      removeUserInfo();
                     myPushAndRemoveUntilIsFirst(context, Main(), MyPagesRoutes.accountBeforeReg);

                      },
                    child: Text("تسجيل الخروج"),
                    style: outlineButton),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

