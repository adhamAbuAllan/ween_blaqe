import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../main.dart';

class ThemeModeNotifier extends StateNotifier<SwitcherThemeModeNotifier> {
  ThemeModeNotifier() : super(SwitcherThemeModeNotifier());

  bool get isLightMode => super.state.state;

  Color containerTheme({required WidgetRef ref}) {

      return isLightMode
          ? ref.read(containerColorLight)
          : ref.read(containerColorDark);

  }
  Color primaryTheme({required WidgetRef ref}) {

      return isLightMode
          ? ref.read(primaryColorLight)
          : ref.read(primaryColorDark);
  }
  Color primary300Theme({required WidgetRef ref}) {

      return isLightMode
          ? ref.read(primaryColor300Light)
          : ref.read(primaryColor300Dark);
  }
  Color textTheme({required WidgetRef ref}) {

      return isLightMode
          ? ref.read(textColorLight)
          : ref.read(textColorDark);
  }
  Color backgroundAppTheme({required WidgetRef ref}) {

      return isLightMode
          ? ref.read(backgroundAppColorLight)
          : ref.read(backgroundAppColorDark);
  }
}


class SwitcherThemeModeNotifier extends StateNotifier<bool> {
  SwitcherThemeModeNotifier() : super(false) {
    loadThemeMode();
  }

  Future<void> toggleTheme(bool isLight) async {
    state = isLight; // Update the state
    await saveThemeMode(isLight);
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
}
