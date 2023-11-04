import 'package:flutter/material.dart';
//create methos that reaturn mulit colors?

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: GestureDetector(
        onTap: () {
          if (_isPlay != false) {
            _controller.reverse();
            _isPlay = false;
          } else {
            _controller.forward();
            _isPlay = true;
          }
        },
        child:  AnimatedIcon(
          icon: AnimatedIcons.search_ellipsis,
          progress:_controller,
          size: 100,
        ),
      ),
    ));
  }
}

