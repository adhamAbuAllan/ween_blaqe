import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/widgets/user/studnet/account_of_student.dart';
import 'package:ween_blaqe/widgets/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import 'package:ween_blaqe/widgets/user/studnet/orders_of_student.dart';

import '../../../classes_that_effect_widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import '../../../controller/student_controller/student_controller.dart';

import '../../../funcations/route_pages/my_pages_routes.dart';
import '../../../funcations/route_pages/push_routes.dart';
import '../../../main.dart';
import '../../../sesstion/main_session.dart';
import '../../../sesstion/new_session.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import '../../widgets_that_effect_another_widgets/scroll_to_hide_widget.dart';
import 'bookmark.dart';
import 'master_home.dart';
import 'notification.dart';
import '../owner/orders.dart';
class MainStudent extends StatefulWidget {
   MainStudent({Key? key,
   }) : super(key: key);


  @override
  State<MainStudent> createState() => _MainStudentState();
}


class _MainStudentState extends State<MainStudent> {

  @override
  void initState() {
    super.initState();
    checkWifiStatus();
  }
  var studentController = StudentController();
  int index = 0;

  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: GetBuilder<StudentController>(
          builder: (context){
           return ColorfulSafeArea(
             color: Colors.orange,
             child: IndexedStack(
               index:studentController.index ,
                children: [
                  // MasterHome(),

                  NewMasterHome(),
                  NotificationOfStudentWithNotifi(),
                  OrdersOfStudent(),
                  Bookmark(),
                  NewSession.get("logged", "") == "" ?
                  AccountBeforeLoginInStudent()
                      :
                  AccountOfStudent(),
                ],
              ),
           );
          },
        ),
        bottomNavigationBar: BottomNavigationBarOfStudent(controller: studentController,),

      ),
    );
  }
  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      print('Wi-Fi is connected');
    } else {
      myPushName(context, MyPagesRoutes.noInternet);
    }
  }


}
