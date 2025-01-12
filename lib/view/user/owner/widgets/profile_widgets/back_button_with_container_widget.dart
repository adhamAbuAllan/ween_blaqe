import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../common_widgets/button_widgets/back_button_widget.dart';
import '../../../../../controller/provider_controllers/providers/auth_provider.dart';

class BackButtonWithContainerWidget extends ConsumerWidget {
  const BackButtonWithContainerWidget({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Container(
      color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: BackButtonWidget(onPressed: () {
              ref.read(isPop.notifier).state = true;
              ref.read(loadProfileImageNotifier.notifier).loadProfileImage(ref);
              Navigator.pop(context);
            }),
          ),
          const Expanded(child: Text(""))
        ],
      ),
    );
  }
}
