import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../methods/local_methods/connectivity_notifier.dart';
import '../statuses/connectivity_state.dart';
  final connectivityNotifier =
StateNotifierProvider<ConnectivityNotifier, ConnectivityState>(
        (ref) => ConnectivityNotifier());
