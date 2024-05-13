import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../controller/student_controller/student_controller.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import 'from_master_home_to_show_more/new_master_home.dart';
import 'orders_of_student.dart';

class MainStudent extends StatefulWidget {
  const MainStudent({
    Key? key,
  }) : super(key: key);

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  @override
  void initState() {
    super.initState();
    // checkWifiStatus();
  }

  var studentController = StudentController();
  int index = 0;

  StudentController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(

          // appBar: AppBar(bottomOpacity: 0,leadingWidth: 20,toolbarOpacity: 0,backgroundColor: Colors.transparent,elevation: 0,shadowColor: Colors.transparent,title: Text("Your wlecome "),),
          backgroundColor:themeMode.isDark ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,
          body: GetBuilder<StudentController>(
            builder: (context) {
              return ColorfulSafeArea(
                bottomColor: Colors.transparent,
                color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
                child: IndexedStack(
                  index: studentController.index,
                  children:  [
                    // MasterHome(),

                    const NewMasterHome(),
                    // const NewMasterHomeTest(),
                    // NotificationOfStudentWithNotifi(),
                    // const OrdersOfStudent(),
                    // const Bookmark(),
                    // NewSession.get("logged", "") == ""
                    //     ?
                    AccountBeforeLoginInStudent()
                    // : AccountOfStudent(),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar:
          BottomNavigationBarOfStudent(
            controller: studentController,
          ),
// floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton:
          Padding(
          padding: const EdgeInsets.only(bottom:0),
          child: FloatingActionButton(

            // shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16/2),) ,
            onPressed: (){                              sendMessageToWhatsApp(
                '2569339613', "السلام عليكم، ",isMyNumber: true);},backgroundColor: const Color(0xff25D366),


            child: const FaIcon(FontAwesomeIcons.whatsapp,size: 30,),),
          )          // buildSpeedDial()
          // FloatingActionButton(
          //   backgroundColor: kPrimaryColor,
          //   onPressed: () {
          //     // NewSession.get("logged", "") == ""
          //     //     ? toast("يرجى تسجيل الدخول لإنشاء إعلانك")
          //     //     :
          //     // myPushName(context, MyPagesRoutes.step1);
          //
          //   },
          //   child: const Icon(
          //     Icons.add_home_outlined,
          //     color: Colors.white,
          //   ),
          // )
          ),
    );
  }

  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint('Wi-Fi is connected');
    } else {
      pushToNoInternetPage();
    }
  }

  void pushToNoInternetPage() {
    myPushName(context, MyPagesRoutes.noInternet);
  }
}

// SpeedDial buildSpeedDial() {
//   return SpeedDial(
//     curve: Curves.linear,
//
//     spacing: 25,
//     // activeBackgroundColor: Colors.orange[400],
//     overlayColor: Colors.grey,
//     // animatedIcon: AnimatedIcons.home_menu,
//     icon: Icons.add_home_outlined,
//     backgroundColor: kPrimaryColor,
//     renderOverlay: true,
//     closeManually: false,
//     switchLabelPosition: true,
//
//     children: [
//       SpeedDialChild(
//         child: const Icon(
//           FontAwesomeIcons.whatsapp,
//           color: Colors.white,
//         ),
//         //25D366
//         backgroundColor: const Color(0xff25D366),
//         // label: 'whatsApp',
//         onTap: () {
//           sendMessageToWhatsApp('2569339613', "هل يمكنني الاستفسار عن هذا؟");
//         },
//       ),
//       // SpeedDialChild(
//       //   child: Image.asset(m),
//       //   label: 'messenger',
//       //   onTap: () => print('Edit'),
//       // ),
//     ],
//   );
// }
