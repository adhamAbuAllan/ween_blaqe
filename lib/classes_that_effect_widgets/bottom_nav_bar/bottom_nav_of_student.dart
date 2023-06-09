import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/student_controller/student_controller.dart';
class BottomNavigationBarOfStudent extends StatefulWidget {
  StudentController controller;
  BottomNavigationBarOfStudent({Key? key,
    required this.controller
  }) : super(key: key);
  @override
  State<BottomNavigationBarOfStudent> createState() => _BottomNavigationBarOfStudentState();
}
class _BottomNavigationBarOfStudentState extends State<BottomNavigationBarOfStudent> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    return BottomNavigationBar(
      backgroundColor: Colors.white70,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      elevation: 0,
    currentIndex: controller.index,
      onTap: (i) {
        setState(() {
          controller.changeTo(i);
          // this.index = index;
        });
      },
      //items of BottomNavigationBer Widget
      items: const [
        //home item
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),
        //notification item
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
          ),
          label: 'الاشعارات',
        ),
        //orders item
        BottomNavigationBarItem(
          icon: Icon(Icons.home_repair_service_outlined),
          label: 'الحجوزات',
        ),
        //bookmarks item
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline),
          label: 'الحفوظات',
        ),
        //account item
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'الحساب',
        ),
      ],
    );
  }
}
