import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_cached_network_image.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeCachedNetworkImage(),);




  }
}

