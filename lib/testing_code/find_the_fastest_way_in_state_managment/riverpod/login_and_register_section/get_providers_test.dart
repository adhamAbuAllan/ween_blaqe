import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_controller_test.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
      (ref) => LoginNotifier(),

);
final isObscureProvider = StateProvider<bool>((ref) => true);
final globalPhoneKeyProvider = Provider<GlobalKey<FormState>>((ref) =>
    GlobalKey<FormState>());
final globalPasswordKeyProvider = Provider<GlobalKey<FormState>>((ref) =>
    GlobalKey<FormState>());
final phoneControllerProvider = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());  // Dispose when the provider is disposed
  return controller;
});
final passwordControllerProvider = StateProvider<TextEditingController>((ref)
{
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());  // Dispose when the provider is disposed
  return controller;
});

