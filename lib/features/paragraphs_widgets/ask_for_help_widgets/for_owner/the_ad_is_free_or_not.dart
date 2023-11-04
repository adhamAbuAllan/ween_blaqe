import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';

class TheAdIsFreeOrNot extends StatelessWidget {
  const TheAdIsFreeOrNot({Key? key}) : super(key: key);

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
            //title
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
              child: const Text(
                " هل يتطلب إنشاء إعلان الإشتراك أو دفع رسوم ؟",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontFamily: 'IBM',
                  inherit: false,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "في الوقت الحالي لا يتطلب إنشاء إعلان لشقتك الاشتراك"
                " أو دفع رسوم ، بما أن التطبيق الان في الوضع التجريبي. ",
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
