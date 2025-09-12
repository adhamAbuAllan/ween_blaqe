import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../api/apartments_api/apartments.dart';

class ApartmentAgoDateTextWidget extends ConsumerWidget {
  const ApartmentAgoDateTextWidget({super.key,this.oneApartment});

  final DataOfOneApartment? oneApartment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return                   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "${oneApartment?.timeAgo} ",
        style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            fontSize: 14),
      ),
    )
    ;
  }
}
