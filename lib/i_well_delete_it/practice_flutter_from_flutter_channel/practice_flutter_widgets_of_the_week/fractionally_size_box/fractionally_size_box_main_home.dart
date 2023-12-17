// import 'package:flutter/material.dart';
//
// main() {
//   runApp(MaterialApp(
//     home: _Home(),
//   ));
// }
//
// class _Home extends StatelessWidget {
//   const _Home();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("هذه المراباعات ليست تحت تأثير fractionallySizeBox  "),
//
//             Align(
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//
//                     Opacity(
//                       opacity: .3,
//                       child: Container(
//
//                 color: Colors.black38,
//                 width: 100+150+10,
//                 height: 100+150,
//               ),
//                     ),
//                   Row(
//                   children: [
//                     Container(
//                       color: Colors.green,
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(width: 10,),
//                     Container(
//                       color: Colors.red,
//                       width: 150,
//                       height: 150,
//                     )
//                   ],
//                 )],
//
//               ),
//             ),
//             const Text("هذه المراباعات تحت تأثير fractionallySizeBox  "),
//
//
//             FractionallySizedBox(
//               widthFactor: .2,
//               child: Column(
//
//                 children: [
//
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     color: Colors.red,
//                     width: 200,
//                     height: 200,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     color: Colors.green,
//                     width: 100,
//                     height: 100,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
