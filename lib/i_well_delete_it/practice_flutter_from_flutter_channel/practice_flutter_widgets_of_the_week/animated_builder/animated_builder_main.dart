import 'package:flutter/material.dart';

import 'animated_builder_home.dart';
main(){
  runApp(MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AnimatedBuilderHome()));
  }
}
