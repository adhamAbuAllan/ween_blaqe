import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/styles/text_style/aline_style.dart';

import 'classes_that_effect_widgets/buttons/lines_buttons/line_buttons.dart';
class ScreensWillAddFuture extends StatelessWidget {
  const ScreensWillAddFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,

      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Column(children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
                  child: Text(
                    "شاشات سيتم إضافتها مستقبلاً",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
SizedBox(height: 50,),
            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.searchFilter);
            },"التصفية"),
            aline,
            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.noInternet);
            },"لا يوجد إنترنت")  ,
            aline,

            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.searchNotFound);
            },"نتيجة بحث غير موجودة"),
            aline,

            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.refactorApartment);
            },"تعديل إعلان"),
            aline,

            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.masterHome);
            },"عرض شقق"),
            aline,
            ButtonGoToPage((){
              myPushName(context, MyPagesRoutes.getStarted);
            },"إبدأ الآن"),
            aline,





          ],),
        ),
      ),
    );
  }
}
