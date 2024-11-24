import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../core/utils/styles/button.dart';
import '../../../../../main.dart';
import '../../../../../session/sesstion_of_user.dart';

class LogoutButtonWidget extends ConsumerWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25,
          getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.8 : 60, 25, 5),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
        child: OutlinedButton(
            onPressed: () {
              /// cityModelController.cityId.value = 0;
              removeUserInfo();
              myPushAndRemoveUntilName(context, const Main(), "");
            },
            style: outlinedButton(themeMode: themeMode, context: context),
            child:
                Text(SetLocalization.of(context)!.getTranslateValue("logout"))),
      ),
    );
  }
}
