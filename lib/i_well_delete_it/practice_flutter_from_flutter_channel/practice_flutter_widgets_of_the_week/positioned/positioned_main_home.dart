import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              width: 232,
              height: 122,
              // bottom:100,

                // left: 100,
                right: 100,
                top: 100,


                child: FlutterLogo()
            )
          ],
        ),
      ),
    );
  }
}
