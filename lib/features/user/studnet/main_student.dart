import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../controller/student_controller/student_controller.dart';
import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import '../../../sesstion/new_session.dart';
import 'package:ween_blaqe/constants/nums.dart';import '../../widgets_before_user_reg/account_before_login.dart';
import 'account_of_student.dart';
import 'bookmark.dart';
import 'from_master_home_to_show_more/new_master_home.dart';
import 'notification.dart';
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
    checkWifiStatus();
  }

  var studentController = StudentController();
  int index = 0;

  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: GetBuilder<StudentController>(
          builder: (context) {
            return ColorfulSafeArea(
              color: kPrimaryColor,
              child: IndexedStack(
                index: studentController.index,
                children: [
                  // MasterHome(),

                  const NewMasterHome(),
                  const NotificationOfStudentWithNotifi(),
                  const OrdersOfStudent(),
                  const Bookmark(),
                  NewSession.get("logged", "") == ""
                      ? const AccountBeforeLoginInStudent()
                      : AccountOfStudent(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBarOfStudent(
          controller: studentController,
        ),
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
