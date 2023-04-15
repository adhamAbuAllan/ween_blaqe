
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/bottom_nav_bar/bottom_nav_of_owner.dart';
import 'package:ween_blaqe/widgets/user/owner/account_of_owner.dart';
import 'package:ween_blaqe/widgets/user/owner/apartments_of_owner_before_add.dart';
import 'package:ween_blaqe/widgets/user/owner/profile_of_owner.dart';
import 'package:ween_blaqe/widgets/user/owner/orders.dart';
import '../../../controller/owner_controller/owner_controller.dart';
import '../../../main.dart';
import '../../../sesstion/main_session.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import 'notification_of_owner.dart';

class MainOwner extends StatefulWidget {
  MainOwner({Key? key,
  }) : super(key: key);
  @override
  State<MainOwner> createState() => _MainOwnerState();
}
class _MainOwnerState extends State<MainOwner> {
  var ownerController = OwnerController();
  int index = 0;
  OwnerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var ownerController = controller;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,

        body: GetBuilder<OwnerController>(
        builder: (context){
          return IndexedStack(
            index: ownerController.index,
            children: [
             ApartmentOfOwnerBeforeAdd(),
              NotificationOfOwner(),
              Orders(),
              Session.get("logged", "") == "" ? AccountBeforeLogin() :
              AccountOfOwner(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarOfOwner(controller: ownerController,)
    );
  }
}
