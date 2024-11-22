
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';

import 'package:ween_blaqe/features/user/owner/pick_image_bottom_sheet_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/change_user_image_widgets/appbar_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/change_user_image_widgets/default_image_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/change_user_image_widgets/mobile_storage_image_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/change_user_image_widgets/server_image_widget.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../sesstion/new_session.dart';
import '../provider/auth_provider.dart';

class ChangeUserImage extends ConsumerStatefulWidget {
  const ChangeUserImage({super.key});

  @override
  ConsumerState createState() => _ChangeUserImageConsumerState();
}

class _ChangeUserImageConsumerState extends ConsumerState<ChangeUserImage> {
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(loadProfileImageNotifier.notifier).loadProfileImage(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: const AppBarChangeProfileWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PickImageBottomSheetWidget();
                    },
                  );
                },
                child: ref.watch(profileImageFile)?.path == null &&
                        NewSession.get("profile", "def") ==
                            "images/profile/user.png"
                    ?  DefaultImageWidget(radius: getIt<AppDimension>().isSmallScreen(context) ? 40 * 2 : (40 * 4),)
                    : (ref.watch(profileImageFile)?.path != null
                        ? MobileStorageImageWidget(
                            radius: getIt<AppDimension>().isSmallScreen(context)
                                ? 40 * 2
                                : (40 * 4),
                          )
                        :  ServerImageWidget(radius: getIt<AppDimension>().isSmallScreen(context) ? 40 * 2 : (40 * 4),))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
