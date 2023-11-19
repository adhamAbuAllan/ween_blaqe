import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';


class ApartmentTitleText extends StatelessWidget {
 final OneApartment apartmentsRes;
 final int index;

  const ApartmentTitleText(
      {super.key, required this.index, required this.apartmentsRes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text((apartmentsRes.data?[index].title ?? ""),
          style: TextStyle(
            color: Colors.black.withOpacity(.7),
            fontFamily: 'IBM',
            fontSize: 15,
          )),
    );
  }
}
