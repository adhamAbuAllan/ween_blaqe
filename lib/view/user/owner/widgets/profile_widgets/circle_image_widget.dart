
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/default_image_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/mobile_storage_image_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/change_user_image_widgets'
    '/server_image_widget.dart';

import '../../../../../constants/strings.dart';
import '../../../../../session/new_session.dart';
import '../../../../../controller/provider_controllers/providers/auth_provider.dart';
import '../../change_user_image.dart';

class CircleImageWidget extends ConsumerWidget {
  const CircleImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInOnVisible(
      direction: SlideDirection.x,
      child: Container(
        padding: const EdgeInsets.only(right: 15, left: 15),
        alignment: NewSession.get(PrefKeys.language, 'ar') == 'en'
            ? Alignment.bottomLeft
            : Alignment.bottomRight,
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              (ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref)),
              (ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref)),
              (ref.read(themeModeNotifier.notifier).containerTheme(ref: ref))
            ],
            // Three colors
            begin: Alignment.bottomCenter, // Horizontal gradient
            end: Alignment.topCenter,
            stops: const [0, 0.25, 0.0], // Color stops
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UpdateUserImage()));
          },
          child:

        ref.watch(profileImageFile)?.path != null ?
          FadeInOnVisible(child: const MobileStorageImageWidget(radius: 40,)):
          ( NewSession.get(PrefKeys.profile, "def") != "images/profile/user.png"?
          FadeInOnVisible(child: const ServerImageWidget(radius: 40,)): FadeInOnVisible(child: const DefaultImageWidget(radius: 40,))),


        ),
      ),
    );
  }
}
