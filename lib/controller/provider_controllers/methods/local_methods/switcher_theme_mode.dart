import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/nums.dart';
import '../../../../main.dart';

class ThemeModeNotifier extends StateNotifier<bool> {
  ThemeModeNotifier() : super(false) {
    loadThemeMode();
  }

  bool get isLightMode => state;

  void toggleThemeMode(value) {
    state = value;
    themeMode.onChanged(value);
    saveThemeMode(value);
    debugPrint("Theme mode updated to: ${state ? 'Light' : 'Dark'}");
  }

  Future<void> saveThemeMode(bool isLight) async {
    (await sp).setBool('isLightMode', isLight);
    debugPrint("Saved theme mode to SharedPreferences: $isLight");
  }

  Future<void> loadThemeMode() async {
    state =
        (await sp).getBool('isLightMode') ?? false; // Default to false (Dark
    // mode)
    debugPrint(
        "Loaded theme mode from SharedPreferences: ${state ? 'Light' : 'Dark'}");
  }

  Color containerTheme({required WidgetRef ref, double? withOpacity}) {
    return (isLightMode
        ? ref.read(containerColorLight)
        : ref.read(containerColorDark)).withOpacity(withOpacity ?? 1);
  }

  Color primaryTheme({required WidgetRef ref, double? withOpacity}) {
    return withOpacity == null
        ? (isLightMode
            ? ref.read(primaryColorLight)
            : ref.read(primaryColorDark))
        : (isLightMode
            ? ref.read(primaryColorLight).withOpacity(withOpacity)
            : ref.read(primaryColorDark).withOpacity(withOpacity));
  }

  Color primary300Theme({required WidgetRef ref}) {
    return isLightMode
        ? ref.read(primaryColor300Light)
        : ref.read(primaryColor300Dark);
  }

  Color textTheme({required WidgetRef ref, double? withOpacity}) {
    return withOpacity == null
        ? (isLightMode ? ref.read(textColorLight) : ref.read(textColorDark))
        : (isLightMode
            ? ref.read(textColorLight).withOpacity(withOpacity)
            : ref.read(textColorDark).withOpacity(withOpacity));
  }

  Color backgroundAppTheme({required WidgetRef ref}) {
    return isLightMode
        ? ref.read(backgroundAppColorLight)
        : ref.read(backgroundAppColorDark);
  }
}
/*
ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)
ref.read(themeModeNotifier.notifier).primary300Theme(ref: ref),

 */
