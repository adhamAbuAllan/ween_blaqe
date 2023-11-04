import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animatoin_home.dart';

void main(){
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationHome(),);
  }
}
