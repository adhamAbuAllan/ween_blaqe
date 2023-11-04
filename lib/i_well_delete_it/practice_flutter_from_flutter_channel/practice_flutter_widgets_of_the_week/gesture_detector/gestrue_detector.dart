import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Positioned());
  }
}

class _Positioned extends StatefulWidget {
  const _Positioned();

  @override
  State<_Positioned> createState() => __PositionedState();
}

class __PositionedState extends State<_Positioned> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            onPanUpdate: (details) {
              _top = max(0, _top + details.delta.dy);
              _left = max(0, _left + details.delta.dx);
              setState(() {});
            },
            child: const _CustomContainer(),
          ),
        )
      ],
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: const Align(
        child: Text(
          "drag me ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
