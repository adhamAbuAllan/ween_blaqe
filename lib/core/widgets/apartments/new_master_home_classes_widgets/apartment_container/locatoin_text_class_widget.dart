import 'package:flutter/material.dart';

import '../../../../../api/apartments_api/one_apartment.dart';
import '../../../../../constants/nums.dart';
class ApartmentLocatoinText extends StatelessWidget {
  const ApartmentLocatoinText({super.key, required this.index, required this.apartmentsRes});
 final OneApartment apartmentsRes;
  final int index;

  @override
  Widget build(BuildContext context) {
    return               SizedBox(
      child: Row(
        children: [
           Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text("الموقع:",
                style: TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                  fontSize: 16,
                  fontFamily: 'IBM',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(apartmentsRes.data?[index].city?.name ?? "",
                softWrap: true,
                style:  TextStyle(
                  color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                  fontSize: 16,
                  fontFamily: 'IBM',
                )),
          )
        ],
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
