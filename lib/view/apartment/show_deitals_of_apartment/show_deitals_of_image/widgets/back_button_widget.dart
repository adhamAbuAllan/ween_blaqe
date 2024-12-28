import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';


class ImageDetialsBackButtonWidget extends ConsumerWidget {
  const ImageDetialsBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return           Positioned(
      top: MediaQuery.of(context)
          .padding
          .top+10, // Adds space for the status bar
      right: 16.0,
      child: CircleAvatar(
        backgroundColor: ref.read(themeModeNotifier.notifier).isLightMode
            ? Colors.black.withOpacity(0.5): Colors.white.withOpacity(0.5),
        // Semi-transparent background
        child: BackButton(
          color:  ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

        ),
      ),
    );
  }
}
