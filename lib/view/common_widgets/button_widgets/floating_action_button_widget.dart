import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/alert_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';

import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import '../../../constants/strings.dart';
import '../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../controller/provider_controllers/providers/connectivity_provider.dart';
import '../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../session/new_session.dart';

class FloatingActionButtonWidget extends ConsumerStatefulWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  FloatingActionButtonWidgetState createState() =>
      FloatingActionButtonWidgetState();
}

class FloatingActionButtonWidgetState
    extends ConsumerState<FloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var isConnected = ref.watch(connectivityNotifier.notifier).isConnected;

    return FloatingActionButton(
      tooltip: SetLocalization.of(context)!.getTranslateValue("add_ad"),
      backgroundColor:
      ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: () {


        setState(() {
          isConnected;
        });
        debugPrint("is connected $isConnected");
        if (isConnected) {
          if (NewSession.get("logged", "") == "") {
            /// this how show if user not logged
            ref.read(alertNotifier.notifier).alertWithTwoBtn(
                  onClickOkBtn: () {
                    Navigator.pop(context);
                    myPushName(context, MyPagesRoutes.register);
                  },
                  textOfCancelButton: "إلغاء",
                  context: context,
                  title: SetLocalization.of(context)!
                      .getTranslateValue("login_to_create_ad"),
                  message: SetLocalization.of(context)!
                      .getTranslateValue("login_to_add_apartment"),
                  textOfOkButton: SetLocalization.of(context)!
                      .getTranslateValue("create_account"),
                );
          } else {
            myPushName(context, MyPagesRoutes.step1);
          }
        } else {
          /// this show if no internet have
          ref.watch(showSnackBarNotifier.notifier).showNormalSnackBar(
                context: context,
                message: SetLocalization.of(context)!
                    .getTranslateValue("no_internet"),
              );
          return;
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(toggleOwnerButtonsNotifier).isEdit = false;
          ref.read(toggleOwnerButtonsNotifier).isDelete = false;
        });
      },
      child: const Icon(
        Icons.add_home_outlined,
        color: Colors.white,
      ),
    );
  }
}
