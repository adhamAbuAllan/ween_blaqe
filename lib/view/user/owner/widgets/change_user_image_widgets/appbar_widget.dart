import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/auth_provider.dart';

class AppBarUpdateProfileWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarUpdateProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInOnVisible(
      child: AppBar(
        backgroundColor:
        ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        title: Text(
          SetLocalization.of(context)!
              .getTranslateValue("change_profile_picture"),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : null,
              color: Colors.white),
        ),
        leading:FadeInOnVisible(
          child: BackButton(
            onPressed: (){
              ref.read(profileImageFile.notifier).state = null;
              Navigator.pop(context);
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child:FadeInOnVisible(
              direction: SlideDirection.x,
                child: _CheckButtonWidget()) ,
          ),
        ],
      ),
    );
  }

    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  }

class _CheckButtonWidget extends ConsumerWidget {
  const _CheckButtonWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          if (ref.watch(profileImageFile)?.path != null) {
            ref
                .read(compressAndUploadImageNotifier.notifier)
                .compressAndUploadProfileImage(
                ref.watch(profileImageFile)!, ref, context);
            ref.read(isUpdateImageProfile.notifier).state = true;
          }
        },
        icon: ref.watch(compressAndUploadImageNotifier).isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : const Icon(Icons.check));
  }
}
