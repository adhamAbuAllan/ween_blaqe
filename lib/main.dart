/*
مطور تطبيقات الموبايل ، ومن أفضل مصممي واجهات الاستخدام على مستوى فلسطين و الضفة الغربية ، مصمم و مبرمج افضل تطبيق لحجز السكانات في فلسطين
 */
/*
سؤال : كيف اقوم تحديث التطبيق و إرسال ملف جديد لقوقل كونسل؟
الجواب تحت:
من ملف الpubspec زود رقم الversion اخر رقم
زوده رقم هو غالبا 2 خليه 3 مثلا واعمل
flutter clean واعمل بيلد تاني وارفعه وكل ما تيجي ترفع تحديث
 لازم تعمل نفس العملية
 //
 owner -> 1. update apartment , 2. remove the profile image...isDone ,
 3.solve UI response and adaptive , 4.make the advantages to show instade of
 apartment of id = 1 , 5. add the cities bar. 6.check the phone number that
 is currect or Not , that from Whatsapp api...isDone , 7. make the user could to
 change the passwrod if he is foregt it. 8. update the app that could to run
 it on 34 sdk or lower.
 */
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/controller/function_controller/api_functions_controller/get_advatages_api.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';
import 'package:ween_blaqe/controller/function_controller/intro_controller.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/main_controller.dart';
import 'package:flutter/services.dart';
import 'package:ween_blaqe/controller/models_controller/advantages_model_controller.dart';
import 'package:ween_blaqe/controller/models_controller/city_model_controller.dart';

// import 'package:ween_blaqe/controller/owner_controller/owner_controller.dart';
import 'package:ween_blaqe/controller/student_controller/student_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/skeletons/general_skeleton_ready_widgets/paragraph_ready_skeleton.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/show_more_skeleton_widget.dart';
import 'package:ween_blaqe/features/bookmark.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/another_asks.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/ask_for_help.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_owner/how_create_ad.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_owner/the_ad_is_free_or_not.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_owner/what_the_info_req_to_cerate_ad.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_student/system_booking.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/ask_for_help_widgets/for_student/system_paying.dart';
import 'package:ween_blaqe/features/paragraphs_widgets/privacy_policy.dart';
import 'package:ween_blaqe/features/user/owner/apartment_of_owner.dart';
import 'package:ween_blaqe/features/user/owner/profile_of_owner.dart';

import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_show_more.dart';
import 'package:ween_blaqe/features/user/studnet/main_student.dart';

import 'package:ween_blaqe/sesstion/new_session.dart';
import 'package:ween_blaqe/features/splach_screen.dart';
import 'package:ween_blaqe/features/user/owner/update_data_of_user.dart';

// import 'package:ween_blaqe/testing_code/bookmark_test.dart';
import 'constants/get_it_controller.dart';
import 'constants/nums.dart';
import 'constants/strings.dart';
import 'controller/bookmark_controller.dart';
import 'controller/change_password_controller.dart';
import 'controller/function_controller/api_functions_controller/cities_and_types_controller.dart';
import 'controller/function_controller/api_functions_controller/apartment_api_methods_controller.dart';
import 'controller/function_controller/connectivity_controller.dart';
import 'controller/image_of_apartment_controller.dart';
import 'controller/models_controller/apartment_model_controller.dart';
import 'controller/models_controller/images_model_controller.dart';
import 'controller/models_controller/type_of_apartment_models_controller.dart';

// import 'features/bookmark.dart';
import 'controller/scroll_controller.dart';
import 'features/intro_screen.dart';
import 'features/send_notice_for_us.dart';
import 'features/user/owner/refactor_apartment.dart';
import 'features/user/owner/steps_to_create_apartment/first_step.dart';
import 'features/user/owner/steps_to_create_apartment/fourth_step.dart';
import 'features/user/owner/steps_to_create_apartment/second_step.dart';
import 'features/user/owner/steps_to_create_apartment/third_step.dart';
import 'features/widgets_before_user_reg/login.dart';
import 'features/widgets_before_user_reg/registration.dart';

/*
**كيف ممكن ننشئ مشاريع في الفريق تاعنا و الكل يوخذ حقه**
لما بدنا نقترح فكرة على بعض رح نوجه
 مشكلة وهي انه الكل بده فكرته تتطبيق ،a
 ففي هذا الحالة مش الكل رح يوخذ حقه ، بطرح
 افكاره ، طيب كيف ممكن نحل هاي المشكلة
 ، انا بقترح انه نطبق الافكار بالادوار ،
  والمقصد انه كل واحد فينا إله دور في
 طرح فكرته ، فبعد ما نتم الموافقة على فكرته
  كتصويت نبلش نشتغل عليها ، وفي حال
 ما وافقنا على فكرته ، نطلب منه يجيب
  فكرة ثانية. بعد ما نشتغل على فكرته الشخص
 ، بنبدأ في مشروع ثاني من فكرة شخص آخر.
  في هاي الحالة بنتجنب الكثير من المشاكل
*/
// late SharedPreferences sp;
//main screen
// final Future<SharedPreferences> sp = SharedPreferences.getInstance();
//the line that could user to upload a file currently :
//https://drive.google.com/uc?export=download&id=
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
  await SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]);
  // await EasyLocalization.ensureInitialized();
  // final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  // var token = (await sp).get("token");
  //for put
  Get.put(StudentController());
  Get.put(ControllerScroll());
  Get.put(IntroController());
  Get.put(CityModelController());
  Get.put(ApartmentModelController());
  Get.put(MethodsApiApartmentController());
  Get.put(ChangeThemeMode());
  Get.put(ConnectivityController());
  // Get.put(OwnerController());
  Get.put(ReadyCityAndApartmentTypeApi());
  Get.put(TypeOfApartmentModelsController());
  Get.put(MainController());
  Get.put(GetAdvantages());
  Get.put(AdvantagesModelController());
  Get.put(ImagesModelController());
  Get.put(ImageOfApartmentController());
  Get.put(ShowDetailOfImageOfApartmentController());
  Get.put(ChangePasswordController());
  Get.put(BookmarkController()); //for testing
  // Get.put(BookmarkApartment());//for testing
  //for get
  await configureInjection();
  runApp(const OwnMaterialApp(
  // logged: token != null,
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
  const OwnMaterialApp({
    super.key,
    // required this.logged
  });

  // final bool logged = false;

  @override
  State<OwnMaterialApp> createState() => _OwnMaterialAppState();
}

class _OwnMaterialAppState extends State<OwnMaterialApp> {
  String newestApartmentId = '-1';

  @override
  void initState() {
    super.initState();
  }

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
        MyPagesRoutes.step1: (context) => const FirstStep(),
        MyPagesRoutes.step2: (context) => const SecondStep(),
        MyPagesRoutes.step3: (context) => const ThirdStep(),
        MyPagesRoutes.step4: (context) =>
            FourthStep(
              oneApartmentId: apartmentModelController.apartment.data?.first,
            ),
        MyPagesRoutes.login: (context) => const Login(),
        MyPagesRoutes.register: (context) => const Register(),
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
        MyPagesRoutes.profileOfOwner: (context) => const ProfileOfOwner(),
        // MyPagesRoutes.ordersOfStudent: (context) => const OrdersOfStudent(),
        MyPagesRoutes.bookmarkApartment: (context) => const BookmarkApartment(),
        // MyPagesRoutes.orders: (context) => const Orders(),
        // MyPagesRoutes.notificationOfStudent: (context) =>
        //     const NotificationOfStudentWithNotifi(),
        // MyPagesRoutes.notificationOfOwner: (context) =>
        //     const NotificationOfOwner(),
        // MyPagesRoutes.apartmentOfOwnerAfterAdd: (context) =>
        //     const ApartmentsOfOwnerAfterAdd(),
        // MyPagesRoutes.apartmentOfOwnerBeforeAdd: (context) =>
        //     const ApartmentOfOwnerBeforeAdd(),
        MyPagesRoutes.apartmentsOwner: (context) => const ApartmentsOwner(),

        MyPagesRoutes.splashScreen: (context) => const SplashScreen(),
        MyPagesRoutes.refactorApartment: (context) => const RefactorApartment(),
        MyPagesRoutes.privacyPolicy: (context) => PrivacyPolicy(),
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
        MyPagesRoutes.newShowMore: (context) => const NewShowMore(),
        MyPagesRoutes.whatTheInfoReqToCreateAd: (context) =>
        const WhatTheInfoReqToCreateAd(),
        MyPagesRoutes.introScreen: (context) => const IntroScreen(),
        MyPagesRoutes.updateUserInfo: (context) => const UpdateUserData(),

        //testing routes..
        // MyPagesRoutes.citiesTest:(context)=> CitiesTest(),
        // MyPagesRoutes.showAllAdvantages:(context)=>ShowAllAdvantages,
      },

      // Main(),
      //The ThemeData of ween blaqe application
    );
  }

  void putValue(String value) async {
    newestApartmentId = value;
    debugPrint(value);
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
  final Future<void> Function(BuildContext, String)? navigatorOfMainClass;

  const Main({
    super.key,
    this.navigatorOfMainClass,
  });

  // myPushName(context, MyPagesRoutes.showMore);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // introController.saveIsFirstTime();
    controller.addListener(listener);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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
        bottomColor: Colors.transparent,
        color:
        themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
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
