import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
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
    // MainController controller = Get.find();
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
                  padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
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
            const SizedBox(
              height: 50,
            ),

            //use GestureDetector that when user click on container make action

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 14, 10, 14),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: themeMode.isDark
                    ? kContainerColorLightMode
                    : kContainerColorDarkMode,
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) {
                  //     return const ProfileOfOwner();
                  //   }),
                  // );
                },
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

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            NewSession.get("name", ""),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'IBM',
                              color: themeMode.isDark
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                            ),
                          ),
                        ),

                      ],
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
                        style:  TextStyle(
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
            //           size: 32,
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
            const SizedBox(
              height: 20 * 3,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        builder: (context) => ApartmentsOwner(),
                      ));
                },
                    icon: Icon(
                      Icons.apartment,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      size: 35,
                    ),
                    "شققك"),
                //ask for help
                aline,
                buttonAccount(() {
                  myPushName(context, MyPagesRoutes.askForHelp);
                },
                    icon: Icon(
                      Icons.info_outline,
                      size: 32,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                    "اطلب المساعدة"),

                aline,
                //privacy policy
                buttonAccount(() {
                  myPushName(context, MyPagesRoutes.privacyPolicy);
                },
                    icon: Icon(
                      Icons.privacy_tip_outlined,
                      size: 32,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                    "سياسة الخصوصية"),
                // aline,
                //share app
                // ButtonAccount(
                //     () {},
                //          Icon(
                //       Icons.share_outlined,
                //       size: 32,
                //       color: kTextColor,
                //     ),
                //     "شارك التطبيق"),
                aline,
                //send feedback for us
                buttonAccount(() {
                  myPushName(context, MyPagesRoutes.sendNoticeForUs);
                },
                    icon: Icon(
                      Icons.feedback_outlined,
                      size: 32,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                    "أرسل ملاحظات إلينا"),
                aline,
                buttonAccount(() {
                  myPushName(context, MyPagesRoutes.noInternet);
                },
                    image: Image.asset("assets/images/tasbih.png",
                        color: themeMode.isDark
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                        width: 35,
                        height: 35),
                    "السبحة"),
                aline,
                buttonAccount(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookmarkApartment();
                  }));
                }, "المفضلة",
                    icon: Icon(
                      Icons.bookmark_outlined,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ))
              ]),
            ),
            //button sign out
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20 * 3, 25, 5),
              child: SizedBox(
                width: double.infinity,
                height: 55,
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
              padding: const EdgeInsets.symmetric(vertical:30.0),
              child:  Text("الإصدار التجريبي: 1.0.0",style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode.withOpacity(.5) :
                  kTextColorDarkMode.withOpacity(.5)
              ),),
            )

          ],
        ),
      ),
    );
  }
}
