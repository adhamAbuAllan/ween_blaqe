import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class TitleRegCompletedWidget extends ConsumerWidget {
  const TitleRegCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleScreenWidget(),
        NameOfApp(),
      ],
    );
  }
}

class TitleScreenWidget extends ConsumerWidget {
  const TitleScreenWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return
        //title signup
        Padding(
      padding: EdgeInsets.fromLTRB(
          20, getIt<AppDimension>().isSmallScreen(context) ? 20 : 30, 20, 0),
      child: Text(
        SetLocalization.of(context)!.getTranslateValue("start_registration"),
        style: TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
          inherit: true,
          fontWeight: FontWeight.w600,
          color:
          ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        ),
      ),
    );
    //nameApp
  }
}

class NameOfApp extends ConsumerWidget {
  const NameOfApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
        children: [
          Text(
            SetLocalization.of(context)!.getTranslateValue("in"),
            style: TextStyle(
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
                inherit: true,
                fontWeight: FontWeight.w600,
                color:
                ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
),
          ),
          Text(
            SetLocalization.of(context)!.getTranslateValue("ween_balaqee"),
            style: TextStyle(
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
              inherit: true,
              color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
