import 'package:flutter/material.dart';

import 'flutter_rating_bar_practice.dart';

void main() {
  runApp(_MyApp());

}
class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeFutterRatingBar(),);
  }
}

