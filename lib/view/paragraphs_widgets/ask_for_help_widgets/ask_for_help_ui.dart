import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import 'package:ween_blaqe/view/common_widgets/button_widgets/button_list_tile_widget.dart';
import '../../../constants/localization.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../common_widgets/aline_widget.dart';

class AskForHelpUi extends ConsumerStatefulWidget {
  const AskForHelpUi({super.key});

  @override
  ConsumerState createState() => _AskForHelpUiState();
}

class _AskForHelpUiState extends ConsumerState<AskForHelpUi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ColorfulSafeArea(
        // bottomColor: Colors.transparent ,
        color:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: Scaffold(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
          appBar: AppBar(
            backgroundColor:
                ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
            title: Text(
              SetLocalization.of(context)!.getTranslateValue("help"),
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
            bottom: TabBar(
              dividerColor:
                  ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
              labelStyle: const TextStyle(fontWeight: FontWeight.w700),
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
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .containerTheme(ref: ref),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ButtonListTileWidget(
                          onTap: () {
                            myPushName(context, MyPagesRoutes.systemPaying);
                          },
                          title: SetLocalization.of(context)!
                              .getTranslateValue("payment"),
                        ),

                        aline,
                        ButtonListTileWidget(
                            onTap: () {
                              myPushName(context, MyPagesRoutes.systemBooking);
                            },
                            title: SetLocalization.of(context)!
                                .getTranslateValue("reservation")),
                        aline,
                        ButtonListTileWidget(
                            onTap: () {
                              myPushName(context, MyPagesRoutes.whatIsMeanSS);
                            },
                            title: SetLocalization.of(context)!
                                .getTranslateValue("what_is_ss")),
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
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .containerTheme(ref: ref),
                      ),
                      child: Column(
                        children: [
                          // askForHelpButton(() {
                          //   myPushName(context, MyPagesRoutes.howCreateAd);
                          // }, "طريقة نشر إعلان"),
                          // aline,
                          ButtonListTileWidget(
                              onTap: () {
                                myPushName(context,
                                    MyPagesRoutes.whatTheInfoReqToCreateAd);
                              },
                              title: SetLocalization.of(context)!
                                  .getTranslateValue("required_data_for_ad")),

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
