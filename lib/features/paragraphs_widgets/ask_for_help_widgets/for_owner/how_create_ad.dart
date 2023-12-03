import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';

class HowCreateAd extends StatelessWidget {
  const HowCreateAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      // bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,

        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                //title of what is system paying is allowed
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: Text(
                        " كيف أنشئ إعلان؟",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontFamily: 'IBM',
                          inherit: true,
                        ),
                      ),
                    ),
                    Expanded(child: Text("")),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 30, 30, 10),
                  child: Text(
                    // "يتطلب إنشاء إعلان على تطبيق 'وين بلاقي' تسجيل الدخول ، و من ثم الضغط على كملة إنشاء أو من خلال الدائرة في اسفل الشاشة  ثم إتباع الخظوات الاربعة لإتمام عملية النشر.",
                    "لإنشاء إعلان خاص بك على تطبيق وين بلاقي ، إذهب إلى الصفحة الرئيسية",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset("assets/images/screenshot/Screenshot_home_screen.png",width: 200,height: 300,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    "إضعط على زر إضافة شقة المتواجد في اسفل الشاشة على اليمين",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset(
                    "assets/images/screenshot/Screenshot_select_add_home_button.png",width: 200,height: 300,),
                Container(

                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    // " في حال"
                    // " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                    // " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
                    "ستظهر لك ايقونة الواتس أب ، قم بإضغط عليها",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
            
                Image.asset(

                    "assets/images/screenshot/Screenshot_select_what_app_button.png",width: 200,height: 300,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 5, 30, 10),
                  child: Text(
                    // " في حال"
                    // " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                    // " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
                    "وسيتم الرد على رسالتك خلال بضع دقائق",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
