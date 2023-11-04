import 'package:flutter/material.dart';

import 'fade_transition_home.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FadeTransitoinHome(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(7)),
        width: 100,
        height: 100,
      ),
    ));
  }
}
