import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentPriceText extends StatelessWidget {
  const ApartmentPriceText({super.key, required this.index, required this.apartmentsRes});
 final OneApartment apartmentsRes;
   final int index;

  @override
  Widget build(BuildContext context) {
    return               Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
          child:
          Text((apartmentsRes.data?[index].price.toString()) ?? "0",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontFamily: 'IBM',
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
          child: Text("ش/ش",
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 12,
                fontFamily: 'IBM',
              )),
        ),
      ],
    );

  }
}
