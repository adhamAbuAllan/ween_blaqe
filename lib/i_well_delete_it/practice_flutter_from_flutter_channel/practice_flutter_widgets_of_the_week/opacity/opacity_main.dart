import 'package:flutter/material.dart';

import 'opacity_home.dart';

void main(List<String> args) {
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OpacityHome(),);
  }
}
