import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/strings.dart';
import '../../../../../session/new_session.dart';

class JoinDateWidget extends ConsumerWidget {
  const JoinDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInOnVisible(
      direction: SlideDirection.x,
      delay: const Duration(milliseconds: 510),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        // height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row(children: [],),

            FadeInOnVisible(
              child: Text(SetLocalization.of(context)!.getTranslateValue("joining_time"),
                  style: TextStyle(
                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                      fontWeight: FontWeight.w600,
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                      fontFamily: "Cairo")),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeInOnVisible(
              direction: SlideDirection.x,
              child: Text(
                  " ${SetLocalization.of(context)!.getTranslateValue("account_created_since")}  ${NewSession.get(PrefKeys.createdAt, "def")} ${SetLocalization.of(context)!.getTranslateValue("until_now")}",
                  style: TextStyle(
                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo")),
            ),
          ],
        ),
      ),
    );
  }
}
