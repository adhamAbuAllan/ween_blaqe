import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'media_query_home.dart';
main(){
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);



  runApp(const MaterialApp(home:_Home()));}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const MediaQueryHome();
  }
}

