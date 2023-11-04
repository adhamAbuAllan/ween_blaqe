import 'package:flutter/material.dart';

import 'reorderable_list_view_home.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));

}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const ReorderableListViewHome();
  }
}