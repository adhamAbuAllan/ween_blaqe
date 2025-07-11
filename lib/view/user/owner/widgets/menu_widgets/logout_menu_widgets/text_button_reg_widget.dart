import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../../controller/provider_controllers/providers/connectivity_provider.dart';
import '../../../../../../core/utils/funcations/route_pages/push_routes.dart';

class TextButtonRegWidget extends ConsumerWidget {
  const TextButtonRegWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        FadeInOnVisible(
          direction: SlideDirection.x,
          delay: const Duration(milliseconds: 550),
          child: Text(
            SetLocalization.of(context)!.getTranslateValue("dont_have_account"),
            style: TextStyle(
                color:
                    ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                fontFamily: "Cairo"),
          ),
        ),
        FadeInOnVisible(
          direction: SlideDirection.x,
          delay: const Duration(milliseconds: 600),
          child: TextButton(
            style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("create_account"),
              style: const TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              if (ref.read(connectivityNotifier.notifier).isConnected) {
                myPushName(context, MyPagesRoutes.register);
              } else {
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                    backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                    textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    context: context,
                    message: SetLocalization.of(context)!
                        .getTranslateValue("no_internet_connection"));
              }
            },
          ),
        ),
      ],
    );
  }
}
