import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/controller/main_controller.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/widgets/user/owner/apartments_of_owner_before_add.dart';
import 'package:ween_blaqe/widgets/user/owner/profile_of_owner.dart';
import '../../../api/advantages.dart';
import '../../../classes_that_effect_widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../sesstion/main_session.dart';
import '../../../sesstion/new_session.dart';
import '../../../sesstion/sesstion_of_user.dart';
import '/styles/button_of_acount.dart';
import '/styles/switch_style.dart';
import '/widgets/user/studnet/profile.dart';
import '/widgets/widgets_before_user_reg/account_before_login.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
import '../../../styles/button.dart';
import '/styles/text_style/aline_style.dart';
import 'main_owner.dart';
//account screen
class AccountOfOwner extends StatelessWidget {
   AccountOfOwner({Key? key}) : super(key: key);
 // static const String rountName = "/accountOfOwner";
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
            SizedBox(height: 50,),

              //use GestureDetector that when user click on container make action
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProfileOfOwner();
                      }),
                    );
                  },
                  child: Container(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://robohash.org/hicveldicta.png/"),
                            radius: 30,
                          ),
                        ),
                        Column(
                          children: [

                            Text(NewSession.get("name", ""),style: TextStyle(fontSize: 16,fontFamily: 'IBM',color: Colors.black87),),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text("عرض الملف الشخصي",style: TextStyle(fontSize: 12,fontFamily: 'IBM',color: Colors.grey),),
                            ),


                          ],
                        ),
                        Expanded(child: SizedBox(child: Text(""),)),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0,0),
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
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 10,0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.notifications_outlined,size: 32,),
                  ),
                ),
                Text("الاشعارات"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0,0),
                  child: OwnSwitch(),
                )
              ],
            ),
            aline,
            //help
            ButtonAccount((){
              myPushName(context, MyPagesRoutes.askForHelp);

            },
                Icon(Icons.info_outline,
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
                controller.changeTo(0);

                myPushName(context, MyPagesRoutes.main);





            },
              Icon(Icons.change_circle_outlined,
                size: 32,
                color: Colors.black87,),
              "التبديل إلى طالب",
            ),
            // aline,
            //share app
            // ButtonAccount((){
            //
            // },
            //     Icon(Icons.share_outlined,
            //       size: 32,
            //       color: Colors.black87,) ,
            //     "شارك التطبيق"),
            aline,
            //send feedback for us
            ButtonAccount((){
              myPushName(context, MyPagesRoutes.sendNoticeForUs);

            },
                Icon(Icons.feedback_outlined,
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
                    onPressed: () {
                      removeUserInfo();
                      myPushAndRemoveUntilName(context, MainOwner(), "");
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

