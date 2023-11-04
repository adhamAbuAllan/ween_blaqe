import 'package:animations/animations.dart';
import 'package:flutter/material.dart';



class AnimationHome extends StatefulWidget {
  const AnimationHome({super.key});

  @override
  State<AnimationHome> createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
    body:  Center(
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 300),
          transitionType:
        ContainerTransitionType.fadeThrough,
         useRootNavigator: true,
          // openColor: Colors.,
        clipBehavior: Clip.hardEdge,
            // closedColor: Colors.white30,
            closedElevation: 2*2*2,
            closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            openShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7*7)),
          middleColor: Colors.white10,
          onClosed: (value){
          return print("value is --$value");
          },
          closedBuilder:(context,action){
            return Text("Small Widget");
          } ,

          openBuilder:(context,action){
            return Text("Big Widget");
          } ,
        ),
    )
    );
  }
}
