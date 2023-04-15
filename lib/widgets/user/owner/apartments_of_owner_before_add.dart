import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import '../../../sesstion/main_session.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import '/styles/button.dart';
import '/widgets/user/owner/steps_to_create_apartment/first_step.dart';
class ApartmentOfOwnerBeforeAdd extends StatelessWidget {
  const ApartmentOfOwnerBeforeAdd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 10, 80),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        'إبدأ في نشر شققك                                            على',
                        style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'IBM',
                            inherit: true,
                            color: Colors.black87),
                      ),
                      TextSpan(
                          text: ' وين بلاقي',
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ), //image
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                child: Image.asset(
                  'assets/images/bottomNavBarIcon/apartment.png',
                ),
              ),
              //text told your start to create apartment ad
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
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



                  Session.get("logged", "") == "" ? toast("يرجى تسجيل الدخول لإنشاء إعلانك") :
                      myPush(context,FirstStep(), MyPagesRoutes.step1);


                },
                child: Text(
                  "إنشاء",
                  style: TextStyle(fontSize: 18),
                ),
                style: fullButton,
              )
            ],
          ),
        ));
  }
}
