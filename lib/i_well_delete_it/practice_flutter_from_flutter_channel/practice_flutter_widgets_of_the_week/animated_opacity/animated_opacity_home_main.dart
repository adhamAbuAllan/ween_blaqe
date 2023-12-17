// import 'package:flutter/material.dart';
//
// main() {
//   runApp(const MaterialApp(
//     home: _Home(),
//   ));
// }
//
// class _Home extends StatefulWidget {
//   const _Home();
//
//   @override
//   State<_Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<_Home> {
//    double _currentOpacity = .1;
//    bool isOpacity = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: GestureDetector(
//             onLongPress: (){
//           setState(() {
//             _currentOpacity = 1;
//             isOpacity = false;
//           });
//           },
//             onLongPressCancel: (){setState(() {
//           _currentOpacity = .1;
//           isOpacity = true;
//
//
//             });},
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AnimatedOpacity(
//                   duration: const Duration(seconds: 1),
//                   opacity: _currentOpacity,
//                   curve: Curves.easeInSine,
//                   child: Container(
//                 color: isOpacity ? Colors.red : Colors.blue ,
//                 width: 100,
//                 height: 100,
//           ),
//                 ),
//                 isOpacity ? const Text("اضغط مطولاً على المربع",style: TextStyle(fontSize: 24)):const Text("اضغط مرتان على المربع",style: TextStyle(fontSize: 24),)
//
//               ],
//             ),
//           )),
//     );
//   }
// }
