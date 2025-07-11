import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/button_list_tile_widget.dart';

import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../../controller/provider_controllers/providers/auth_provider.dart';
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
        isLogined?  aline: const SizedBox(),
        isLogined
            ? FadeInOnVisible(
          delay: const Duration(milliseconds: 130),
          direction: SlideDirection.x,

          child: ButtonListTileWidget(
                  onTap: () {
                    ref.read(ownerIdNotifier.notifier).state = 0;

                    myPushName(context, MyPagesRoutes.apartmentsOwner);
                  },
                  title: SetLocalization.of(context)!
                      .getTranslateValue("your_apartments"),
                  icon: Icons.apartment,
                ),
            )
            : const SizedBox(),
        FadeInOnVisible(
            delay: const Duration(milliseconds: 150),

            child: aline),

        /// ask for help
        FadeInOnVisible(
          direction: SlideDirection.x,
          delay: const Duration(milliseconds: 200),
          child: ButtonListTileWidget(
            onTap: () {
              myPushName(context, MyPagesRoutes.askForHelp);
            },
            title: SetLocalization.of(context)!.getTranslateValue("request_help"),
            icon: Icons.info_outline,
          ),
        ),
        FadeInOnVisible(
            delay: const Duration(milliseconds: 250),
            direction: SlideDirection.x,
            child: aline),

        /// privacy policy
        FadeInOnVisible(
          direction: SlideDirection.x,
          delay: const Duration(milliseconds: 300),
          child: ButtonListTileWidget(
            onTap: () {
              myPushName(context, MyPagesRoutes.privacyPolicy);
            },
            title:
                SetLocalization.of(context)!.getTranslateValue("privacy_policy"),
            icon: Icons.privacy_tip_outlined,
          ),
        ),

        FadeInOnVisible(

            delay: const Duration(milliseconds: 350),
            direction: SlideDirection.x,
            child: aline),

        /// share app
        FadeInOnVisible(
          direction: SlideDirection.x,
          delay: const Duration(milliseconds: 400),
          child: ButtonListTileWidget(
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
          ),
        ),
      ],
    );
  }
}
