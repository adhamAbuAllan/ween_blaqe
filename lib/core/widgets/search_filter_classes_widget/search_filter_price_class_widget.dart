// import 'package:flutter/material.dart';
//
//
//
// import 'package:ween_blaqe/constants/nums.dart';
// import '../registration/text_filed_class_widget.dart';
//
// class PriceOfSearchFilterClassWidget extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final TextInputType inputType;
//   final FocusNode? focusNode;
//   final Function? onFieldSubmitted;
//   final String highLabelName;
//   final double fontSize;
//   final TextInputType textInputType;
//   final String? lowLabelName;
//   const PriceOfSearchFilterClassWidget(
//       {Key? key,
//       required this.title,
//       required this.subtitle,
//       required this.inputType,
//       this.focusNode,
//       this.onFieldSubmitted,
//       required this.highLabelName,
//       required this.textInputType,
//       required this.fontSize,
//       this.lowLabelName})
//       : super(key: key);
//   @override
//   State<PriceOfSearchFilterClassWidget> createState() =>
//       _PriceOfSearchFilterClassWidgetState();
// }
//
// class _PriceOfSearchFilterClassWidgetState
//     extends State<PriceOfSearchFilterClassWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // var hintInput = widget.subtitle;
//     // var inputType = widget.inputType;
//     // var focusNode = widget.focusNode;
//     var title = widget.title;
//     var highLabelName = widget.highLabelName;
//     var textInputType = widget.textInputType;
//     var fontSize = widget.fontSize;
//     var lowLabelName = widget.lowLabelName;
//     return Container(
//       margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//       // height: 156,
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(7),
//         color: kContainerColor,
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.grey.shade800,
//                     fontSize: 18,
//                     
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                 child: Text(
//                   "شيكل/شهري",
//                   style: TextStyle(
//                     color: Colors.grey.shade500,
//                     fontSize: 14,
//                     
//                   ),
//                 ),
//               ),
//               const Expanded(child: Text("")),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFieldClassWdiget(
//                       labelName: highLabelName,
//                       textInputType: textInputType,
//                       fontSize: fontSize),
//                 ),
//                 Expanded(
//                     child: TextFieldClassWdiget(
//                         labelName: lowLabelName ?? "",
//                         textInputType: textInputType,
//                         fontSize: fontSize)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
