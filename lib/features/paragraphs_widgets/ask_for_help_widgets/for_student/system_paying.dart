import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import '../../../../constants/nums.dart';
import '../../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

//this class have buttons that go to paragraphs
class SystemPaying extends StatelessWidget {
  const SystemPaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,

        appBar: AppBar(
          title: const Text(
            'الدفع',
            style: TextStyle(fontFamily: 'IBM'),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    //cancel
                    children: [
                      askForHelpButton(() {
                        myPushName(
                            context, MyPagesRoutes.whatIsSystemPayingAllow);
                      }, "ما هي طرق الدفع المقبولة؟"),
                      aline,
                      askForHelpButton(() {
                        myPushName(context, MyPagesRoutes.couldIPayByDeposit);
                      }, "هل يمكنني دفع عربون؟"),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

//what_is_system_paying_allow?
class WhatIsSystemPayingAllow extends StatelessWidget {
  const WhatIsSystemPayingAllow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,

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
                    "ما هي طرق الدفع المقبولة؟",
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
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "يتم الدفع عن طريق الاتفاق بينك و بين المالك ، وغالبًا ما تكون الصفقات بين المؤجر و المستأجر في الضفة الغربية بالدفع نقداً. ",
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
              child: const Text(
                "سيتم العمل على إجاد طرق اخرى للدفع مثل"
                " البطاقات الإتمانية و غيرها من الطرق مسقبلاً بإذن الله",
                style: TextStyle(
                  fontSize: 16.0,
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

//could pay deposit?
class CouldIPayByDeposit extends StatelessWidget {
  const CouldIPayByDeposit({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.fromLTRB(0, 30, 25, 10),
                  child: Text(
                    "هل يمكنني دفع عربون؟",
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
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "حسب الاتفاق بينك و بين المؤجر، ولكن غالبًا ما يوافق المؤجرون على دفع عربون حتى يظمن المؤجر حقه.",
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
