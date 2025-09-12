import 'package:connectivity_plus/connectivity_plus.dart';
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
