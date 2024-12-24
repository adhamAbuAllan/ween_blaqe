import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../session/new_session.dart';
import '../../../../../../controller/provider_controllers/providers/auth_provider.dart';
import '../../../profile_ui.dart';
import '../../change_user_image_widgets/default_image_widget.dart';
import '../../change_user_image_widgets/mobile_storage_image_widget.dart';
import '../../change_user_image_widgets/server_image_widget.dart';

class ContainerOfProfileWidget extends ConsumerWidget {
  const ContainerOfProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(loadProfileImageNotifier.notifier).loadProfileImage(ref);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileUi()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
            5,
            getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
            5,
            getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: themeMode.isLight
              ? kContainerColorLightMode
              : kContainerColorDarkMode,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ref.watch(profileImageFile)?.path != null
                  ? MobileStorageImageWidget(
                      radius: getIt<AppDimension>().isSmallScreen(context)
                          ? 32 / 1.5
                          : 32,
                    )
                  : (NewSession.get("profile", "def") !=
                          "images/profile/user.png"
                      ? ServerImageWidget(
                          radius: getIt<AppDimension>().isSmallScreen(context)
                              ? 32 / 1.5
                              : 32,
                        )
                      : DefaultImageWidget(
                          radius: getIt<AppDimension>().isSmallScreen(context)
                              ? 32 / 1.5
                              : 32,
                        )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NewSession.get("name", ""),
                  style: TextStyle(
                    fontSize:
                        getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  ),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 2,
                ),
                Text(
                  // "عرض الملف الشخصي",
                  NewSession.get("phone", ""),
                  // "972569339613",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                )
              ],
            ),
            const Expanded(
                child: SizedBox(
              child: Text(""),
            )),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                // size: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
