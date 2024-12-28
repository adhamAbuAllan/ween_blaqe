import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/localization.dart';
class NoImageSelectedWidget extends ConsumerWidget {
  const NoImageSelectedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        SetLocalization.of(context)!
            .getTranslateValue("selected_images_displayed_here"),
        style: TextStyle(
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
