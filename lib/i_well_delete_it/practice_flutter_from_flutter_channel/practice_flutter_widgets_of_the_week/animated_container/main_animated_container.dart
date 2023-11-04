import 'package:flutter/material.dart';

import 'animated_contanier_home.dart';

void main(List<String> args) {
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnimatedContainerHome(),);
  }
}
