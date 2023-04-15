import 'dart:convert';import 'package:flutter_localizations/flutter_localizations.dart';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:get/get_navigation/src/root/get_material_app.dart';import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/show_more_classes_widget/show_all_advantages_class_widget.dart';import 'package:ween_blaqe/controller/main_controller.dart';import 'package:ween_blaqe/controller/owner_controller/owner_controller.dart';import 'package:ween_blaqe/controller/student_controller/student_controller.dart';import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/image_picker_apartment.dart';
import 'package:ween_blaqe/sesstion/main_session.dart';
import 'package:ween_blaqe/skeletons/student_widgets/booking_now_skeleton_widget.dart';
import 'package:ween_blaqe/skeletons/student_widgets/bookmark_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/skeletons/student_widgets/notification_skeleton_widget.dart';
import 'package:ween_blaqe/skeletons/student_widgets/show_all_adv_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/show_more_skeleton_widget.dart';
import 'package:ween_blaqe/splach_screen.dart';import 'package:ween_blaqe/testing_code/add_images.dart';import 'package:ween_blaqe/widgets/error_widgets/no_internet.dart';import 'package:ween_blaqe/widgets/error_widgets/search_not_found.dart';import 'package:ween_blaqe/widgets/user/owner/apartment_of_owner.dart';import 'package:ween_blaqe/widgets/user/owner/main_owner.dart';import 'package:ween_blaqe/widgets/user/owner/profile_of_owner.dart';import 'package:ween_blaqe/widgets/user/owner/show_profile_of_studnet.dart';import 'package:ween_blaqe/widgets/user/owner/refactor_apartment.dart';import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/third_step.dart';import 'package:ween_blaqe/widgets/user/studnet/booking_now.dart';import 'package:ween_blaqe/widgets/user/studnet/bookmark.dart';import 'package:ween_blaqe/widgets/user/studnet/master_home.dart';import 'package:ween_blaqe/widgets/user/studnet/notification.dart';import 'package:ween_blaqe/widgets/user/owner/orders.dart';import 'package:ween_blaqe/widgets/user/studnet/search_filter.dart';import 'package:ween_blaqe/widgets/user/studnet/main_student.dart';import '/widgets/user/owner/apartments_of_owner_after_add.dart';import '/widgets/user/owner/apartments_of_owner_before_add.dart';import '/widgets/user/owner/steps_to_create_apartment/first_step.dart';import '/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';import '/widgets/user/owner/steps_to_create_apartment/second_step.dart';import '/widgets/user/studnet/account_of_student.dart';import '/widgets/user/studnet/profile.dart';import '/widgets/user/studnet/show_more.dart';import '/widgets/widgets_before_user_reg/login.dart';import '/widgets/widgets_before_user_reg/registration.dart';import '/widgets/widgets_before_user_reg/account_before_login.dart';import '/widgets/widgets_before_user_reg/get_started.dart';import '/widgets/user/studnet/home.dart';import '/widgets/widgets_that_effect_another_widgets''/scroll_to_hide_widget.dart';import 'classes_that_effect_widgets/apartments/home_screen/bar_cities.dart';import 'classes_that_effect_widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import 'funcations/route_pages/my_pages_routes.dart';
//main screen
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Session.init();
  // await EasyLocalization.ensureInitialized();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  var token = (await prefs).get("token");

  Get.put(MainController());
Get.put(StudentController());
Get.put(OwnerController());
  runApp( OwnMaterialApp(logged: token!=null,));
}
//ownMaterialApp that could play any screen in this class from admin
class OwnMaterialApp extends StatefulWidget {
   OwnMaterialApp({Key? key,required this.logged}) : super(key: key);
  bool logged =false;

  @override
  State<OwnMaterialApp> createState() => _OwnMaterialAppState();
}


class _OwnMaterialAppState extends State<OwnMaterialApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.grey.shade200,
          switchTheme: const SwitchThemeData(),
          colorSchemeSeed: const Color(0xffff9800),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(size: 26))),
      //make screen rtl
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("ar", "SA"),
     // locale: Locale("en", "US"),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      home:   SafeArea(
        child: Main()

      ),
      // Main(),
      //The ThemeData of ween blaqe application
    );
  }
}
/*
Main Class that have 3 main item ...
one : appBar Widget (that have input to make search).
tow: Stack or IndexStack Widget (that have all screen in this app).
three: BottomNavigationBar Widget (that have 5 item ->
home ,
 notification ,
 order(that order of user or student when booking apartment  ),
  bookmark ,
   account,)
 */
class _MainState extends State<Main> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);

  }
  @override
  void dispose() {
    super.dispose();
  }
  void listener() {
    // print(controller.position.pixel);

  }
  // var index = 0;
  MainController mainController = Get.find();



  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      //onTap to hide keyboard when click outside keyboard
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child:
      Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: GetBuilder<MainController>(
          builder: (c){
            return IndexedStack(
              index:mainController.index,

              children: [
                MainStudent(),
                //for Owner
                MainOwner(),
              ],
            );
          },
        )


        //
      ),
    );
  }
}
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}







