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
      backgroundColor: Colors.grey,
      body: Center(
          child: ClipOval(
        clipper: _MyClipper(),
        child: Container(color:Colors.white ,child: const FlutterLogo(size:100,)),
      )),
    );
  }
}

class _ChildOfClipOvel extends StatelessWidget {
  const _ChildOfClipOvel();

  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,
      child: const Center(heightFactor: 200,child: FlutterLogo(size: 100,)),
    );
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
