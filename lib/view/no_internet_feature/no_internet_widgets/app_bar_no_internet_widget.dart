

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
class AppBarNoInternetWidget extends ConsumerWidget  implements PreferredSizeWidget {
  const AppBarNoInternetWidget ({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        title: Text(SetLocalization.of(context)!.getTranslateValue("sebha")));
 
  }
}