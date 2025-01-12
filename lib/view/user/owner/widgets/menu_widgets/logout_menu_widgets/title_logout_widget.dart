import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../controller/provider_controllers/providers/color_provider.dart';

class TitleLogoutWidget extends ConsumerWidget {
  const TitleLogoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [_Title(), _SubTitle()],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              20,
              getIt<AppDimension>().isSmallScreen(context) ? 50 / 1.6 : 50,
              20,
              0),
          child: Text(
            SetLocalization.of(context)!.getTranslateValue("my_account"),
            style: TextStyle(
              color:
    ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 22 : 26,
              fontWeight: FontWeight.w600,
              inherit: true,
            ),
          ),
        ),
        const Expanded(child: Text("")),
      ],
    );
  }
}

class _SubTitle extends ConsumerWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20,
          getIt<AppDimension>().isSmallScreen(context) ? 75 / 1.5 : 75),
      child: SizedBox(
        width: getIt<AppDimension>().isMediumScreen(context) ? 300 : 400,
        child: Text(
          // "قم بتسجيل الدخول لتحجز اول شقة لك ",
          SetLocalization.of(context)!
              .getTranslateValue("booking_no_account_required"),
          style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'IBM'),
          softWrap: true,
        ),
      ),
    );
  }
}
