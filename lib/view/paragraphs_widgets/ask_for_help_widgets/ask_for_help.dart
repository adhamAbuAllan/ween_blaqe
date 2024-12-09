import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import 'package:ween_blaqe/constants/nums.dart';
import '../../../constants/localization.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/buttons/lines_buttons/line_buttons.dart';

class AskForHelp extends StatelessWidget {
  const AskForHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ColorfulSafeArea(
        // bottomColor: Colors.transparent ,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          appBar: AppBar(
            backgroundColor: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            title: Text(
              SetLocalization.of(context)!.getTranslateValue("help"),
              style: const TextStyle(
                fontSize: 22.0,
                
                  fontWeight: FontWeight.w600

              ),
            ),
            bottom: TabBar(
              dividerColor: themeMode.isLight
                  ? kContainerColorLightMode
                  : kContainerColorDarkMode,
              labelStyle: const TextStyle(
                
                fontWeight: FontWeight.w700
              ),

              tabs: [
                Tab(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("tenant")),
                Tab(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("owner")),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //student Tab
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.systemPaying);
                        },
                            SetLocalization.of(context)!
                                .getTranslateValue("payment"),
                            context),
                        aline,
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.systemBooking);
                        },
                            SetLocalization.of(context)!
                                .getTranslateValue("reservation"),
                            context),
                        aline,
                        askForHelpButton(() {
                          myPushName(context, MyPagesRoutes.whatIsMeanSS);
                        },
                            SetLocalization.of(context)!
                                .getTranslateValue("what_is_ss"),
                            context),
                      ],
                    ),
                  ),
                ],
              ),
              // Expanded(child: Text("")),

              //owner tab
              Column(
                children: [
                  const SizedBox(
                    height: 20,
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
                        children: [
                          // askForHelpButton(() {
                          //   myPushName(context, MyPagesRoutes.howCreateAd);
                          // }, "طريقة نشر إعلان"),
                          // aline,

                          askForHelpButton(() {
                            myPushName(context,
                                MyPagesRoutes.whatTheInfoReqToCreateAd);
                          },
                              SetLocalization.of(context)!
                                  .getTranslateValue("required_data_for_ad"),
                              context),
                          // aline,
                          // askForHelpButton(() {
                          //   myPushName(context,
                          //       MyPagesRoutes.couldBeOwnerAndStudentInOneTime);
                          // }, "هل يمكن أن أكون مؤجر و مستأجر في نفس الوقت؟"),
                          // aline,
                          // askForHelpButton(() {
                          //   myPushName(context, MyPagesRoutes.theAdIsFreeOrNot);
                          // }, "هل يتطلب إنشاء إعلان الإشتراك أو دفع رسوم؟"),
                        ],
                      )),
                ],
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: FloatingActionButton(
              // shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16/2),) ,
              onPressed: () {
                sendMessageToWhatsApp(
                    '972569339613', "السلام عليكم، ممكن مساعدة، ");
              },
              backgroundColor: const Color(0xff25D366),

              child: const FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
