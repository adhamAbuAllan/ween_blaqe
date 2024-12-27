import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../common_widgets/button_widgets/elevated_button_widget.dart';

class LoginButtonWidget extends ConsumerWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
        child: ElevatedButtonWidget(
            onPressed: () {
              myPushName(context, MyPagesRoutes.login);
            },
            child: Text(SetLocalization.of(context)!.getTranslateValue("login"))),
      ),
    );
  }
}
