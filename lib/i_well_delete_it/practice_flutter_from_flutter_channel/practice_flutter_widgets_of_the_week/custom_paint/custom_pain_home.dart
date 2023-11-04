import 'package:flutter/material.dart';
class CustomPaintHome extends StatelessWidget {
  const CustomPaintHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomPaint(size: Size(200,100,),painter:MyPainter(),));
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    canvas.drawLine(Offset.infinite, Offset.infinite, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}