import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';

class HowCreateAd extends StatelessWidget {
  const HowCreateAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
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
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "يتطلب إنشاء إعلان على تطبيق 'وين بلاقي' تسجيل الدخول ، و من ثم الضغط على كملة إنشاء أو من خلال الدائرة في اسفل الشاشة  ثم إتباع الخظوات الاربعة لإتمام عملية النشر.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM',
                  inherit: true,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                " في حال"
                " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
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
    );
  }
}
