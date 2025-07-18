import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../../../../../common_widgets/aline_widget.dart';

class MenuButtonsLoginWidgets extends ConsumerWidget {
  const MenuButtonsLoginWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        /// apartments of owner
        aline,
        buttonAccount(() {
          myPushName(context, MyPagesRoutes.apartmentsOwner);
        },
            icon: Icons.apartment,
            SetLocalization.of(context)!.getTranslateValue("your_apartments"),
            context: context),

        /// ask for help
        aline,

        /// ask for help
        buttonAccount(() {
          myPushName(context, MyPagesRoutes.askForHelp);
        },
            icon: Icons.info_outline,
            SetLocalization.of(context)!.getTranslateValue("request_help"),
            context: context),

        aline,

        /// privacy policy
        buttonAccount(() {
          myPushName(context, MyPagesRoutes.privacyPolicy);
        },
            icon: Icons.privacy_tip_outlined,
            SetLocalization.of(context)!.getTranslateValue("privacy_policy"),
            context: context),
        aline,

        /// Sebha
        buttonAccount(() {
          myPushName(context, MyPagesRoutes.noInternet);
        },
            image: Image.asset("assets/images/tasbih.png",
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                width: 35,
                height:
                    getIt<AppDimension>().isSmallScreen(context) ? 35 - 5 : 35),
            SetLocalization.of(context)!.getTranslateValue("sebha"),
            context: context),
        aline,

        /// share app
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
    );
  }
}
