import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/button_list_tile_widget.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../common_widgets/aline_widget.dart';

class MenuButtonsWidgets extends ConsumerWidget {
  const MenuButtonsWidgets({super.key, required this.isLogined});

  final bool isLogined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        /// apartments of owner
        isLogined
            ? ButtonListTileWidget(
                onTap: () {
                  myPushName(context, MyPagesRoutes.apartmentsOwner);
                },
                title: SetLocalization.of(context)!
                    .getTranslateValue("your_apartments"),
                icon: Icons.apartment,
              )
            : const SizedBox(),
        aline,

        /// ask for help
        ButtonListTileWidget(
          onTap: () {
            myPushName(context, MyPagesRoutes.askForHelp);
          },
          title: SetLocalization.of(context)!.getTranslateValue("request_help"),
          icon: Icons.info_outline,
        ),
        aline,

        /// privacy policy
        ButtonListTileWidget(
          onTap: () {
            myPushName(context, MyPagesRoutes.privacyPolicy);
          },
          title:
              SetLocalization.of(context)!.getTranslateValue("privacy_policy"),
          icon: Icons.privacy_tip_outlined,
        ),
        aline,

        /// send feedback for us
        ButtonListTileWidget(
          onTap: () {
            myPushName(context, MyPagesRoutes.sendNoticeForUs);
          },
          title: SetLocalization.of(context)!
              .getTranslateValue("send_notify_for_us"),
          icon: Icons.feedback_outlined,
        ),
        aline,

        /// Sebha

        ButtonListTileWidget(
          onTap: () {
            myPushName(context, MyPagesRoutes.noInternet);
          },
          title: SetLocalization.of(context)!.getTranslateValue("sebha"),
          image: Image.asset("assets/images/tasbih.png",
              color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              width: 35,
              height:
                  getIt<AppDimension>().isSmallScreen(context) ? 35 - 5 : 35),
        ),

        aline,

        /// favorites
        ButtonListTileWidget(
          onTap: () {
            myPushName(context, MyPagesRoutes.bookmarkUi);
          },
          title: SetLocalization.of(context)!.getTranslateValue(
            "favorites",
          ),
          icon: Icons.bookmark_border_outlined,
        ),
        aline,

        /// share app
        ButtonListTileWidget(
          onTap: () {
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
          title: SetLocalization.of(context)!.getTranslateValue("share_app"),
          icon: Icons.share_outlined,
        )
      ],
    );
  }
}
