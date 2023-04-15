import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/widgets/user/studnet/account_of_student.dart';
import 'package:ween_blaqe/widgets/user/studnet/orders_of_student.dart';

import '../../../classes_that_effect_widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import '../../../controller/student_controller/student_controller.dart';

import '../../../main.dart';
import '../../../sesstion/main_session.dart';
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
  var studentController = StudentController();
  int index = 0;

  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var studentcontroller = controller;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: GetBuilder<StudentController>(
        builder: (context){
         return IndexedStack(
           index:studentcontroller.index ,
            children: [
              MasterHome(),
              NotificationOfStudent(),
              OrdersOfStudent(),
              Bookmark(),
              Session.get("logged", "") == "" ? AccountBeforeLogin() :
              AccountOfStudent(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarOfStudent(controller: studentcontroller,),

    );
  }

}
