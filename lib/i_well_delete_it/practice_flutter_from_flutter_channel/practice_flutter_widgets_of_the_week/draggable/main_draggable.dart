import 'package:flutter/material.dart';

import 'draggable_home.dart';

void main() {
  runApp (_MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DraggableHome(),
    );
  }
}
