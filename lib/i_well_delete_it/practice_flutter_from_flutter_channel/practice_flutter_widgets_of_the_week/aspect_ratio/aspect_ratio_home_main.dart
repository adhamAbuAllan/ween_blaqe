import 'package:flutter/material.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Expanded(child: Align(
        alignment: Alignment.topCenter,
        child: AspectRatio(
        aspectRatio:2.2009,
        child: Container(color: Colors.deepOrangeAccent,),
      ),),),
    ),);
  }
}
