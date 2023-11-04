import 'package:flutter/material.dart';

import 'flexible_home.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlexibleHome();
  }
}
