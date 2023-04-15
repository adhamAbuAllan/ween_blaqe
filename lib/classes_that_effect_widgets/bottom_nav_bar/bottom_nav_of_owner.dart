import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/first_step.dart';

import '../../controller/owner_controller/owner_controller.dart';

class BottomNavigationBarOfOwner extends StatefulWidget {
  OwnerController controller;

  BottomNavigationBarOfOwner({Key? key,
  required this.controller}) : super(key: key);
  @override
  State<BottomNavigationBarOfOwner> createState() =>
      _BottomNavigationBarOfOwnerState();
}
class _BottomNavigationBarOfOwnerState
    extends State<BottomNavigationBarOfOwner> {
  var index = 0;
  bool clicked  = false;
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;

    // Icons.notifications_outlined,
    // Icons.home_repair_service_outlined
    // Icons.person_2_outlined


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
          clicked = !clicked;
          controller.changeTo(i);
          // this.index = index;
        });
      },
        //items of BottomNavigationBer Widget
        items: [
          //you apartments item
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_outlined),
            label: 'شققك',
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
            icon: Icon(Icons.home_repair_service_outlined ),
            label: 'الحجوزات',
          ),
          //acount item
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'الحساب',
          ),
        ],
    );
  }
}
