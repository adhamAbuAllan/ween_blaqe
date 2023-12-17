// // import 'dart:html';
//
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
//
// class AnimatedTextKitHome extends StatefulWidget {
//   const AnimatedTextKitHome({super.key});
//
//   @override
//   State<AnimatedTextKitHome> createState() => _AnimatedTextKitHomeState();
// }
//
// class _AnimatedTextKitHomeState extends State<AnimatedTextKitHome> {
// bool stopPauseOnTap = false;
// int puse = 0;
// bool isClick = true;
// int totalRepeatCount = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(
//
//         child: Column(
//           children: [
//             AnimatedTextKit(
//               // onNext: (p0,p1){
//               //   debugPrint("p0 : $p0");
//               //   debugPrint("p1 : $p1");
//               //   p0 == 2? p1 = true : false;
//               // },
//               // stopPauseOnTap: true,
//               isRepeatingAnimation: false,
//               totalRepeatCount: totalRepeatCount + 1,
//               repeatForever:true,
//
//
//
//               // onNext: (p0,p1){
//               //   debugPrint("p0 : $p0");
//               //     debugPrint("p1 : $p1");
//               //     setState(() {
//               //       isClick? puse = 100 : puse=0 ;
//               //
//               //     });
//               //
//               // },
//               // onTap: (){
//               //
//               // },
//               onNext: (p0, p1) {
//                 isClick = false;
//               },
//               animatedTexts: [
//              isClick ?  FadeAnimatedText("",):FadeAnimatedText("number 1",) ,
//
//
//
//
//
//             ],),
//           ],
//         )),);
//   }
// }
