import 'dart:math';
import 'package:flutter/material.dart';
class AnimatedBuilderHome extends StatefulWidget {
  const AnimatedBuilderHome({super.key});

  @override
  State<AnimatedBuilderHome> createState() => _AnimatedBuilderHomeState();

}

class _AnimatedBuilderHomeState extends State<AnimatedBuilderHome>with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {

return const Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  AnimatedBuilderWithRotate(),
  AnimatedBuilderWithScale(),
    AnimatedBuilderOnly()
  ],);  }
}
//
class AnimatedBuilderWithScale extends StatefulWidget {
  const AnimatedBuilderWithScale({super.key});

  @override
  State<AnimatedBuilderWithScale> createState() => _AnimatedBuilderWithScaleState();
}

class _AnimatedBuilderWithScaleState extends State<AnimatedBuilderWithScale> with TickerProviderStateMixin{
  late AnimationController controller ;
  @override
  void initState(){
  super.initState();
  controller = AnimationController(
    duration: const Duration(seconds:2), vsync:this,

  )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0,end: 2 * pi).animate(controller);

    return AnimatedBuilder(animation: animation, builder: (ctx,child){
      return Transform.scale(


        // angle: animation.value.toDouble()
        scale: animation.value.toDouble(),
        // transformHitTests,
        child: FlutterLogo(size: 75,),);
    });
  }
}
//
class AnimatedBuilderWithRotate extends StatefulWidget {
  const AnimatedBuilderWithRotate({super.key});

  @override
  State<AnimatedBuilderWithRotate> createState() => _AnimatedBuilderWithRotateState();
}

class _AnimatedBuilderWithRotateState extends State<AnimatedBuilderWithRotate> with TickerProviderStateMixin{
  late AnimationController controller ;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds:2), vsync:this,

    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0,end: 2 * pi).animate(controller);

    return AnimatedBuilder(animation: animation, builder: (ctx,child){
      return Transform.rotate(


        angle: animation.value.toDouble(),
        // transformHitTests,
        child: FlutterLogo(size: 75,),);
    });
  }
}
class AnimatedBuilderOnly extends StatefulWidget {
  const AnimatedBuilderOnly({super.key});

  @override
  State<AnimatedBuilderOnly> createState() => _AnimatedBuilderOnlyState();
}

class _AnimatedBuilderOnlyState extends State<AnimatedBuilderOnly> with TickerProviderStateMixin{
  late AnimationController controller ;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds:2), vsync:this,

    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0,end: 2 * pi).animate(controller);

    return AnimatedBuilder(
       child:FlutterLogo(size: 75,) , animation: animation, builder: (BuildContext context, Widget? child) { return Text("animatoin app "); },);
  }
}
