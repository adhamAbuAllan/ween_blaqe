import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../methods/local_methods/switcher_theme_mode.dart';

final themeModeNotifier = StateNotifierProvider<ThemeModeNotifier, bool>((ref) {
  return ThemeModeNotifier();
});

//EB9B6A->GOLD
//WHITE
//GRAY -> E6E6E6
//06273A -> DARK BLUE

// dark theme
final containerColorDark =
    StateProvider<Color>((ref) => const Color(0xf3333333));
final primaryColorDark = StateProvider<Color>((ref) => const Color(0xFF2196F3));
final primaryColor300Dark =
//FF64B5F6
    StateProvider<Color>((ref) => const Color(0xFF90CAF9));
final textColorDark = StateProvider<Color>((ref) => const Color(0xfdfCfCfC));
final backgroundAppColorDark =
    StateProvider<Color>((ref) => const Color(0xff2B2B2B));

// light theme
final containerColorLight =
    StateProvider<Color>((ref) => const Color(0xffffffff));
final primaryColorLight =
    StateProvider<Color>((ref) => const Color(0xFF2196F3));
final primaryColor300Light =
    StateProvider<Color>((ref) => const Color(0xFFE3F2FD));
final textColorLight = StateProvider<Color>((ref) => const Color(0xdd000000));
final backgroundAppColorLight =
    StateProvider<Color>((ref) => const Color(0xffeeeeee));
