// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
//
// import '../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/advatnages_check_box/add_advantages_container_class_widget.dart';
// import '../../../core/widgets/apartments/create_apartment/container_classes_widget/containers_choose_items_class_widget/cities_container_choose_item/cities_container_choose_item_class_widget.dart';
// import '../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// import '../../../core/widgets/search_filter_classes_widget/search_filter_price_class_widget.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// class SearchFilter extends StatefulWidget {
//   const SearchFilter({Key? key}) : super(key: key);
//
//   @override
//   State<SearchFilter> createState() => _SearchFilterState();
// }
//
// class _SearchFilterState extends State<SearchFilter> {
//   //data of price box
//   var titleOfPrice = "الإجرة";
//   var subtitleofPrice = "شيكل شهري";
//   //data of city box
//   // String firstCity = 'الخليل';
//   String citBoxTitle = "المدينة";
//   // List<String> cities = [
//   //   'الخليل',
//   //   'نابلس',
//   //   'بيرزيت',
//   //   ' القدس',
//   //   'رام الله',
//   //   'طولكرم',
//   //   ' جنين',
//   //   'أريحا',
//   //   'بيت لحم',
//   //   'سلفيت',
//   // ];
//   //data of room box
//   String chooseCountRoomsText = "عدد الغرف";
//   String hintCountRooms = "0";
//   TextInputType number = TextInputType.number;
//   //data of bathrooms box
//   String chooseCountBathroomsText = "عدد الحمامات";
//   String hinCountBathrooms = "0";
//   //data of acount of studnets box
//   var countStudentText = "حدد عدد الطلاب المسموح به";
//   var countStudentHint = "0";
//   //square meters of apartment box
//   var squareText = "حدد حجم الشقة";
//   var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
//   int cityId = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: fullButton,
//                 child: const Text("حفظ"),
//               ),
//             ),
//             const Expanded(child: Text("")),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: OutlinedButton(
//                 onPressed: () {},
//                 style: outlineButton,
//                 child: const Text(" مسح الكل "),
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 50, 20, 30),
//                     child: Text(
//                       "تصفية",
//                       style: TextStyle(
//                         fontSize: 26.0,
//                         fontFamily: 'IBM',
//                         inherit: true,
//                       ),
//                     ),
//                   ),
//                   Expanded(child: Text("")),
//                 ],
//               ),
//               PriceOfSearchFilterClassWidget(
//                 title: titleOfPrice,
//                 subtitle: subtitleofPrice,
//                 inputType: TextInputType.number,
//                 highLabelName: "الادنى",
//                 textInputType: TextInputType.number,
//                 fontSize: 16,
//                 lowLabelName: "الأعلى",
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               //city box
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                 child: ContainerChooseCityItemClassWidget(
//                   title: citBoxTitle,
//                   onSelected: (c) {
//                     cityId = c.id;
//                   },
//                 ),
//               ),
//               //rooms box
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                 child: ContainerInputTextClassWidget(
//                     title: chooseCountRoomsText,
//                     hintInput: hintCountRooms,
//                     inputType: number,
//                     // focusNode: count_roomsFocusNode,
//                     onFieldSubmitted: (value) {}),
//               ),
//               //bathrooms box
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                 child: ContainerInputTextClassWidget(
//                     title: chooseCountBathroomsText,
//                     hintInput: hinCountBathrooms,
//                     inputType: number,
//                     // focusNode: count_bathroomsFocusNode,
//                     onFieldSubmitted: (value) {}),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                 padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   color: kContainerColor,
//                 ),
//                 child: Column(
//                   children: [
//                     //this row for text
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
//                           child: Text(
//                             "المزايا",
//                             style: TextStyle(
//                                 fontFamily: 'IBM',
//                                 fontSize: 20,
//                                 color: Colors.grey.shade800),
//                           ),
//                         ),
//                         const Expanded(child: Text("")),
//                       ],
//                     ),
//                     //here could owner add advantages
//                     const AddAdvantages()
//                   ],
//                 ),
//               ),
//               //countStudent padding
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                 child: ContainerInputTextClassWidget(
//                     title: countStudentText,
//                     hintInput: countStudentHint,
//                     inputType: TextInputType.number,
//                     // focusNode: countStudentFocusNode,
//                     onFieldSubmitted: (value) {}),
//               ),
//               //square padding
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                 child: ContainerInputTextClassWidget(
//                     title: squareText,
//                     hintInput: squareHint,
//                     inputType: TextInputType.number,
//                     // focusNode: squareFocusNode,
//                     onFieldSubmitted: (value) {}),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
