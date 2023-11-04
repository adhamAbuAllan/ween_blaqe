import 'package:flutter/material.dart';

/// this class is useable , that you can use it in current time in anywhere in
/// projct and any projects
class FadeTransitoinHome extends StatefulWidget {
  final Widget child;
  const FadeTransitoinHome({super.key, required this.child});

  @override
  State<FadeTransitoinHome> createState() => _FadeTransitoinHomeState();
}

class _FadeTransitoinHomeState extends State<FadeTransitoinHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animatoin;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        // reverseDuration: const Duration(seconds: 2 * 3),
        debugLabel: "FadeTransitoin",
        // animationBehavior: AnimationBehavior.normal,
        vsync: this,
        duration: const Duration(seconds: 2 * 3));
    _animatoin = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;
    _controller.forward();
    return Center(child: FadeTransition(opacity: _animatoin, child: child));
  }
}
