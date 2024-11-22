import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/nums.dart';
import '../../../../common_widgets/back_button_widget.dart';
import '../../../provider/auth_provider.dart';

class BackButtonWithContainerWidget extends ConsumerWidget {
  const BackButtonWithContainerWidget({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Container(
      color: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
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
