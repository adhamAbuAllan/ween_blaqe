

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoutesPractice{
  static const screen1 = "/screen1";
  static const screen2 = "/screen2";
  static const screen3 = "/screen3";
  static const screen4 = "/screen4";
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Column(
      children: [
        ElevatedButton(
          onPressed: ()=>context.go(MyRoutesPractice.screen3),
          child: Text("screen3"),),

        Text("Screen3"),
      ],
    ),),);
  }
}