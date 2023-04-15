import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/styles/button_of_acount.dart';
import 'package:ween_blaqe/styles/switch_style.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
import '../../classes_that_effect_widgets/buttons/account_buttons/acount_button.dart';
import '../../controller/main_controller.dart';
import '/styles/text_style/aline_style.dart';
import '../../styles/button.dart';
import 'login.dart';
//Account before login Screen
class AccountBeforeLogin extends StatefulWidget {
  const AccountBeforeLogin({Key? key}) : super(key: key);

  @override
  State<AccountBeforeLogin> createState() => _AccountBeforeLoginState();
}
MainController controller = Get.find();

class _AccountBeforeLoginState extends State<AccountBeforeLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(        backgroundColor: Colors.grey.shade200,
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

              //subtitle of title
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0,10, 55),
                    child: Text(
                      "قم تسجيل الدخول لتحجز / لتنشر اول شقة لك ",

                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontFamily: 'IBM'
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),

                ],
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
              //button login
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: SizedBox(
                  width: 350,
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
              Row(children: [
                //ask user if don't have account
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text("ألا تمتلك حساب؟",
                    style: TextStyle( color: Colors.black87,

                    ),
                  ),
                ),
                //reg
                TextButton(
                  child:Text("إنشاء حساب",
                  style: TextStyle( color: Colors.black,
      decoration: TextDecoration.underline,
      fontFamily: 'IBM',
      ),),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const Register();
                      }),
                    );
                  },

                ),

              ],),
            ],
          ),
        ),
      ),
    );
  }
}
