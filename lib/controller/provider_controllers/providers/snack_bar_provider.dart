import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/local_methods/show_snack_bar_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/show_snack_bar_state.dart';

final showSnackBarNotifier =
StateNotifierProvider<ShowSnackBarNotifier,ShowSnackBarState>(
        (ref) =>ShowSnackBarNotifier());
