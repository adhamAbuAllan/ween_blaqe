import 'package:flutter_riverpod/flutter_riverpod.dart';
//handel the password container to support this class
//container of password use setState.
class ObscureNotifier extends StateNotifier<bool> {
  ObscureNotifier() : super(true); // Initial state is set to true (obscured)

  void toggle() => state = !state; // Method to toggle the obscured state
}

final obscureProvider = StateNotifierProvider<ObscureNotifier, bool>(
      (ref) => ObscureNotifier(),
);
