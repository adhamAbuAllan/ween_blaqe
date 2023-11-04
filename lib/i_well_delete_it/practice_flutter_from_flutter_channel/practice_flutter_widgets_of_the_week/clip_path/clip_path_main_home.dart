import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: _Home()));
}
class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: ClipPath(
      clipBehavior: Clip.antiAlias,
      
      child: FlutterLogo()),),);
  }
}
