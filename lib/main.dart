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
 owner -> 1. update apartment...isDone , 2. remove the profile image...isDone ,
 3.solve UI response and adaptive , 4.make the advantages to show instade of
 apartment of id = 1...isDone , 5. add the cities bar...isDone
  6.check the phone number that is currect or Not ,
   that from Whatsapp api...isDone , 7. make the user could to
 change the passwrod if he is foregt it. 8. update the app that could to run
 it on 34 sdk or lower...isDone
 */
//مصطلح التفكير التصميمي

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';
import 'package:flutter/services.dart';

// import 'package:ween_blaqe/controller/owner_controller/owner_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/apartments_of_owner_ui.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/first_step_ui.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/fourth_step_ui.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/second_step_ui.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/third_step_ui.dart';
import 'package:ween_blaqe/view/apartment/home_ui.dart';
import 'package:ween_blaqe/view/authorization_ui/login_ui.dart';
import 'package:ween_blaqe/view/authorization_ui/registration_ui.dart';
import 'package:ween_blaqe/view/common_widgets/skeleton_widgets/ask_to_help_skeleton_widgets/skeleton_long_paragraph_ready_ui.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/another_asks_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/ask_for_help_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_owner/how_create_ad_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_owner/what_the_info_req_to_cerate_ad_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_student/system_booking_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_student/system_paying_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/privacy_policy_ui.dart';
import 'package:ween_blaqe/view/user/owner/profile_ui.dart';

import 'package:ween_blaqe/view/splach_screen_ui.dart';
import 'package:ween_blaqe/view/user/owner/update_data_of_user_ui.dart';
import 'package:ween_blaqe/session/new_session.dart';

// import 'package:ween_blaqe/testing_code/bookmark_test.dart';
import 'constants/get_it_controller.dart';
import 'constants/localization.dart';
import 'constants/strings.dart';
import 'controller/function_controller/connectivity_controller.dart';

// import 'view/bookmark.dart';
import 'controller/provider_controllers/methods/local_methods/language_notifier.dart';
import 'view/apartment/apartment_of_owner/update_apartment_ui.dart';
import 'view/apartment/bookmark_ui.dart';
import 'view/apartment/show_deitals_of_apartment/show_deitals_of_apartment_ui.dart';
import 'view/intro_screen.dart';
import 'view/main_ui.dart';
import 'view/send_notice_for_us_ui.dart';

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
/*
في فبالي فكرة ، لما المستخدم ما يسوي تحديث للتطبيق ، يظهر له زي شعبابون على
زوايا التطبيق ، ولما يضغط عليها ، بتجيه رسالة ، انه التطبيق ما تحدث ، و
الإصدار الحالي إصدار قديم ، حتى منظهر الرسالة ، بكون فيها صورة و بيشرح
للمستخدم أنه تطبيقك صار قديم
 */
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
  Get.put(ChangeThemeMode());
  Get.put(ConnectivityController());
  // Get.put(OwnerController());

  // Get.put(BookmarkApartment());//for testing
  //for get
  // String savedLanguage = Get.put(LanguageController()).getSavedLanguage();
  //
  // // Set the initial locale
  // Locale initialLocale;
  // if (savedLanguage == 'ar') {
  //   initialLocale = const Locale('ar', 'JO');
  // } else {
  //   initialLocale = const Locale('en', 'US');
  // }

  await configureInjection();
  runApp(ProviderScope(
    overrides: [
      languageProvider.overrideWith(
        (ref) => LanguageNotifier(initialLocale),
      )
    ],
    child: const OwnMaterialAppConsumer(),
  ));
}

final savedLanguage = NewSession.get('language', 'ar');
final initialLocale = (savedLanguage == 'ar')
    ? const Locale('ar', 'JO')
    : const Locale('en', 'US');
final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
  (ref) => LanguageNotifier(initialLocale),
);

class OwnMaterialAppConsumer extends ConsumerStatefulWidget {
  const OwnMaterialAppConsumer({super.key});

  @override
  ConsumerState createState() => _OwnMaterialAppConsumerState();
}

class _OwnMaterialAppConsumerState
    extends ConsumerState<OwnMaterialAppConsumer> {
  @override
  void initState() {
    super.initState();
    NewSession.save("isFirstTime", "OK");
  }
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(languageProvider);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        useMaterial3: false,
        fontFamily: 'IBM',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
      ),
      theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'IBM',
          switchTheme: const SwitchThemeData(),
          colorSchemeSeed: const Color(0xffff9800),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(size: 26))),
      localizationsDelegates: const [
        SetLocalization.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [ 
        Locale('en', 'US'),
        Locale('ar', 'JO'),
      ],
      initialRoute: MyPagesRoutes.splashScreen,
      //  initialRoute: MyPagesRoutes.newMasterHome,
      routes: {
        MyPagesRoutes.main: (context) => const Main(),
        // MyPagesRoutes.mainOwner: (context) => const MainOwner(),
        MyPagesRoutes.mainUi: (context) => const MainUi(),
        MyPagesRoutes.step1: (context) => const FirstStepUi(),
        MyPagesRoutes.step2: (context) => const SecondStepUi(),
        MyPagesRoutes.step3: (context) => const ThirdStepUi(),
        MyPagesRoutes.step4: (context) => const FourthStepUi(),
        MyPagesRoutes.login: (context) => const LoginUi(),
        MyPagesRoutes.register: (context) => const RegistrationUi(),
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
        MyPagesRoutes.profileOfOwner: (context) => const ProfileUi(),
        // MyPagesRoutes.ordersOfStudent: (context) => const OrdersOfStudent(),
        MyPagesRoutes.bookmarkUi: (context) => const BookmarkApartmentUi(),
        // MyPagesRoutes.orders: (context) => const Orders(),
        // MyPagesRoutes.notificationOfStudent: (context) =>
        //     const NotificationOfStudentWithNotifi(),
        // MyPagesRoutes.notificationOfOwner: (context) =>
        //     const NotificationOfOwner(),
        // MyPagesRoutes.apartmentOfOwnerAfterAdd: (context) =>
        //     const ApartmentsOfOwnerAfterAdd(),
        // MyPagesRoutes.apartmentOfOwnerBeforeAdd: (context) =>
        //     const ApartmentOfOwnerBeforeAdd(),
        MyPagesRoutes.apartmentsOwner: (context) => const ApartmentsOfOwnerUi(),

        MyPagesRoutes.splashScreen: (context) => const SplashScreenUi(),
        MyPagesRoutes.updateApartment: (context) => const UpdateApartmentUi(),
        MyPagesRoutes.privacyPolicy: (context) => const PrivacyPolicyUi(),
        MyPagesRoutes.askForHelp: (context) => const AskForHelpUi(),
        MyPagesRoutes.systemPaying: (context) => const SystemPayingUi(),
        MyPagesRoutes.whatIsSystemPayingAllow: (context) =>
            const WhatIsSystemPayingAllowUi(),
        MyPagesRoutes.couldIPayByDeposit: (context) =>
            const CouldIPayByDepositUi(),
        MyPagesRoutes.whatIsMeanSS: (context) => const WhatIsMeanSSUi(),
        MyPagesRoutes.howCouldBookingApartment: (context) =>
            const HowCouldBookingApartmentUi(),
        MyPagesRoutes.systemBooking: (context) => const SystemBookingUi(),
        MyPagesRoutes.couldICancelABooking: (context) =>
            const CouldICancelABookingUi(),
        MyPagesRoutes.howLongIsTheReservationAvailable: (context) =>
            const HowLongIsTheReservationAvailableUi(),
        MyPagesRoutes.howCreateAd: (context) => const HowCreateAdUi(),
        // MyPagesRoutes.couldBeOwnerAndStudentInOneTime: (context) =>
        //     const CouldBeOwnerAndStudentInOneTime(),
        MyPagesRoutes.sendNoticeForUs: (context) => const SendNoticeForUsUi(),
        // MyPagesRoutes.theAdIsFreeOrNot: (context) => const TheAdIsFreeOrNot(),

        // MyPagesRoutes.screensWillAddFuture: (context) =>
        //     const ScreensWillAddFuture(),
        MyPagesRoutes.noInternet: (context) => const NoInternetUi(),
        // MyPagesRoutes.searchNotFound: (context) => const SearchNotFound(),
        // MyPagesRoutes.skeletonBookingNow: (context) =>
        //     const BookingNowSkeletonWidget(),
        MyPagesRoutes.skeletonParagraph: (context) =>
            const LongParagraphReadySkeletonUi(),
        MyPagesRoutes.homeUi: (context) => const HomeUi(),
        MyPagesRoutes.showDeitalsOfApartmentUi: (context) =>
            const ShowDeitalsOfApartmentUi(),
        MyPagesRoutes.whatTheInfoReqToCreateAd: (context) =>
            const WhatTheInfoReqToCreateAdUi(),
        MyPagesRoutes.introScreen: (context) => const IntroScreenUi(),
        MyPagesRoutes.updateUserInfo: (context) => const UpdateUserDataUi(),

        //testing routes..
        // MyPagesRoutes.citiesTest:(context)=> CitiesTest(),
        // MyPagesRoutes.showAllAdvantages:(context)=>ShowAllAdvantages,
      },

      // Main(),
      //The ThemeData of ween blaqe application
    );
  }
}

// class OwnMaterialApp extends StatefulWidget {
//
//   const OwnMaterialApp({
//     super.key,
//     // required this.logged
//   });
//
//   static void setLocale(BuildContext context, Locale locale) {
//     _OwnMaterialAppState? state =
//         context.findAncestorStateOfType<_OwnMaterialAppState>();
//     state!.setLocale(locale);
//   }
//
//   // final bool logged = false;
//
//   @override
//   State<OwnMaterialApp> createState() => _OwnMaterialAppState();
// }

// class _OwnMaterialAppState extends State<OwnMaterialApp> {
//   Locale? _local = NewSession.get("isFirstTime", "") != "OK"
//       ? const Locale("ar", "JO")
//       : null;
//
//   void setLocale(Locale locale) {
//     setState(() {
//       _local = locale;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// here should put this :  final isLightMode = ref.watch(themeModeProvider);
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       darkTheme: ThemeData(
//         useMaterial3: false,
//         fontFamily: 'IBM',
//         colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
//
//         // brightness: Brightness.darkf
//       ),
//
//       // themeMode: ThemeMode.system,
//
//       theme: ThemeData(
//           useMaterial3: false,
//           fontFamily: 'IBM',
//           // brightness: Brightness.,
//
//           // scaffoldBackgroundColor: Colors.grey.shade200,
//           switchTheme: const SwitchThemeData(),
//           colorSchemeSeed: const Color(0xffff9800),
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//               selectedIconTheme: IconThemeData(size: 26))),
//       //make screen rtl
//       localizationsDelegates: const [
//         SetLocalization.localizationsDelegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('ar'), // Arabic
//         Locale('en'), // English
//       ],
//
//       locale: _local,
//
//       initialRoute: MyPagesRoutes.splashScreen,
//       //  initialRoute: MyPagesRoutes.newMasterHome,
//       routes: {
//         MyPagesRoutes.main: (context) => const Main(),
//         // MyPagesRoutes.mainOwner: (context) => const MainOwner(),
//         MyPagesRoutes.mainUi: (context) => const MainUi(),
//         MyPagesRoutes.step1: (context) => const FirstStepUi(),
//         MyPagesRoutes.step2: (context) => const SecondStepUi(),
//         MyPagesRoutes.step3: (context) => const ThirdStepUi(),
//         MyPagesRoutes.step4: (context) => const FourthStepUi(),
//         MyPagesRoutes.login: (context) => const LoginUi(),
//         MyPagesRoutes.register: (context) => const RegistrationUi(),
//         // MyPagesRoutes.masterHome: (context) => const MasterHome(),
//         // MyPagesRoutes.showMore: (context) => const ShowMore(),
//         // MyPagesRoutes.accountBeforeLoginInStudent: (context) =>
//         //     const AccountBeforeLoginInStudent(),
//         // MyPagesRoutes.accountBeforeLoginInOwner: (context) =>
//         //     const AccountBeforeLoginInOwner(),
//         // MyPagesRoutes.accountOfStudent: (context) => const AccountOfStudent(),
//         // MyPagesRoutes.accountOfOwner: (context) => const AccountOfOwner(),
//         // MyPagesRoutes.bookingNow: (context) => const BookingNow(),
//         // MyPagesRoutes.getStarted: (context) => const GetStarted(),
//         // MyPagesRoutes.searchFilter: (context) => const SearchFilter(),
//         MyPagesRoutes.profileOfOwner: (context) => const ProfileUi(),
//         // MyPagesRoutes.ordersOfStudent: (context) => const OrdersOfStudent(),
//         MyPagesRoutes.bookmarkUi: (context) => const BookmarkApartmentUi(),
//         // MyPagesRoutes.orders: (context) => const Orders(),
//         // MyPagesRoutes.notificationOfStudent: (context) =>
//         //     const NotificationOfStudentWithNotifi(),
//         // MyPagesRoutes.notificationOfOwner: (context) =>
//         //     const NotificationOfOwner(),
//         // MyPagesRoutes.apartmentOfOwnerAfterAdd: (context) =>
//         //     const ApartmentsOfOwnerAfterAdd(),
//         // MyPagesRoutes.apartmentOfOwnerBeforeAdd: (context) =>
//         //     const ApartmentOfOwnerBeforeAdd(),
//         MyPagesRoutes.apartmentsOwner: (context) => const ApartmentsOfOwnerUi(),
//
//         MyPagesRoutes.splashScreen: (context) => const SplashScreen(),
//         MyPagesRoutes.updateApartment: (context) => const UpdateApartmentUi(),
//         MyPagesRoutes.privacyPolicy: (context) => const PrivacyPolicy(),
//         MyPagesRoutes.askForHelp: (context) => const AskForHelp(),
//         MyPagesRoutes.systemPaying: (context) => const SystemPaying(),
//         MyPagesRoutes.whatIsSystemPayingAllow: (context) =>
//             const WhatIsSystemPayingAllow(),
//         MyPagesRoutes.couldIPayByDeposit: (context) =>
//             const CouldIPayByDeposit(),
//         MyPagesRoutes.whatIsMeanSS: (context) => const WhatIsMeanSS(),
//         MyPagesRoutes.howCouldBookingApartment: (context) =>
//             const HowCouldBookingApartment(),
//         MyPagesRoutes.systemBooking: (context) => const SystemBooking(),
//         MyPagesRoutes.couldICancelABooking: (context) =>
//             const CouldICancelABooking(),
//         MyPagesRoutes.howLongIsTheReservationAvailable: (context) =>
//             const HowLongIsTheReservationAvailable(),
//         MyPagesRoutes.howCreateAd: (context) => const HowCreateAd(),
//         // MyPagesRoutes.couldBeOwnerAndStudentInOneTime: (context) =>
//         //     const CouldBeOwnerAndStudentInOneTime(),
//         MyPagesRoutes.sendNoticeForUs: (context) => const SendNoticeForUs(),
//         MyPagesRoutes.theAdIsFreeOrNot: (context) => const TheAdIsFreeOrNot(),
//         MyPagesRoutes.skeletonShowMoreWidget: (context) =>
//             const SkeletonShowMoreWidget(),
//         // MyPagesRoutes.screensWillAddFuture: (context) =>
//         //     const ScreensWillAddFuture(),
//         MyPagesRoutes.noInternet: (context) => const NoInternet(),
//         // MyPagesRoutes.searchNotFound: (context) => const SearchNotFound(),
//         // MyPagesRoutes.skeletonBookingNow: (context) =>
//         //     const BookingNowSkeletonWidget(),
//         MyPagesRoutes.skeletonParagraph: (context) =>
//             const LongParagraphReadySkeleton(),
//         MyPagesRoutes.homeUi: (context) => const HomeUi(),
//         MyPagesRoutes.showDeitalsOfApartmentUi: (context) =>
//             const ShowDeitalsOfApartmentUi(),
//         MyPagesRoutes.whatTheInfoReqToCreateAd: (context) =>
//             const WhatTheInfoReqToCreateAd(),
//         MyPagesRoutes.introScreen: (context) => const IntroScreen(),
//         MyPagesRoutes.updateUserInfo: (context) => const UpdateUserDataUi(),
//
//         //testing routes..
//         // MyPagesRoutes.citiesTest:(context)=> CitiesTest(),
//         // MyPagesRoutes.showAllAdvantages:(context)=>ShowAllAdvantages,
//       },
//
//       // Main(),
//       //The ThemeData of ween blaqe application
//     );
//   }
// }

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
    debugPrint(
        "code language now is in sp is -- ${NewSession.get("language", "def")}");
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
      child:   const MainUi()
    );
  }
}
