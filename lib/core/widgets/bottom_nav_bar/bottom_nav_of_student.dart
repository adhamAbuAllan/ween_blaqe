import 'package:flutter/material.dart';

import '../../../controller/student_controller/student_controller.dart';


class BottomNavigationBarOfStudent extends StatefulWidget {
  final StudentController controller;
  const BottomNavigationBarOfStudent({Key? key, required this.controller})
      : super(key: key);
  @override
  State<BottomNavigationBarOfStudent> createState() =>
      _BottomNavigationBarOfStudentState();
}

class _BottomNavigationBarOfStudentState
    extends State<BottomNavigationBarOfStudent> {
  var index = 0;
  bool isCodeActive = false;
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    return BottomNavigationBar(

      backgroundColor:  const Color(0xB3ffffff),
      selectedItemColor: const Color(0xffff9800),
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
          activeIcon: Icon(Icons.home)
          
        ),
        //notification item
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,

          ),
          label: 'الاشعارات',
          activeIcon: Icon(
            Icons.notifications,

          )
        ),
        //orders item
        BottomNavigationBarItem(
          icon: Icon(Icons.home_repair_service_outlined),
          label: 'الحجوزات',
          activeIcon: Icon(Icons.home_repair_service),

        ),
        //bookmarks item
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.bookmark_outline),
        //   label: 'الحفوظات',activeIcon: Icon(Icons.bookmark)
        // ),
        //account item
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'الحساب',

          activeIcon: Icon(Icons.person_2)
        ),
      ],
    );
  }
}
