
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ApartmentTitleTextWidget extends ConsumerWidget {
  final Apartments apartmentsRes;
  final int index;
  const ApartmentTitleTextWidget({super.key,required this.index, required
  this.apartmentsRes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [SizedBox(
        width: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(apartmentsRes.data?[index].title ?? "",
              softWrap: true,
              style: TextStyle(
                color:
                themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      )],
    ) ;
  }
}
