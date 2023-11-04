import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(const MaterialApp(home: _Home()));
}
class _Home extends StatelessWidget {
  const _Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // transform: GradientRotation(1 / 3),
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
              ]).createShader(bounds),
          child: const Text(
            "Helow Flutter World!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
