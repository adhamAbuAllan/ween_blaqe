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
    return const Scaffold(
      body: Center(
          child: PhysicalModel(
        color: Colors.black,
        shadowColor: Colors.blue,
        elevation: 8,
        child: _CustomBox(color: Colors.orange),
      )),
    );
  }
}

class _CustomBox extends StatelessWidget {
  const _CustomBox({this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120 * 2,
      height: 100 * 2,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadiusDirectional.circular(17)),
    );
  }
}
