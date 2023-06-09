import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import '../../../sesstion/new_session.dart';
import '/styles/button.dart';
import '/widgets/user/owner/steps_to_create_apartment/first_step.dart';
class ApartmentOfOwnerBeforeAdd extends StatelessWidget {
  const ApartmentOfOwnerBeforeAdd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //title
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0,50 ,20,80),
                     child: Column(
                       children: [
                         Row(
                           children: const [
                             Text('إبدأ في نشر شققك',
                                    style: TextStyle(
                                        fontSize: 28.0,
                                        fontFamily: 'IBM',
                                        inherit: true,
                                        color: Colors.black87),
                                  ),
                             Expanded(child: Text('')),
                           ],
                         ),
                         Row(
                           children: const [
                             Text(
                                 'على' ,
                                 style: TextStyle(
                                     fontSize: 28,
                                     fontFamily: 'IBM',
                                     inherit: true,
                                     color: Colors.black87,
                                     fontWeight: FontWeight.bold)),

                             Text(
                                 ' وين بلاقي',
                                 style: TextStyle(
                                     fontSize: 28,
                                     fontFamily: 'IBM',
                                     inherit: true,
                                     color: Colors.orange,
                                     fontWeight: FontWeight.bold)),
                             Expanded(child: Text(''))
                           ],
                         ),
                       ],





                ),
                   ), //image
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                  child: Image.asset(
                    'assets/images/bottomNavBarIcon/apartment.png',
                  ),
                ),
                //text told your start to create apartment ad
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                  child: Text(
                    "قم بإنشاء أول شقة لك",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                // butotn that navigator to step one widget
                ElevatedButton(
                  onPressed: () {



                    NewSession.get("logged", "") == "" ? toast("يرجى تسجيل الدخول لإنشاء إعلانك") :
                        myPushName(context, MyPagesRoutes.step1);


                  },
                  style: fullButton,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: SizedBox(
                      // width: double.infinity,

                      // height: 55,
                      child: Text(
                        "إنشاء",
                        style: TextStyle(
                            fontSize: 18,
                        fontFamily: 'IBM'
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
