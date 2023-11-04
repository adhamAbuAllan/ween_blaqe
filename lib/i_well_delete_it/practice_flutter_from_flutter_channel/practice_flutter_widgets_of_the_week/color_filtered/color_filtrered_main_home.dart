import 'package:flutter/material.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate),
      child: FlutterLogo(size: 100,),
    ),),);
  }
}
