import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/localization.dart';
import '../../../constants/strings.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../session/new_session.dart';

class FloatingActionButtonNoInternetWidget extends ConsumerWidget {
  const FloatingActionButtonNoInternetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      tooltip: SetLocalization.of(context)!
          .getTranslateValue('reload'),
      onPressed: () {
        pushToMainPage(context: context);
      },
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(16 / 2)),
      backgroundColor: ref
          .read(themeModeNotifier.notifier)
          .primaryTheme(ref: ref),
      child: const FaIcon(
        FontAwesomeIcons.rotateRight,
      ),
    )
    ;
  }
  Future<void> pushToMainPage({required BuildContext context}) async {
    // studentController.index = 0;
    await myPushNameAndRemoveUntil(
        context,
        MyPagesRoutes.main,
            (route) => route.settings.name == MyPagesRoutes.main,
        (NewSession.get("logged", "def") == "ok"
            ? MyPagesRoutes.accountOfOwner
            : MyPagesRoutes.accountBeforeLoginInStudent));
  }

}
