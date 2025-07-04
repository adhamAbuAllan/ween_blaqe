import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../session/new_session.dart';
import '../../../../../controller/provider_controllers/providers/auth_provider.dart';
import '../../../../common_widgets/button_widgets/elevated_button_widget.dart';
import '../../update_data_of_user_ui.dart';

class DataOfOwnerAndButtonWidget extends ConsumerWidget {
  const DataOfOwnerAndButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
        children: [
          // Row(children: [],),
          ref.read(userData)?.name?.isEmpty ?? true
              ? const SkeletonLine(
                  style: SkeletonLineStyle(
                  height: 20,
                  width: 150,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  randomLength: true,
                ))
              : Text(ref.watch(userData)?.name ?? "username",
                  style: TextStyle(
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  )),
          const SizedBox(
            height: 15,
          ),
          ref.watch(userData)?.name?.isEmpty ?? true
              ? const SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 15,
                    width: 250,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  randomLength: true,
                ))
              : Text(ref.read(userData)?.phone ?? "97000000000",
                  style: TextStyle(
                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                      fontWeight: FontWeight.w600,
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,)),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      ref.read(refreshUserDataNotifier.notifier).refreshUserData(
                        userId: NewSession.get(PrefKeys.id, -1),
                        ref: ref,
                      );


                    return  const UpdateUserDataUi();
                    },
                  ));
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20,
                  getIt<AppDimension>().isSmallScreen(context) ? 20 / 1.5 : 20,
                  20,
                  0),
              child: SizedBox(
                width: double.infinity,
                height: getIt<AppDimension>().isSmallScreen(context)
                    ? 55 / 1.2
                    : 55,
                child: ElevatedButtonWidget(
                    onPressed: () {
                      myPushName(context, MyPagesRoutes.updateUserInfo);
                    },
                    context: context,
                    child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("edit_data"),
                        style: const TextStyle(fontFamily: "Cairo"))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
