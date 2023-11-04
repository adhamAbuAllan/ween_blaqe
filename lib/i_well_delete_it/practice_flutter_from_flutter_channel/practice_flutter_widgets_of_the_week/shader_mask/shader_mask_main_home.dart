import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Center(
      child: ShaderMask(
        shaderCallback: (bounds)=>
        const RadialGradient(
            radius: 1,
            center: Alignment.topLeft,
            tileMode: TileMode.mirror,
            // focalRadius: ,
            transform: GradientRotation(.6),
            colors: [Colors.yellow,Colors.deepOrange]).createShader(bounds),
        // child: Image.asset(Assets.imagesWhatsapp),
        child: const Text('Buring Text!',

          style: TextStyle(fontSize: 24,color: Colors.white),),
      ),
    ),);
  }
}
