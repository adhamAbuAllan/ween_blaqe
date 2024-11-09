// import 'package:flutter/material.dart';
// import '../../../../../../../constants/nums.dart';
// import '../../../../../dropdown_classes_widgets/dropdown_type_of_apartment.dart';
//
//
//
//
//
// class ContainerChooseTypeApartmentItemClassWidget extends StatefulWidget {
//  final  String title;
//
//   const ContainerChooseTypeApartmentItemClassWidget({Key? key,
//     required this.title,
//
//   }) : super(key: key);
//   @override
//   ContainerChooseTypeApartmentItemClassWidgetState createState() => ContainerChooseTypeApartmentItemClassWidgetState();
// }
// class ContainerChooseTypeApartmentItemClassWidgetState extends State<ContainerChooseTypeApartmentItemClassWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//         height: 140,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           color: kContainerColor,
//         ),
//         child: Column(
//             children: [
//               //
//               Row(
//                 children: [
//                   Padding(
//                     padding:  const EdgeInsets.fromLTRB(0, 10, 10,10),
//                     child: Text(widget.title,
//                       style: TextStyle(
//                         color: Colors.grey.shade800,
//                         fontSize: 14,
//                         
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//                const Padding(
//                   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: DropDownTypeOfApartment()
//               ),
//
//             ])
//     );
//   }
// }
