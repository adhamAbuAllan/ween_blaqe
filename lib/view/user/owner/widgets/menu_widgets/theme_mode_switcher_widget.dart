import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';

class ThemeModeSwitcherWidget extends ConsumerStatefulWidget {
  const ThemeModeSwitcherWidget({super.key, this.onChange});

  final Function(bool value)? onChange;

  @override
  ConsumerState createState() => _ThemeModeSwitcherWidgetState();
}

class _ThemeModeSwitcherWidgetState
    extends ConsumerState<ThemeModeSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    final themeModeNoti = ref.watch(themeModeNotifier.notifier);

    return SwitchListTile(
        inactiveThumbColor: ref.read(backgroundAppColorLight),
        activeColor:
        ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

        dense: getIt<AppDimension>().isSmallScreen(context),
        title: Row(
          children: [
            Icon(
              themeModeNoti.isLightMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color:
              ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

              size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(SetLocalization.of(context)!.getTranslateValue("appearance"),
                style: TextStyle(
                    fontSize: 16,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                )),
          ],
        ),
        value: themeModeNoti.isLightMode,
        onChanged: widget.onChange);
  }
}
