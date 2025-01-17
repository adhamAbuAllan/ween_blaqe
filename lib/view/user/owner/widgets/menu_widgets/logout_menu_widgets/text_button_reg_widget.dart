import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';

import '../../../../../../constants/localization.dart';
import '../../../../../../constants/strings.dart';
import '../../../../../../controller/provider_controllers/providers/connectivity_provider.dart';
import '../../../../../../core/utils/funcations/route_pages/push_routes.dart';

class TextButtonRegWidget extends ConsumerWidget {
  const TextButtonRegWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Text(
          SetLocalization.of(context)!.getTranslateValue("dont_have_account"),
          style: TextStyle(
              color:
                  ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              fontFamily: "IBM"),
        ),
        TextButton(
          child: Text(
            SetLocalization.of(context)!.getTranslateValue("create_account"),
            style: const TextStyle(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            if (ref.read(connectivityNotifier.notifier).isConnected) {
              myPushName(context, MyPagesRoutes.register);
            } else {
              ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                  backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                  textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  context: context,
                  message: SetLocalization.of(context)!
                      .getTranslateValue("no_internet_connection"));
            }
          },
        ),
      ],
    );
  }
}
