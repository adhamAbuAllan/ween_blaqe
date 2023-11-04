import 'package:flutter/material.dart';
class AnimatedContainerHome extends StatefulWidget {
  const AnimatedContainerHome({super.key});
  @override
  State<AnimatedContainerHome> createState() => _AnimatedContainerHomeState();
}
class _AnimatedContainerHomeState extends State<AnimatedContainerHome> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: AnimatedContainer(
              transform: Matrix4.rotationZ(.2),
              // transform: Matrix4.fromList(List<doul),
              decoration: BoxDecoration(
                  color: selected ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(7)),
              width: selected ? 200.0 * 2 : 100.0 * 2,
              height: selected ? 100.0 * 2 : 200.0 * 2,
              alignment: selected
                  ? Alignment.bottomLeft
                  : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2 * 1),
              // curve: Curves.bounceIn,
              // curve: Curves.bounceInOut,
              // curve: Curves.bounceOut,
              // curve: Curves.decelerate,
              // curve: Curves.linear,
              // curve: Curves.ease,
              // curve: Curves.easeIn,
              // curve: Curves.easeInBack,
              // curve: Curves.easeInCirc,
              // curve: Curves.easeInCubic,
              // curve: Curves.easeInExpo,
              // curve: Curves.easeInOut,
              // curve: Curves.easeInOutBack,
              // curve: Curves.easeInOutCirc,
              // curve: Curves.easeInOutCubic,
              // curve: Curves.easeInOutCubicEmphasized,
              // curve: Curves.easeInOutExpo,
              // curve: Curves.easeInOutQuad,
              // curve: Curves.easeInOutQuart,
              // curve: Curves.easeInOutQuint,
              // curve: Curves.easeInOutSine,
              // curve: Curves.easeInQuad,
              // curve: Curves.easeInToLinear,
              // curve: Curves.elasticIn,
              curve: Curves.elasticOut,
              // curve: Curves.elasticInOut,
              // curve: Curves.fastEaseInToSlowEaseOut,
              // curve: Curves.fastLinearToSlowEaseIn,
              // curve: Curves.fastOutSlowIn,
              // curve: Curves.linearToEaseOut,
              // curve: Curves.linearToEaseOut,
              // curve: Curves.slowMiddle,
              child: const FlutterLogo(size: 75),
            ),
          ),
        ),
      ),
    );
  }
}
