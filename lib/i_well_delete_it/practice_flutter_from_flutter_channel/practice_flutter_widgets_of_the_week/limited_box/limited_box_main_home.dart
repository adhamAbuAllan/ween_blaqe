import 'package:flutter/material.dart';
import 'dart:math' as math;

void main(){
  runApp(const MaterialApp(home:_Home()));
}
class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [
      for(var i = 0; i<10; i++)
        LimitedBox(
          maxHeight: 150*2,

          child: Container(color:Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
            ,),)
    ],),);
  }

}

