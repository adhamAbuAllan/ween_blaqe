import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentTitleText extends StatelessWidget {
  final OneApartment apartmentsRes;
  final int index;

  const ApartmentTitleText(
      {super.key, required this.index, required this.apartmentsRes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
