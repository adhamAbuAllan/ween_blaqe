import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../controller/student_controller/student_controller.dart';

class BottomNavigatoinBarTest extends StatefulWidget {
  const BottomNavigatoinBarTest({super.key,required this.controller});
  final StudentController controller;
  @override
  State<BottomNavigatoinBarTest> createState() =>
      _BottomNavigatoinBarTestState();
}

class _BottomNavigatoinBarTestState extends State<BottomNavigatoinBarTest> {
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    return BottomNavigationBar(
      currentIndex: controller.index,
        onTap: (i) {
          setState(() {
            controller.changeTo(i);
            // this.index = index;
          });
          if(i == 0){
            Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
          }
        },
        items: const [
      BottomNavigationBarItem(

          icon: Icon(Icons.home_outlined),
          label: 'home',
          activeIcon: Icon(Icons.home)),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_repair_service_outlined,
        ),
        label: 'screen2',
        activeIcon: Icon(Icons.home_repair_service),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'screen3',
          activeIcon: Icon(Icons.person_2))
    ]);
  }
}
