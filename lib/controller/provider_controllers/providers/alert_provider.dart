import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../methods/local_methods/alert_notifier.dart';
import '../statuses/alert_state.dart';
final alertNotifier =
StateNotifierProvider<AlertNotifier,AlertState>(
        (ref) =>AlertNotifier());
