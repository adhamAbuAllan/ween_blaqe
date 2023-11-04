// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/funcations/snakbar.dart';
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: _ButtonTransition()),
//     );
//   }
// }
//
// class _ButtonTransition extends AnimatedWidget {
//   const _ButtonTransition({super.key, width}) : super(listenable: width);
//
//   Animation<double> get width => listenable
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(width: width.value)),
//       child: OutlinedButton(
//
//           onPressed: () {
//             showSnakBar(context, "you clicked me <3");
//           },
//           child: const Text("click me"),
//       ),
//     );
//
//   }
// }
