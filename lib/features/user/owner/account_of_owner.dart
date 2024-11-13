// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';

// import 'package:ween_blaqe/controller/auth_provider.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/features/user/owner/profile_of_owner.dart';

// import 'package:ween_blaqe/core/widgets/profile_classs_widget/profile_image.dart';
// import 'package:ween_blaqe/features/user/owner/profile_of_owner.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/localization.dart';
import '../../../controller/get_controllers.dart';
import '../../../core/utils/funcations/get_app_version.dart';

// import '../../../core/utils/funcations/snakbar.dart';
import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../core/widgets/buttons/lines_buttons/switch_language_buttons.dart';
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
                      20,
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 50 / 1.6
                          : 50,
                      20,
                      0),
                  child: Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("my_account"),
                    style: TextStyle(
                      fontSize:
                      getIt<AppDimension>().isSmallScreen(context)
                          ? 22
                          : 26,
                      inherit: true,
                      fontWeight: FontWeight.w600,
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
                imagesModelController.loadProfileImage();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileOfOwner()),
                );
              },
              child: Container(
                width: double.infinity,
                padding:  EdgeInsets.fromLTRB(5,  getIt<AppDimension>()
                    .isSmallScreen(context) ? 0 : 10, 5, getIt<AppDimension>()
                    .isSmallScreen(context) ? 0 : 10),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                ),
                child: Row(
                  children: [
                    Obx(() {
                      imagesModelController.isUpdateImageProfile.value;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: NewSession.get("profile", "def") ==
                                "images/profile/user.png"
                            ? CircleAvatar(
                                radius:
                                    getIt<AppDimension>().isSmallScreen(context)
                                        ? 32 / 1.5
                                        : 32,
                                //put a normal person Icon
                                backgroundColor: Colors.grey.shade700,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                      ? 32 / 1.5
                                      : 32,
                                ))
                            : imagesModelController.isUpdateImageProfile.value
                                ? SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      shape: BoxShape.circle,
                                      width: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 63 / 1.5
                                          : 63,
                                      height: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 63 / 1.5
                                          : 63,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: getIt<AppDimension>()
                                            .isSmallScreen(context)
                                        ? 32 / 1.5
                                        : 32,
                                    // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                                    // Adjust the radius as needed
                                    backgroundColor: Colors.grey.shade700,
                                    // Set the background color of the avatar
                                    backgroundImage: NetworkImage(
                                        "https://weenbalaqee"
                                        ".com/${NewSession.get("profile", "def")}"),
                                    // child:
                                    // imagesModelController.isLoadingProfile.value
                                    //     ? const CircularProgressIndicator()
                                    //     : null,
                                  ),
                      );
                    }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NewSession.get("name", ""),
                          style: TextStyle(
                            fontSize:
                                getIt<AppDimension>().isSmallScreen(context)
                                    ? 16
                                    : 18,

                            fontWeight: FontWeight.w600,
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
                          ),
                        ),
                        SizedBox(
                          height: getIt<AppDimension>().isSmallScreen(context)
                              ? 0
                              : 2,
                        ),
                        Text(
                          // "عرض الملف الشخصي",
                          NewSession.get("phone", ""),
                          // "972569339613",
                          style: TextStyle(
                              fontSize: 14,

                              fontWeight: FontWeight.w500,

                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        )
                      ],
                    ),
                    const Expanded(
                        child: SizedBox(
                      child: Text(""),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                        // size: ,
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
            //         ,
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
                          Text(
                              SetLocalization.of(context)!
                                  .getTranslateValue("appearance"),
                              style: TextStyle(
                                  fontSize: 16,

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
                  const SwitchLanguageButtons(),

                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: aline,
                  ),
                  aline,
                  //apartments of owner
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.apartmentsOwner);
                  },
                      icon: Icons.apartment,
                      SetLocalization.of(context)!
                          .getTranslateValue("your_apartments"),
                      context: context),
                  //ask for help
                  aline,
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.askForHelp);
                  },
                      icon: Icons.info_outline,
                      SetLocalization.of(context)!
                          .getTranslateValue("request_help"),
                      context: context),

                  aline,
                  //privacy policy
                  buttonAccount(() {
                    myPushName(context, MyPagesRoutes.privacyPolicy);
                  },
                      icon: Icons.privacy_tip_outlined,
                      SetLocalization.of(context)!
                          .getTranslateValue("privacy_policy"),
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
                      SetLocalization.of(context)!
                          .getTranslateValue("send_notify_for_us"),
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
                      SetLocalization.of(context)!.getTranslateValue("sebha"),
                      context: context),
                  aline,
                  buttonAccount(() {
                    apartmentModelController.fetchApartments(
                        isOwnerApartments: false);
                    myPushName(context, MyPagesRoutes.bookmarkApartment);
                  },
                      SetLocalization.of(context)!.getTranslateValue(
                        "favorites",
                      ),
                      icon: Icons.bookmark_border_outlined,
                      context: context),
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
                    SetLocalization.of(context)!.getTranslateValue("share_app"),
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
                    style: outlinedButton(themeMode: themeMode,context: context),
                    child: Text(SetLocalization.of(context)!
                        .getTranslateValue("logout"))),
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
                      "${SetLocalization.of(context)!.getTranslateValue("beta_version")}: ${snapshot.data} ",
                      style: TextStyle(

                          color: themeMode.isLight
                              ? kTextColorLightMode.withOpacity(.5)
                              : kTextColorDarkMode.withOpacity(.5)),
                      // textDirection: TextDirection.rtl,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                        "${snapshot.error}${SetLocalization.of(context)!.getTranslateValue("error")}: ");
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
