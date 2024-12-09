import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/nums.dart';

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
        backgroundColor: themeMode. isLight ? Colors.black.withOpacity(0.5): Colors.white.withOpacity(0.5),
        // Semi-transparent background
        child: BackButton(
          color:  themeMode.isLight ?
          kTextColorDarkMode: kTextColorLightMode,

        ),
      ),
    );
  }
}
