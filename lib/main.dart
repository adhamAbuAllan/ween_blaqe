import 'dart:convert';import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';import 'package:get/get_navigation/src/root/get_material_app.dart';import 'package:http/http.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:ween_blaqe/classes_that_effect_widgets/apartments/show_more_classes_widget/show_all_advantages_class_widget.dart';import 'package:ween_blaqe/controller/main_controller.dart';import 'package:ween_blaqe/controller/owner_controller/owner_controller.dart';import 'package:ween_blaqe/controller/student_controller/student_controller.dart';import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/image_picker_apartment.dart';import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/screens_that_will_add_in_future.dart';import 'package:ween_blaqe/sesstion/new_session.dart';import 'package:ween_blaqe/skeletons/account_before_reg_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/account_skeleton_widget.dart';
import 'package:ween_blaqe/skeletons/general_skeleton_ready_widgets/paragraph_ready_skeleton.dart';import 'package:ween_blaqe/skeletons/owner_widgets/apartment_of_owner_after_add_skeleton.dart';import 'package:ween_blaqe/skeletons/owner_widgets/apartment_of_owner_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/owner_widgets/order_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/owner_widgets/refactor_apartment_skeleton.dart';import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/add_adv_skeleton_ready.dart';import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/apartment_after_add_skeleton_ready.dart';import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/container_of_input_text_widget_ready.dart';import 'package:ween_blaqe/skeletons/owner_widgets/steps_to_add_apartment/first_step_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/owner_widgets/steps_to_add_apartment/fourth_step_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/owner_widgets/steps_to_add_apartment/second_step_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/booking_now_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/bookmark_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/home_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/notification_skeleton_widget.dart';import 'package:ween_blaqe/skeletons/student_widgets/show_all_adv_skeleton_widget.dart';
import 'package:ween_blaqe/skeletons/student_widgets/show_more_skeleton_widget.dart';import 'package:ween_blaqe/splach_screen.dart';
import 'package:ween_blaqe/testing_code/insert_data_in_local_class_test/drop_down_citeis_test.dart';
import 'package:ween_blaqe/widgets/error_widgets/no_internet.dart';
import 'package:ween_blaqe/widgets/error_widgets/search_not_found.dart';import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/another_asks.dart';import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/ask_for_help.dart';
import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/for_owner/how_create_ad.dart';
import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/for_owner/the_ad_is_free_or_not.dart';import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/for_student/system_booking.dart';import 'package:ween_blaqe/widgets/paragraphs_widgets/ask_for_help_widgets/for_student/system_paying.dart';import 'package:ween_blaqe/widgets/paragraphs_widgets/privacy%20policy.dart';
import 'package:ween_blaqe/widgets/send_notice_for_us.dart';
import 'package:ween_blaqe/widgets/user/owner/account_of_owner.dart';
import 'package:ween_blaqe/widgets/user/owner/main_owner.dart';import 'package:ween_blaqe/widgets/user/owner/notification_of_owner.dart';import 'package:ween_blaqe/widgets/user/owner/profile_of_owner.dart';import 'package:ween_blaqe/widgets/user/owner/refactor_apartment.dart';import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/third_step.dart';import 'package:ween_blaqe/widgets/user/studnet/booking_now.dart';import 'package:ween_blaqe/widgets/user/studnet/bookmark.dart';
import 'package:ween_blaqe/widgets/user/studnet/home.dart';import 'package:ween_blaqe/widgets/user/studnet/master_home.dart';import 'package:ween_blaqe/widgets/user/studnet/notification.dart';import 'package:ween_blaqe/widgets/user/owner/orders.dart';import 'package:ween_blaqe/widgets/user/studnet/orders_of_student.dart';import 'package:ween_blaqe/widgets/user/studnet/search_filter.dart';import 'package:ween_blaqe/widgets/user/studnet/main_student.dart';import '/widgets/user/owner/apartments_of_owner_after_add.dart';import '/widgets/user/owner/apartments_of_owner_before_add.dart';import '/widgets/user/owner/steps_to_create_apartment/first_step.dart';import '/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';import '/widgets/user/owner/steps_to_create_apartment/second_step.dart';import '/widgets/user/studnet/account_of_student.dart';import '/widgets/user/studnet/profile.dart';import '/widgets/user/studnet/show_more.dart';import '/widgets/widgets_before_user_reg/login.dart';import '/widgets/widgets_before_user_reg/registration.dart';import '/widgets/widgets_before_user_reg/account_before_login.dart';import '/widgets/widgets_before_user_reg/get_started.dart';import 'api/apartments.dart';
import 'api/users.dart';
import 'funcations/route_pages/my_pages_routes.dart';
// late SharedPreferences sp;
//main screen
// final Future<SharedPreferences> sp = SharedPreferences.getInstance();
final Future<SharedPreferences> sp = SharedPreferences.getInstance();

void main()async
{
  print("Starting");
  WidgetsFlutterBinding.ensureInitialized();
  await NewSession.init();
  // await EasyLocalization.ensureInitialized();
  // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  var token = (await sp).get("token");
Get.put(StudentController());
Get.put(OwnerController());
Get.put(MainController());
  runApp( OwnMaterialApp(logged: token!=null,));
}

// Future<void>loaResources(bool reload)async{
//   await Get.find<Apartment>().title;
// }
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
      debugShowCheckedModeBanner: false,
darkTheme: ThemeData(
  // brightness: Brightness.dark
),

      // themeMode: ThemeMode.system,

      theme: ThemeData(
          // brightness: Brightness.,

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

// home: (),

   initialRoute: MyPagesRoutes.splashScreen,
      routes: {
        MyPagesRoutes.main:(context)=> const Main(),
        MyPagesRoutes.mainOwner:(context)=>MainOwner(),
        MyPagesRoutes.mainStudent:(context)=>MainStudent(),
        MyPagesRoutes.step1:(context)=>FirstStep(),
        MyPagesRoutes.step2:(context)=>const SecondStep(),
        MyPagesRoutes.step3:(context)=>const ThirdStep(),
        MyPagesRoutes.step4:(context)=>const FourthStep(),
        MyPagesRoutes.login:(context)=>const Login(),
        MyPagesRoutes.register:(context)=>Register(),
        MyPagesRoutes.masterHome:(context)=>const MasterHome(),
        MyPagesRoutes.showMore:(context)=> ShowMore(),
        MyPagesRoutes.accountBeforeLoginInStudent:(context)=>const AccountBeforeLoginInStudent(),
        MyPagesRoutes.accountBeforeLoginInOwner:(context)=>const AccountBeforeLoginInOwner(),
        MyPagesRoutes.accountOfStudent:(context)=>AccountOfStudent(),
        MyPagesRoutes.accountOfOwner:(context)=>AccountOfOwner(),
        MyPagesRoutes.bookingNow:(context)=>const BookingNow(),
        MyPagesRoutes.getStarted:(context)=>const GetStarted(),
        MyPagesRoutes.searchFilter:(context)=>const SearchFilter(),
        MyPagesRoutes.profile:(context)=>const Profile(),
        MyPagesRoutes.ordersOfStudent:(context)=>const OrdersOfStudent(),
        MyPagesRoutes.bookmark:(context)=> Bookmark(),
        MyPagesRoutes.orders:(context)=>const Orders(),
        MyPagesRoutes.notificationOfStudent:(context)=>const NotificationOfStudentWithNotifi(),
        MyPagesRoutes.notificationOfOwner:(context)=>const NotificationOfOwner(),
        MyPagesRoutes.apartmentOfOwnerAfterAdd:(context)=>const ApartmentsOfOwnerAfterAdd(),
        MyPagesRoutes.apartmentOfOwnerBeforeAdd:(context)=>const ApartmentOfOwnerBeforeAdd(),
        MyPagesRoutes.splashScreen:(context)=>SplashScreen(),
        MyPagesRoutes.refactorApartment:(context)=>const RefactorApartment(),
        MyPagesRoutes.privacyPolicy:(context)=>const PrivacyPolicy(),
        MyPagesRoutes.askForHelp:(context)=>AskForHelp(),
        MyPagesRoutes.systemPaying:(context)=>const SystemPaying(),
        MyPagesRoutes.whatIsSystemPayingAllow:(context)=>const WhatIsSystemPayingAllow(),
        MyPagesRoutes.couldIPayByDeposit:(context)=>const CouldIPayByDeposit(),
        MyPagesRoutes.whatIsMeanSS:(context)=>const WhatIsMeanSS(),
        MyPagesRoutes.howCouldBookingApartment:(context)=>const HowCouldBookingApartment(),
        MyPagesRoutes.systemBooking:(context)=>const SystemBooking(),
        MyPagesRoutes.couldICancelABooking:(context)=>const CouldICancelABooking(),
        MyPagesRoutes.howLongIsTheReservationAvailable:(context)=>const HowLongIsTheReservationAvailable(),
        MyPagesRoutes.howCreateAd:(context)=>const HowCreateAd(),
        MyPagesRoutes.couldBeOwnerAndStudentInOneTime:(context)=>const CouldBeOwnerAndStudentInOneTime(),
        MyPagesRoutes.sendNoticeForUs:(context)=> SendNoticeForUs(),
        MyPagesRoutes.theAdIsFreeOrNot:(context)=>const TheAdIsFreeOrNot(),
        MyPagesRoutes.skeletonShowMoreWidget:(context)=>const SkeletonShowMoreWidget(),
        MyPagesRoutes.screensWillAddFuture:(context)=>const ScreensWillAddFuture(),
        MyPagesRoutes.noInternet:(context)=>const NoInternet(),
        MyPagesRoutes.searchNotFound:(context)=>const SearchNotFound(),
        MyPagesRoutes.skeletonBookingNow:(context)=>const BookingNowSkeletonWidget(),
        MyPagesRoutes.skeletonParagraph:(context)=>const LongParagraphReadySkeleton(),

        //testing routes..
        // MyPagesRoutes.citiesTest:(context)=> CitiesTest(),
        // MyPagesRoutes.showAllAdvantages:(context)=>ShowAllAdvantages,
      },
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

    // initializtion();

  }
  void initializtion() async{
    await Future.delayed( const Duration(seconds: 3));

    myPushNameAndRemoveUntil(context,MyPagesRoutes.main,(route) => route.settings.name == MyPagesRoutes.main,MyPagesRoutes.main);
  }
  @override
  void dispose() {
    super.dispose();
  }
  void listener() {
    // \(controller.position.pixel);

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
      ColorfulSafeArea(
        color: Colors.orange,
        child: Scaffold(
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
      ),
    );
  }

}
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}





