import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class AnimatePractice extends StatelessWidget {
  const AnimatePractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(),SlideEffect()],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
         Text("Hello World!",style: TextStyle(fontSize: 30),),
         Text("Your welcome",style: TextStyle(fontSize: 30),),
         Text("Thanks",style: TextStyle(fontSize: 30),),

      ].animate()          .slideX()
      )
    );
  }
}
