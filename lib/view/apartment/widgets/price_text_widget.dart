import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

class ApartmentPriceTextWidget extends ConsumerWidget {
  const ApartmentPriceTextWidget({super.key,required this.index, required this.apartmentsRes});
  final Apartments apartmentsRes;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "${SetLocalization.of(context)!.getTranslateValue("rent")}: "
                "${apartmentsRes.data?[index].price ?? ""
            // data.

            } ",
            style: TextStyle(
              color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 3, 4),
          child: Text(SetLocalization.of(context)!.getTranslateValue("shekel_per_month"),
              style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

                fontWeight: FontWeight.w300 ,
                fontSize: 15,

              )),
        ),
      ],
    ) ;
  }
}
