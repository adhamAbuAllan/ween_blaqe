
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../methods/local_methods/connectivity_notifier.dart';

final connectivityProvider =
StateNotifierProvider<ConnectivityNotifier, ConnectivityState>(
        (ref) => ConnectivityNotifier());

/// State class to hold connectivity-related values
class ConnectivityState {
  final ConnectivityResult connectivity;
  late final bool isSnackBarShown;
  final bool isResponseOk;

  ConnectivityState({
    required this.connectivity,
    this.isSnackBarShown = false,
    this.isResponseOk = false,
  });

  ConnectivityState copyWith({
    ConnectivityResult? connectivity,
    bool? isSnackBarShown,
    bool? isResponseOk,
  }) {
    return ConnectivityState(
      connectivity: connectivity ?? this.connectivity,
      isSnackBarShown: isSnackBarShown ?? this.isSnackBarShown,
      isResponseOk: isResponseOk ?? this.isResponseOk,
    );
  }
}
