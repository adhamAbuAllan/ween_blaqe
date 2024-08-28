import 'package:flutter/material.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../api/apartments_api/one_apartment.dart';
import '../../../constants/nums.dart';
import '../../../controller/get_controllers.dart';
import '../../../controller/student_controller/student_controller.dart';

class BottomNavigationBarOfStudent extends StatefulWidget {
  final StudentController controller;


  const BottomNavigationBarOfStudent({
    super.key,
    required this.controller,

  });

  @override
  State<BottomNavigationBarOfStudent> createState() =>
      _BottomNavigationBarOfStudentState();
}

class _BottomNavigationBarOfStudentState
    extends State<BottomNavigationBarOfStudent> {
  String errorMessage = "";
  late OneApartment apartmentsRes;
  bool isDataLoaded = false; //data load from server
  bool isHomeIndex = false; // to check the current index is home or not.

  @override
  void initState() {
    super.initState();
  }

  var index = 0;
  bool isCodeActive = false;

  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(fontFamily: 'IBM'),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'IBM',
      ),

      // selectedIconTheme: const IconThemeData(opacity: 1),
      // unselectedIconTheme: const IconThemeData(opacity: .5),
      // enableFeedback: false,
      backgroundColor:
          themeMode.isDark ? kContainerColorLightMode : kContainerColorDarkMode,
      selectedItemColor:
          themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      elevation: 0,
      currentIndex: controller.index,
      onTap: (i) {
        setState(() {
          if (i == 0 && controller.index == 0) {
            //make the [isHomeIndex] true if the index is 0
            isHomeIndex = true;
          } else {
            isHomeIndex = false;
          }
          controller.changeTo(i);
          // this.index = index;
        });
        if (isHomeIndex) {
          //if the index is 0 then go to the top of the screen
          controllerScroll.scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      //items of BottomNavigationBer Widget
      items: const [
        //home item
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
            activeIcon: Icon(Icons.home)),
        //notification item
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.notifications_outlined,
        //
        //   ),
        //   label: 'الاشعارات',
        //   activeIcon: Icon(
        //     Icons.notifications,
        //
        //   )
        // ),
        //orders item
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_repair_service_outlined,
          ),
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
            activeIcon: Icon(Icons.person_2)),
      ],
    );
  }
}
