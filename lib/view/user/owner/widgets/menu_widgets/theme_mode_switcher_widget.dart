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
        inactiveThumbColor: kBackgroundAppColorLightMode,
        activeColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        dense: getIt<AppDimension>().isSmallScreen(context),
        title: Row(
          children: [
            Icon(
              themeMode.isLight
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
              size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(SetLocalization.of(context)!.getTranslateValue("appearance"),
                style: TextStyle(
                    fontSize: 16,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)),
          ],
        ),
        value: themeModeNoti.isLightMode,
        onChanged: widget.onChange);
  }
}

// class ThemeModeSwitcherWidget extends ConsumerWidget {
//   const ThemeModeSwitcherWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SwitchListTile(
//         inactiveThumbColor: kBackgroundAppColorLightMode,
//         activeColor:
//             themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
//         dense: getIt<AppDimension>().isSmallScreen(context),
//         title: Row(
//           children: [
//             Icon(
//               themeMode.isLight
//                   ? Icons.light_mode_outlined
//                   : Icons.dark_mode_outlined,
//               color:
//                   themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
//               size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
//             ),
//             const SizedBox(
//               width: 18,
//             ),
//             Text(SetLocalization.of(context)!.getTranslateValue("appearance"),
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: themeMode.isLight
//                         ? kTextColorLightMode
//                         : kTextColorDarkMode)),
//           ],
//         ),
//         value: themeMode.isLight,
//         onChanged: (bool value) async {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       ref.read(cityNotifier).copyWith(cityId: 0);
//       ref.read(switcherThemeModeNotifier.notifier).toggleTheme(!themeMode
//           .isLight);
//     });
//
//           // myPushNameAnimation(context);
//         });
//   }
// }
