import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/nums.dart';

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
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
            fontSize: 14),
      ),
    )
    ;
  }
}
