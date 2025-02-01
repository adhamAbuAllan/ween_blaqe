import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';

class ImageNotFoundWidget extends ConsumerWidget {
  const ImageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 8, 0, 0),
      child: Image(
        image: ref.read(themeModeNotifier.notifier).isLightMode
            ? const AssetImage(
                "assets/images/error_images/not_found_light_mode.png",
              )
            : const AssetImage(
                "assets/images/error_images/not_found_dark_mode.png",
              ),
        height: getIt<AppDimension>().isSmallScreen(context)
            ? 130 * 1.5
            : (130 * 2.5),
        width: getIt<AppDimension>().isSmallScreen(context)
            ? 130 * 1.5
            : (130 * 2.5),
        // color: kContainerColor..7),
      ),
    );
  }
}
