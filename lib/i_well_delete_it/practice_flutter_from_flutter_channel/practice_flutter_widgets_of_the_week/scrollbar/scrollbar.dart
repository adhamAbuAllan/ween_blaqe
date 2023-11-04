import 'package:flutter/material.dart';

import '../generat_custom_list_view.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final List<String> myList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("scrollbar")),
      body: Scrollbar(
          radius: const Radius.circular(1),
          thumbVisibility: true,
          interactive: true,
          thickness: 10,
          trackVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          child: generateCustomListView()),
    );
  }


}
