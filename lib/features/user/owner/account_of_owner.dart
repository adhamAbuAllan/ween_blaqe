import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import '../../../constants/injection.dart';
import '../../../core/utils/funcations/get_app_version.dart';
import '../../../core/utils/funcations/snakbar.dart';
import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../main.dart';
import '../../bookmark.dart';
import 'apartment_of_owner.dart';
import '../../../sesstion/new_session.dart';
import '../../../sesstion/sesstion_of_user.dart';

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
    var paddingOfOwnerInfoBox =
        getIt<AppDimension>().isSmallScreen(context) ? 9.0 : 14.0;
    // MainController controller = Get.find();
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: themeMode.isDark
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
                        "الحساب",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
                  ],
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 50 / 2.1
                      : 50,
                ),

                //use GestureDetector that when user click on container make action

                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.fromLTRB(0, paddingOfOwnerInfoBox, 10, paddingOfOwnerInfoBox
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
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
                            fontSize: getIt<AppDimension>()
                                    .isSmallScreen(context)
                                ? 16
                                : 18,
                            fontFamily: 'IBM',
                            color: themeMode.isDark
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
                              color: themeMode.isDark
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        ),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //   child: Icon(
                      //     Icons.arrow_forward_ios_rounded,
                      //     color: themeMode.isDark
                      //         ? kTextColorLightMode
                      //         : kTextColorDarkMode,
                      //   ),
                      // ),
                    ],
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
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 60 / 2.5
                      : 60,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    // Switch(value:themeMode.isDark , onChanged:
                    // themeMode.onChanged),
                    SwitchListTile(
                        dense:
                            getIt<AppDimension>().isSmallScreen(context),
                        title: Text("الشكل",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'IBM',
                                color: themeMode.isDark
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode)),
                        value: themeMode.isDark,
                        onChanged: (bool value) async {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApartmentsOwner(),
                          ));
                    },
                        icon: Icon(
                          Icons.apartment,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          size:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 35 - 5
                                  : 35,
                        ),
                        "شققك",
                        context: context),
                    //ask for help
                    aline,
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.askForHelp);
                    },
                        icon: Icon(
                          Icons.info_outline,
                          size:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 32 - 5
                                  : 32,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                        "اطلب المساعدة",
                        context: context),

                    aline,
                    //privacy policy
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.privacyPolicy);
                    },
                        icon: Icon(
                          Icons.privacy_tip_outlined,
                          size:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 32 - 5
                                  : 32,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
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
                      if (snapshot.data != ConnectivityResult.none) {
                      }else{
                        showSnakBar(context, "انت غير متصل بالانترنت");
                      }

                      myPushName(context, MyPagesRoutes.sendNoticeForUs);
                    },
                        icon: Icon(
                          Icons.feedback_outlined,
                          size:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 32 - 5
                                  : 32,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                        "أرسل ملاحظات إلينا",
                        context: context),
                    aline,
                    buttonAccount(() {
                      myPushName(context, MyPagesRoutes.noInternet);
                    },
                        image: Image.asset("assets/images/tasbih.png",
                            color: themeMode.isDark
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
                            width: 35,
                            height: getIt<AppDimension>()
                                    .isSmallScreen(context)
                                ? 35 - 5
                                : 35),
                        "السبحة",
                        context: context),
                    aline,
                    buttonAccount(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BookmarkApartment();
                      }));
                    }, "المفضلة",
                        icon: Icon(
                          Icons.bookmark_outlined,
                          color: themeMode.isDark
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                        context: context)
                  ]),
                ),
                //button sign out
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      25,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 60 / 1.8
                          : 60,
                      25,
                      5),
                  child: SizedBox(
                    width: double.infinity,
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 55 / 1.2
                        : 55,
                    child: OutlinedButton(
                        onPressed: () {
                          removeUserInfo();
                          // checkCurrentAuthState(context);
                          myPushAndRemoveUntilName(context, const Main(), "");
                        },
                        style: outlineButton,
                        child: const Text("تسجيل الخروج")),
                  ),
                ),
                //Beta Version
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical:
                      30),
                  child: FutureBuilder<String>(
                    future: getAppVersion(),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text("الإصدار التجريبي: ${snapshot.data} "
                          ,style: TextStyle(
                                fontFamily: 'IBM',
                              color: themeMode.isDark
                                  ? kTextColorLightMode.withOpacity(.5)
                                  : kTextColorDarkMode.withOpacity(
                                  .5)), textDirection: TextDirection
                              .rtl,);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}خطأ: ");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                  ,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
