import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../core/utils/styles/button.dart';
import '../../../../../sesstion/new_session.dart';
import '../../../provider/auth_provider.dart';
import '../../update_data_of_user.dart';

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
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
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
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
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
                        userId: NewSession.get("id", -1),
                        ref: ref,
                      );


                    return  const UpdateUserData();
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
                child: ElevatedButton(
                    style: fullButton(),
                    onPressed: () {
                      myPushName(context, MyPagesRoutes.updateUserInfo);
                    },
                    child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("edit_data"),
                        style: const TextStyle(fontFamily: "IBM"))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
