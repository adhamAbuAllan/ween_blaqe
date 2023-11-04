import 'package:flutter/material.dart';

class AnimatedSwitcherHome extends StatefulWidget {
  const AnimatedSwitcherHome({super.key});

  @override
  State<AnimatedSwitcherHome> createState() => _AnimatedSwitcherHomeState();
}

class _AnimatedSwitcherHomeState extends State<AnimatedSwitcherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: Text("first widget"),
        transitionBuilder: (child, animation) => ScaleTransition(child: child,scale: animation,),
      ),
    );
  }
}
