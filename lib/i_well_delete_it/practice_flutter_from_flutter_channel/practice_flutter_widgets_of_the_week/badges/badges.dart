import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: const _Home()));
}

class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Badge(
            label: Text("3"),
            backgroundColor: Colors.orange,
            isLabelVisible: true,
            child: Icon(
              Icons.app_blocking,
              size: 30 * 5,
            )),
      ),
    );
  }
}
