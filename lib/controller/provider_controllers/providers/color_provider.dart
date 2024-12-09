import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../methods/local_methods/switcher_theme_mode.dart';

final themeModeNotifier =
    StateNotifierProvider<ThemeModeNotifier, SwitcherThemeModeNotifier>((ref) {
  return ThemeModeNotifier();
});
final switcherThemeModeNotifier =
    StateNotifierProvider<SwitcherThemeModeNotifier, bool>((ref) {
  return SwitcherThemeModeNotifier();
});

// dark theme
final containerColorDark =
    StateProvider<Color>((ref) => const Color(0xf3333333));
final primaryColorDark = StateProvider<Color>((ref) => const Color(0xffca7733));
final primaryColor300Dark =
    StateProvider<Color>((ref) => const Color(0x99FFB74D));
final textColorDark = StateProvider<Color>((ref) => const Color(0xfdfCfCfC));
final backgroundAppColorDark =
    StateProvider<Color>((ref) => const Color(0xff2B2B2B));

// light theme
final containerColorLight =
    StateProvider<Color>((ref) => const Color(0xffffffff));
final primaryColorLight =
    StateProvider<Color>((ref) => const Color(0xffff9800));
final primaryColor300Light =
    StateProvider<Color>((ref) => const Color(0xFFFFB74D));
final textColorLight = StateProvider<Color>((ref) => const Color(0xdd000000));
final backgroundAppColorLight =
    StateProvider<Color>((ref) => const Color(0xffeeeeee));