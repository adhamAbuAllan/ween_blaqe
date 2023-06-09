import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class WhatIsMeanSS extends StatelessWidget {
  const WhatIsMeanSS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,

        ),
        body: Column(
          children: [
            //title of what is system paying is allowed
            Row(
              children:  [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
                  child: Text(
                    "ما المقصود ب ش/ش",
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
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(25, 0, 30, 10),
              child:  Text("تظهر هذه "
                  "الكلمة في اسفل الصورة الخاصة في كل إعلان حيث تعني "
                  "(شيكل/شهري) أي يكون إجار الشقة شهريًا بعملة الشيكل",
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
}class CouldBeOwnerAndStudentInOneTime extends StatelessWidget {
  const CouldBeOwnerAndStudentInOneTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,

        ),
        body: Column(
          children: [
            //title of what is system paying is allowed
            Container(
              margin:EdgeInsets.fromLTRB(20, 0, 0, 0) ,
              padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
              child: Text(
                "هل يمكن أن اكون مؤجر و مستأجر في نفس الوقت؟",

                style: TextStyle(

                  fontSize: 20.0,
                  color: Colors.black87,
                  fontFamily: 'IBM',
                  inherit: false,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            //
            //   child: Text(
            //     "هل يمكن أن اكون مؤجر",
            //
            //     style: TextStyle(
            //
            //       fontSize: 20.0,
            //       color: Colors.black87,
            //       fontFamily: 'IBM',
            //       inherit: false,
            //     ),
            //   ),
            // ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(25, 0, 30, 10),
              child:  Text(
                  "نعم، حيث يسمح لك تطبيق 'وين بلاقي' أن تقوم بإنشاء "
                  "إعلانك الخاص و حجز شقة في نفس الوقت ، دون تغيير حسابك الاصلي. ",
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