import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';

class HowCreateAd extends StatelessWidget {
  const HowCreateAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      // bottomColor: Colors.transparent ,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isDark ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,

        appBar: AppBar(
          backgroundColor: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                //title of what is system paying is allowed
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets .fromLTRB(0, 50, 25, 10),
                      child: Text(
                        " كيف أنشئ إعلان؟",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                          fontFamily: 'IBM',
                          inherit: true,
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
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
                      color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode.withOpacity(.8),
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset(


                  "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.48.13.png",width: 300,height: 400,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    "إضعط على زر إضافة شقة المتواجد في اسفل الشاشة على اليمين",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode.withOpacity(.8),
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset(
                    "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.32.35.png",width: 300,height: 400,),
                Container(

                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    // " في حال"
                    // " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                    // " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
                    "ثم أضغط على زر 'اطلب الإشتراك عبر واتس أب'",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode.withOpacity(.8),
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
            
                Image.asset(

                    "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.27.36.png",width: 300,height: 400,),
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
                      color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode.withOpacity(.8),
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
