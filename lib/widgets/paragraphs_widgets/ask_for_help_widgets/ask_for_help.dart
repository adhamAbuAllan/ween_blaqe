import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/styles/text_style/aline_style.dart';

import '../../../classes_that_effect_widgets/buttons/lines_buttons/line_buttons.dart';

class AskForHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: ColorfulSafeArea(
color: Colors.orange,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('المساعدة'
            ,style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'IBM',
              ),),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'طالب'),
                Tab(text: 'مالك'),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              //student Tab
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0,450),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                  child:Column(
                    children: [
                      AskForHelpButton((){
                        myPushName(context, MyPagesRoutes.systemPaying);
                      }
                    , "طريقة الدفع"),
                      aline,
                      AskForHelpButton((){
                        myPushName(context, MyPagesRoutes.systemBooking);
                      }
                    , " طريقة الحجز"),
                      aline,
                      AskForHelpButton((){
                        myPushName(context, MyPagesRoutes.whatIsMeanSS);
                      }
                          , "ما المقصود ب ش/ش"),
                    ],
                  )
                ),
              ),
              // Expanded(child: Text("")),



              //owner tab
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 440),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child:  Column(
                      children: [
                        AskForHelpButton((){
                          myPushName(context, MyPagesRoutes.howCreateAd);
                        }
                            , "طريقة نشر إعلان"),
                        aline,
                        AskForHelpButton((){
                          myPushName(context, MyPagesRoutes.couldBeOwnerAndStudentInOneTime);
                        }
                            , "هل يمكن أن أكون مؤجر و مستأجر في نفس الوقت؟"),
                        aline,
                        AskForHelpButton((){
                          myPushName(context, MyPagesRoutes.theAdIsFreeOrNot);
                        }
                            , "هل يتطلب إنشاء إعلان الإشتراك أو دفع رسوم؟"),



                      ],
                    )

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
