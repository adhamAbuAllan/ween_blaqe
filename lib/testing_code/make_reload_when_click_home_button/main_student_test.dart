import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/testing_code/make_reload_when_click_home_button/buttom_nav_bar_test.dart';
import 'package:ween_blaqe/testing_code/make_reload_when_click_home_button/main_test.dart';

import '../../controller/student_controller/student_controller.dart';
import 'new_master_home_test.dart';

class MainStudentTest extends StatefulWidget {
  const MainStudentTest({super.key});

  @override
  State<MainStudentTest> createState() => _MainStudentTestState();
}

class _MainStudentTestState extends State<MainStudentTest> {
  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var studentController = controller;
    return Scaffold(
      bottomNavigationBar: BottomNavigatoinBarTest(
        controller: studentController,
      ),
      body: IndexedStack(
        index: studentController.index,
        children: const [
          NewMasterHomeTest(),
          SecondClassTest(),
          ThridClassTest()
        ],
      ),
    );
  }
}
