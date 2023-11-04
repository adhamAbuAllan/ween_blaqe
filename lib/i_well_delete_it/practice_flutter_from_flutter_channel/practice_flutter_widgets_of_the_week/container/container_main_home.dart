import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
      color: Colors.blue,
              width: 200,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 30),
              height: 200,
              transform: Matrix4.rotationZ(.05),
      child: const Text("Less boring"),

    ),
          ),
        ));
  }
}
