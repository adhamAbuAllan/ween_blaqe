// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
// class ProcessOfPay extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   const ProcessOfPay({Key? key, required this.title, required this.subtitle})
//       : super(key: key);
//
//   @override
//   State<ProcessOfPay> createState() => _ProcessOfPayState();
// }
//
// class _ProcessOfPayState extends State<ProcessOfPay> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//       // height: 140,
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(7),
//         color: kContainerColor,
//
//       ),
//       child: Column(
//         children: [
//            Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                 child: Text(
//                   widget.title,
//                   style: TextStyle(
//                     color: Colors.grey.shade800,
//                     fontSize: 18,
//                     fontFamily: 'IBM',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
//                 child: Row(
//                   children: [
//                     Image(
//                       image: AssetImage("assets/images/alert.png"),
//                       width: 28,
//                       height: 28,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
//                       child: Text(
//                         "هام",
//                         style: TextStyle(
//                             color: Colors.redAccent,
//                             fontSize: 18,
//                             fontFamily: 'IBM'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                 child: Text(
//                   widget.subtitle,
//                   style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontSize: 15,
//                       fontFamily: 'IBM'),
//                 ),
//               ),
//               const Expanded(
//                 child: Text(""),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
