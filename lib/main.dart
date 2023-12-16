import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/controller/main_controller.dart';
import 'package:ween_blaqe/controller/owner_controller/owner_controller.dart';
import 'package:ween_blaqe/controller/student_controller/student_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/skeletons/general_skeleton_ready_widgets/paragraph_ready_skeleton.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/show_more_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/another_asks.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/ask_for_help.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_owner/how_create_ad.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_owner/the_ad_is_free_or_not.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_student/system_booking.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_student/system_paying.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/privacy_policy.dart';

import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_show_more.dart';
import 'package:ween_blaqe/features/user/studnet/main_student.dart';

import 'package:ween_blaqe/sesstion/new_session.dart';
import 'package:ween_blaqe/features/splach_screen.dart';
import 'constants/nums.dart';
import 'constants/strings.dart';
import 'features/send_notice_for_us.dart';

// late SharedPreferences sp;
//main screen
// final Future<SharedPreferences> sp = SharedPreferences.getInstance();
final Future<SharedPreferences> sp = SharedPreferences.getInstance();

void main() async {
  //firebase initaize code
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseApp defaultApp = Firebase.app();
  // final storageRef = FirebaseStorage.instance.ref();

  debugPrint("Starting");
  WidgetsFlutterBinding.ensureInitialized();
  await NewSession.init();
  // await EasyLocalization.ensureInitialized();
  // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  var token = (await sp).get("token");
  Get.put(StudentController());
  Get.put(OwnerController());
  Get.put(MainController());
  runApp(OwnMaterialApp(
    logged: token != null,
  ));
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
}

// Future<void>loaResources(bool reload)async{
//   await Get.find<Apartment>().title;
// }
//ownMaterialApp that could play any screen in this class from admin
class OwnMaterialApp extends StatefulWidget {
  OwnMaterialApp({Key? key, required this.logged}) : super(key: key);
  bool logged = false;

  @override
  State<OwnMaterialApp> createState() => _OwnMaterialAppState();
}

class _OwnMaterialAppState extends State<OwnMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData(

        useMaterial3: false,


        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),


        // brightness: Brightness.darkf
          ),

      // themeMode: ThemeMode.system,

      theme: ThemeData(
        useMaterial3: false,
          fontFamily: 'IBM',

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
      //  initialRoute: MyPagesRoutes.newMasterHome,
      routes: {
        MyPagesRoutes.main: (context) => const Main(),
        // MyPagesRoutes.mainOwner: (context) => const MainOwner(),
        MyPagesRoutes.mainStudent: (context) => const MainStudent(),
        // MyPagesRoutes.step1: (context) => const FirstStep(),
        // MyPagesRoutes.step2: (context) => const SecondStep(),
        // MyPagesRoutes.step3: (context) => const ThirdStep(),
        // MyPagesRoutes.step4: (context) => const FourthStep(),
        // MyPagesRoutes.login: (context) => const Login(),
        // MyPagesRoutes.register: (context) => const Register(),
        // MyPagesRoutes.masterHome: (context) => const MasterHome(),
        // MyPagesRoutes.showMore: (context) => const ShowMore(),
        // MyPagesRoutes.accountBeforeLoginInStudent: (context) =>
        //     const AccountBeforeLoginInStudent(),
        // MyPagesRoutes.accountBeforeLoginInOwner: (context) =>
        //     const AccountBeforeLoginInOwner(),
        // MyPagesRoutes.accountOfStudent: (context) => const AccountOfStudent(),
        // MyPagesRoutes.accountOfOwner: (context) => const AccountOfOwner(),
        // MyPagesRoutes.bookingNow: (context) => const BookingNow(),
        // MyPagesRoutes.getStarted: (context) => const GetStarted(),
        // MyPagesRoutes.searchFilter: (context) => const SearchFilter(),
        // MyPagesRoutes.profile: (context) => const Profile(),
        // MyPagesRoutes.ordersOfStudent: (context) => const OrdersOfStudent(),
        // MyPagesRoutes.bookmark: (context) => const Bookmark(),
        // MyPagesRoutes.orders: (context) => const Orders(),
        // MyPagesRoutes.notificationOfStudent: (context) =>
        //     const NotificationOfStudentWithNotifi(),
        // MyPagesRoutes.notificationOfOwner: (context) =>
        //     const NotificationOfOwner(),
        // MyPagesRoutes.apartmentOfOwnerAfterAdd: (context) =>
        //     const ApartmentsOfOwnerAfterAdd(),
        // MyPagesRoutes.apartmentOfOwnerBeforeAdd: (context) =>
        //     const ApartmentOfOwnerBeforeAdd(),
        MyPagesRoutes.splashScreen: (context) => const SplashScreen(),
        // MyPagesRoutes.refactorApartment: (context) => const RefactorApartment(),
        MyPagesRoutes.privacyPolicy: (context) => const PrivacyPolicy(),
        MyPagesRoutes.askForHelp: (context) => const AskForHelp(),
        MyPagesRoutes.systemPaying: (context) => const SystemPaying(),
        MyPagesRoutes.whatIsSystemPayingAllow: (context) =>
            const WhatIsSystemPayingAllow(),
        MyPagesRoutes.couldIPayByDeposit: (context) =>
            const CouldIPayByDeposit(),
        MyPagesRoutes.whatIsMeanSS: (context) => const WhatIsMeanSS(),
        MyPagesRoutes.howCouldBookingApartment: (context) =>
            const HowCouldBookingApartment(),
        MyPagesRoutes.systemBooking: (context) => const SystemBooking(),
        MyPagesRoutes.couldICancelABooking: (context) =>
            const CouldICancelABooking(),
        MyPagesRoutes.howLongIsTheReservationAvailable: (context) =>
            const HowLongIsTheReservationAvailable(),
        MyPagesRoutes.howCreateAd: (context) => const HowCreateAd(),
        // MyPagesRoutes.couldBeOwnerAndStudentInOneTime: (context) =>
        //     const CouldBeOwnerAndStudentInOneTime(),
        MyPagesRoutes.sendNoticeForUs: (context) => const SendNoticeForUs(),
        MyPagesRoutes.theAdIsFreeOrNot: (context) => const TheAdIsFreeOrNot(),
        MyPagesRoutes.skeletonShowMoreWidget: (context) =>
            const SkeletonShowMoreWidget(),
        // MyPagesRoutes.screensWillAddFuture: (context) =>
        //     const ScreensWillAddFuture(),
        MyPagesRoutes.noInternet: (context) => const NoInternet(),
        // MyPagesRoutes.searchNotFound: (context) => const SearchNotFound(),
        // MyPagesRoutes.skeletonBookingNow: (context) =>
        //     const BookingNowSkeletonWidget(),
        MyPagesRoutes.skeletonParagraph: (context) =>
            const LongParagraphReadySkeleton(),
        MyPagesRoutes.newMasterHome: (context) => const NewMasterHome(),
        MyPagesRoutes.newShowMore: (context) =>  NewShowMore(),

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
class Main extends StatefulWidget {
  final Future<void> Function(BuildContext, String) ? navigatorOfMainClass;
  const Main({ Key? key,  this.navigatorOfMainClass,}) : super(key: key);
  // myPushName(context, MyPagesRoutes.showMore);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);

    // initializtion();
  }

  void initializtion() async {
    await Future.delayed(const Duration(seconds: 3));
    pushAndremoveUntilToMainWthSettings();
  }

  void pushAndremoveUntilToMainWthSettings() {
    myPushNameAndRemoveUntil(
        context,
        MyPagesRoutes.main,
        (route) => route.settings.name == MyPagesRoutes.main,
        MyPagesRoutes.main);
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
      child: ColorfulSafeArea(
        // bottom: false,
        // top
        bottomColor: Colors.transparent ,
        color: kPrimaryColor,
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: GetBuilder<MainController>(
              builder: (c) {
                return IndexedStack(
                  index: mainController.index,
                  children: const [
                    MainStudent(),

                    //for Owner
                    // MainOwner(),
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
