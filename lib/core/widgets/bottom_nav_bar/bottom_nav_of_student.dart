import 'package:flutter/material.dart';

import '../../../api/apartments_api/one_apartment.dart';
import '../../../constants/localization.dart';
import '../../../constants/nums.dart';

import '../../../constants/strings.dart';
import '../../../controller/get_controllers.dart';
import '../../../controller/student_controller/student_controller.dart';
import '../../../features/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import '../../utils/funcations/route_pages/push_routes.dart';

class BottomNavigationBarOfStudent extends StatefulWidget {
  final StudentController controller;
  final ScrollController? scrollController;

  const BottomNavigationBarOfStudent({
    super.key,
    required this.controller,
    this.scrollController,
  });

  @override
  State<BottomNavigationBarOfStudent> createState() =>
      _BottomNavigationBarOfStudentState();
}

class _BottomNavigationBarOfStudentState
    extends State<BottomNavigationBarOfStudent> {
  NewMasterHome newMasterHome = const NewMasterHome();
  String errorMessage = "";
  late Apartments apartmentsRes;
  bool isDataLoaded = false; //data load from server

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
        
      ),

      // selectedIconTheme: const IconThemeData(opacity: 1),
      // unselectedIconTheme: const IconThemeData(opacity: .5),
      // enableFeedback: false,
      backgroundColor:
          themeMode.isLight ? kContainerColorLightMode : kContainerColorDarkMode,
      selectedItemColor:
          themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      elevation: 0,
      currentIndex: controller.index,
      onTap: (i) {
        debugPrint("the isLoading = ${apartmentModelController.isLoading.value}");
        setState(() {
          if (i == 0 &&
              controller.index == 0 &&
              widget.scrollController!.offset > 400) {
            //if the index is 0 then go to the top of the screen
            debugPrint(
                "the i = $i and the controller.index = ${controller.index}");
            setState(() {
              widget.scrollController!.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });

            // new
            //make the [isHomeIndex] true if the index is 0
            // isHomeIndex = true;
          } else if (i == 0 &&
              controller.index == 0 &&
              widget.scrollController!.offset < 100) {
            cityModelController.cityId.value = 0;


            myPushReplacementNamed(MyPagesRoutes.main, context: context);
          }
          controller.changeTo(i);
          // this.index = index;
        });
        // if ( !controllerScroll.isHomeIndex ) {
        //   //if the index is 0 then go to the top of the screen
        //   controllerScroll.scrollController.animateTo(
        //     0,
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeInOut,
        //   );
        // }
      },
      //items of BottomNavigationBer Widget
      items:  [
        //home item
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: SetLocalization.of(context)!.getTranslateValue("home"),
            activeIcon: const Icon(Icons.home)),
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
          icon: const Icon(
            Icons.home_repair_service_outlined,
          ),
          label: SetLocalization.of(context)!.getTranslateValue("orders"),
          activeIcon: const Icon(Icons.home_repair_service),
        ),
        //bookmarks item
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.bookmark_outline),
        //   label: 'الحفوظات',activeIcon: Icon(Icons.bookmark)
        // ),
        //account item
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_2_outlined),
            label: SetLocalization.of(context)!.getTranslateValue("my_account"),
            activeIcon: const Icon(Icons.person_2)),
      ],
    );
  }
}
