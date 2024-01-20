import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentShowTypesPointer extends StatelessWidget {
  const ApartmentShowTypesPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:
          kPrimaryColor,
          borderRadius:
          BorderRadiusDirectional
              .circular(
              7 / 2),
          border: Border.all(
              color: kPrimaryColor300,
              strokeAlign:
              BorderSide
                  .strokeAlignOutside,
              width: 7 / 2)),
      width: 50 / 2.7,
      height: 50 / 2.7,
    );
  }
}
