import 'package:flutter/material.dart';

import 'fide_in_image_home.dart';

void main() {
  runApp(const _MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FadeInImageHome());
  }
}
