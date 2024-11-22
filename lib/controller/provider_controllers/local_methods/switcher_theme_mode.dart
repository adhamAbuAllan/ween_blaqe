import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';

  class SwitcherThemeModeNotifier extends StateNotifier<bool> {
  SwitcherThemeModeNotifier() : super(false){
    loadThemeMode();
  }
  Future<void> toggleTheme(bool isLight) async {
    state = isLight; // Update the state
    await saveThemeMode(isLight);
    debugPrint("Theme mode updated to: ${state ? 'Light' : 'Dark'}");
  }
  Future<void> saveThemeMode(bool isLight) async {

    (await sp ).setBool('isLightMode', isLight);
    debugPrint("Saved theme mode to SharedPreferences: $isLight");
  }
  Future<void> loadThemeMode() async {
    state = (await sp).getBool('isLightMode') ?? false; // Default to false (Dark
    // mode)
    debugPrint("Loaded theme mode from SharedPreferences: ${state ? 'Light' : 'Dark'}");
  }

  
}
