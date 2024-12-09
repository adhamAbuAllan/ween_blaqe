import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';

import '../../statuses/connectivity_state.dart';
class ConnectivityNotifier extends StateNotifier<ConnectivityState> {
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityNotifier() : super(ConnectivityState
    (connectivity:ConnectivityResult.wifi)) {

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
          (result) {
        state = state.copyWith(connectivity: result);
      },
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  bool get isConnected => state.connectivity != ConnectivityResult.none;

  void markSnackBarAsShown() {
    state = state.copyWith(isSnackBarShown: true);
  }

  void setResponseOk(bool value) {
    state = state.copyWith(isResponseOk: value);
  }
  Future<void> handleConnectivityChange(
      BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(connectivityNotifier.notifier);

    if (!notifier.isConnected) {
        notifier.setResponseOk(false);

    } else {
    notifier.setResponseOk(true);

    }

    notifier.markSnackBarAsShown();
  }

}
