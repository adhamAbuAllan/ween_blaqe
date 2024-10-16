import 'package:flutter/material.dart';

import '../../../../../api/apartments_api/one_apartment.dart';
import '../../../../../constants/nums.dart';

class ApartmentLocatoinText extends StatelessWidget {
  const ApartmentLocatoinText(
      {super.key, required this.index, required this.apartmentsRes});

  final OneApartment apartmentsRes;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        child: Text(
          "المكان:${apartmentsRes.data?[index].city?.name ?? ""

          // data.
          }-${apartmentsRes.data?[index].location ?? ""
          // .data

          }",
          softWrap: true,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            color:
                themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            fontFamily: 'IBM',
          ),
        ),
      ),
    );
  }
}
//if you want to change above widget to this widget
// Padding(
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//               child: Text("الموقع:",
//                   style: TextStyle(
//                     color: Colors.grey,
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//               child: Text("$city-$location",
//                   style: const TextStyle(
//                     color: Colors.grey,
//                   )),
//             ),
