import 'package:flutter/material.dart';

class NormalTransform extends StatelessWidget {
  const NormalTransform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredBox(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-.1 / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
      ),
    );
  }
}

class TransformWthflip extends StatelessWidget {
  const TransformWthflip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredBox(
          color: Colors.blue,
          child: Transform.flip(
            origin: const Offset(.2 * 20,  .2 * 2),
            flipX: false,
            flipY: false,
            transformHitTests: true,
            child: const Text("transfromWtihFlip"),
          ),
        ),
      ),
    );
  }
}
