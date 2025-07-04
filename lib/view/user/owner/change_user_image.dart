import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import 'package:ween_blaqe/view/user/owner/pick_image_bottom_sheet_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/appbar_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/default_image_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/mobile_storage_image_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/server_image_widget.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/strings.dart';
import '../../../session/new_session.dart';
import '../../../controller/provider_controllers/providers/auth_provider.dart';

class UpdateUserImage extends ConsumerStatefulWidget {
  const UpdateUserImage({super.key});

  @override
  ConsumerState createState() => _ChangeUserImageConsumerState();
}

class _ChangeUserImageConsumerState extends ConsumerState<UpdateUserImage> {
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
      backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
      appBar: const AppBarUpdateProfileWidget(),
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
                        NewSession.get(PrefKeys.profile, "def") ==
                            "images/profile/user.png"
                    ? DefaultImageWidget(
                        radius: getIt<AppDimension>().isSmallScreen(context)
                            ? 40 * 2
                            : (40 * 4),
                      )
                    : (ref.watch(profileImageFile)?.path != null
                        ? MobileStorageImageWidget(
                            radius: getIt<AppDimension>().isSmallScreen(context)
                                ? 40 * 2
                                : (40 * 4),
                          )
                        : ServerImageWidget(
                            radius: getIt<AppDimension>().isSmallScreen(context)
                                ? 40 * 2
                                : (40 * 4),
                          ))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
