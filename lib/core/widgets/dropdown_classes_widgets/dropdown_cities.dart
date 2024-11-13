// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// import '../../../controller/auth_provider.dart';
//
// /// delete this file
//
//
// class DropDownCity extends StatefulWidget {
//   const DropDownCity({
//     Key? key,
//     required this.onSelected
//   }) : super(key: key);
//
//   final Function(dynamic) onSelected;
//   @override
//   State<DropDownCity> createState() => _DropDownCityState();
// }
//
// class _DropDownCityState extends State<DropDownCity> {
//   // get publicCurrentCity => currentCity;
//   // set publicCurrentCity(int value)=>currentCity = currentCity;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
//         child: readyCityAndTypeOfApartmentApi.dataStatus
//             ? DropdownButtonFormField<dynamic>(
//                 style: const TextStyle(fontSize: 15),
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(
//                         color: themeMode.isDark
//                             ? kPrimaryColorLightMode
//                             : kPrimaryColor300DarkMode,
//                         width: 0.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(
//                         color: themeMode.isDark
//                             ? kPrimaryColorLightMode
//                             : kPrimaryColorDarkMode,
//                         width: 1),
//                   ),
//                 ),
//             dropdownColor:
//             themeMode.isDark ?
//             kContainerColorLightMode:kContainerColorDarkMode ,
//             value: readyCityAndTypeOfApartmentApi.oneCityName,
//                 items: readyCityAndTypeOfApartmentApi.citiesName
//                     .map(
//                       (c) => DropdownMenuItem(
//                         value: c,
//                         child: Text(c,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: themeMode.isDark
//                                     ? kTextColorLightMode
//                                     : kTextColorDarkMode,
//                                 fontFamily: 'IBM')),
//                       ),
//                     )
//                     .toList(),
//                 onChanged:widget.onSelected
//               )
//             : SizedBox(
//                 child: Text("جاري التحميل..",
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: themeMode.isDark ? kTextColorLightMode:kTextColorDarkMode,
//                         fontFamily: 'IBM')),
//               ));
//   }
// }
