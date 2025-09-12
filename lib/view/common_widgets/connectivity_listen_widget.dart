import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';

import '../../controller/provider_controllers/providers/connectivity_provider.dart';
import '../../controller/provider_controllers/statuses/connectivity_state.dart';

class ConnectivityListenWidget extends ConsumerWidget {
  const ConnectivityListenWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ConnectivityState>(connectivityNotifier, (previous, next) {
      if (!ref.watch(connectivityNotifier.notifier).isConnected) {
        ref.watch(showSnackBarNotifier.notifier).showSnackBar(context:
        context,ref: ref,
            icon: Icons.wifi_off);


      } else {

        ref.watch(showSnackBarNotifier.notifier).showSnackBar(context: context,
    ref: ref,
            icon: Icons.wifi);
      }
    });

    return child;
  }
}
