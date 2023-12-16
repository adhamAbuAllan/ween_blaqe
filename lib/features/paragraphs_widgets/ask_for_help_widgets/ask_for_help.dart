import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import 'package:ween_blaqe/constants/nums.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';

class AskForHelp extends StatelessWidget {
  const AskForHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ColorfulSafeArea(
        // bottomColor: Colors.transparent ,
        color: kPrimaryColor,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text(
              'المساعدة',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'IBM',
              ),
            ),
            bottom: const TabBar(
              dividerColor: Colors.white,

              tabs: [
                Tab(text: 'مُستأجر'),
                Tab(text: 'مالك'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //student Tab
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 530),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.systemPaying);
                        }, "الدفع"),
                        aline,
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.systemBooking);
                        }, "الحجز"),
                        aline,
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.whatIsMeanSS);
                        }, "ما المقصود ب ش/ش"),
                      ],
                    )),
              ),
              // Expanded(child: Text("")),

              //owner tab
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 560),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.howCreateAd);
                        }, "طريقة نشر إعلان"),
                        askForHelpButton((){}, "ما هي البيانات المطلوبة لنشر إعلان"),
                        // aline,
                        // askForHelpButton(() {
                        //   myPushName(context,
                        //       MyPagesRoutes.couldBeOwnerAndStudentInOneTime);
                        // }, "هل يمكن أن أكون مؤجر و مستأجر في نفس الوقت؟"),
                        aline,
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.theAdIsFreeOrNot);
                        }, "هل يتطلب إنشاء إعلان الإشتراك أو دفع رسوم؟"),
                      ],
                    )),
              ),
            ],
          ),
        floatingActionButton:

        Padding(
          padding: const EdgeInsets.only(bottom: 45.0),
          child: FloatingActionButton(

            shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16/2),) ,
            onPressed: (){                              sendMessageToWhatsApp(
                '2569339613', "السلام عليكم، ممكن مساعدة، ");},backgroundColor: const Color(0xff25D366),


            child: const FaIcon(FontAwesomeIcons.whatsapp,size: 30,),),
        ),
        ),
      ),
    );

  }
}
