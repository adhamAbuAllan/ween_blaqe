// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/features/user/owner/profile_of_owner.dart';

// import 'package:ween_blaqe/core/widgets/profile_classs_widget/profile_image.dart';
// import 'package:ween_blaqe/features/user/owner/profile_of_owner.dart';
import '../../../constants/get_it_controller.dart';
import '../../../controller/get_controllers.dart';
import '../../../core/utils/funcations/get_app_version.dart';

// import '../../../core/utils/funcations/snakbar.dart';
import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../main.dart';

// import '../../bookmark.dart';
// import 'apartment_of_owner.dart';
import '../../../sesstion/new_session.dart';
import '../../../sesstion/sesstion_of_user.dart';
// import '../../../testing_code/update_data_of_user.dart';

//account screen
class AccountOfOwner extends StatefulWidget {
  const AccountOfOwner({super.key});

  @override
  State<AccountOfOwner> createState() => _AccountOfOwnerState();
}

class _AccountOfOwnerState extends State<AccountOfOwner> {
  bool notificationState = true;

  // static const String rountName = "/accountOfOwner";
  @override
  Widget build(BuildContext context) {
    // MainController controller = Get.find();
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 50 / 1.6
                          : 50,
                      20,
                      0),
                  child: Text(
                    "حسابي",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            SizedBox(
              height:
                  getIt<AppDimension>().isSmallScreen(context) ? 50 / 2.1 : 50,
            ),

            //use GestureDetector that when user click on container make action

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ProfileOfOwner()));
            //   },
            //   child:  ProfileImage(
            //     image: "https://robohash.org/hicveldicta.png",
            //     name: NewSession.get("name", ""),phoneNumber:  NewSession.get("phone", ""),
            //     // dateOfJoin: NewSession.get("createdAt", ""),
            //   ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileOfOwner()),
                );

              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                ),
                child: Row(
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         "https://robohash.org/hicveldicta.png/"),
                    //     radius: 30,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        NewSession.get("name", ""),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 16
                              : 18,
                          fontFamily: 'IBM',
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: SizedBox(
                      child: Text(""),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        // "عرض الملف الشخصي",
                        NewSession.get("phone", ""),
                        // "972569339613",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBM',
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //notification icon and text and switch
            //   Row(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 10),
            //         child: Icon(
            //           Icons.notifications_outlined,
            //           size: getIt<AppDimension>()
            //           .isSmallOrIsMediumScreen(context)
            // ?32-5:32,
            //           color:themeMode.isDark ? kTextColorLightMode :
            //           kTextColorDarkMode ,
            //         ),
            //       ),
            //     ),
            //     Text(
            //       "الاشعارات",
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontFamily: 'IBM',
            //       ),
            //     ),
            //     Expanded(child: SizedBox()),
            //     // Padding(
            //     //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            //     //   child: Switcher(light1: notificationState,onChanged: (value){
            //     //     setState(() {
            //     //       notificationState = value;
            //     //       // value ==
            //     //       // false
            //     //       // ? toast("تم كتم الاشعارات")
            //     //       // : toast("تم تفعيل الاشعارات");
            //     //     });
            //     //   }),
            //     // )
            //   ],
            // ),
            SizedBox(
              height:
                  getIt<AppDimension>().isSmallScreen(context) ? 60 / 2.5 : 60,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: themeMode.isLight
                    ? kContainerColorLightMode
                    : kContainerColorDarkMode,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Switch(value:themeMode.isDark , onChanged:
                  // themeMode.onChanged),
                  SwitchListTile(
                      inactiveThumbColor: kBackgroundAppColorLightMode,
                      activeColor: themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode,
                      dense: getIt<AppDimension>().isSmallScreen(context),
                      title: Row(
                        children: [
                          Icon(
                            themeMode.isLight
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
                            size: getIt<AppDimension>().isSmallScreen(context)
                                ? 32 - 5
                                : 32,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text("المظهر",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'IBM',
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode)),
                        ],
                      ),
                      value: themeMode.isLight,
                      onChanged: (bool value) async {
                        cityModelController.cityId.value = 0;
                        setState(() {
                          themeMode.onChanged(value);
                          // sp.get('isDark');
                          // myPushName(context, MyPagesRoutes.splashScreen);

                          myPushNameAnimation(context);
                        });
                      }),
                  aline,
                  //apartments of owner
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.apartmentsOwner);
                  }, icon: Icons.apartment, "شققك", context: context),
                  //ask for help
                  aline,
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.askForHelp);
                  },
                      icon: Icons.info_outline,
                      "اطلب المساعدة",
                      context: context),

                  aline,
                  //privacy policy
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.privacyPolicy);
                  },
                      icon: Icons.privacy_tip_outlined,
                      "سياسة الخصوصية",
                      context: context),
                  // aline,
                  //share app
                  // ButtonAccount(
                  //     () {},
                  //          Icon(
                  //       Icons.share_outlined,
                  //       size: getIt<AppDimension>()
                  //       .isSmallOrIsMediumScreen(context)
                  // ?32-5:32,
                  //       color: kTextColor,
                  //     ),
                  //     "شارك التطبيق"),
                  aline,
                  //send feedback for us
                  buttonAccount(() {
                    // if (connectivityController.isConnection() == false) {
                    // } else {
                    //   showSnakBar(context, "انت غير متصل بالانترنت");
                    // }

                    myPushName(context, MyPagesRoutes.sendNoticeForUs);
                  },
                      icon: Icons.feedback_outlined,
                      "أرسل ملاحظات إلينا",
                      context: context),
                  aline,
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.noInternet);
                  },
                      image: Image.asset("assets/images/tasbih.png",
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          width: 35,
                          height: getIt<AppDimension>().isSmallScreen(context)
                              ? 35 - 5
                              : 35),
                      "السبحة",
                      context: context),
                  aline,
                  buttonAccount(() {
                    apartmentModelController.fetchApartments(
                        isOwnerApartments: false);
                    myPushName(context, MyPagesRoutes.bookmarkApartment);
                  }, "المفضلة",
                      icon: Icons.bookmark_border_outlined, context: context),
                  aline,
                  buttonAccount(
                    () {
                      String url =
                          "https://play.google.com/store/apps/details?id=com.weenbalaqee.weenbalaqee";

                      /// use this code if you upload your app to play store
                      // switch (Platform.operatingSystem) {
                      //   case 'ios':
                      //     url = "www.youtube.com";
                      //     break;
                      //   default:
                      //     // Use the original value for other platforms
                      //     break;
                      // }
                      Share.shareUri(
                        Uri.parse(url),
                      );
                    },
                    "مشاركة التطبيق",
                    context: context,
                    icon: Icons.share_outlined,
                  )
                ],
              ),
            ),
            //button sign out
            Padding(
              padding: EdgeInsets.fromLTRB(
                  25,
                  getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.8 : 60,
                  25,
                  5),
              child: SizedBox(
                width: double.infinity,
                height: getIt<AppDimension>().isSmallScreen(context)
                    ? 55 / 1.2
                    : 55,
                child: OutlinedButton(
                    onPressed: () {
                      cityModelController.cityId.value = 0;
                      removeUserInfo();
                      // checkCurrentAuthState(context);
                      myPushAndRemoveUntilName(context, const Main(), "");
                    },
                    style: outlinedButton(themeMode: themeMode),
                    child: const Text("تسجيل الخروج")),
              ),
            ),
            //Beta Version
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: FutureBuilder<String>(
                future: getAppVersion(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "الإصدار التجريبي: ${snapshot.data} ",
                      style: TextStyle(
                          fontFamily: 'IBM',
                          color: themeMode.isLight
                              ? kTextColorLightMode.withOpacity(.5)
                              : kTextColorDarkMode.withOpacity(.5)),
                      textDirection: TextDirection.rtl,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}خطأ: ");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
