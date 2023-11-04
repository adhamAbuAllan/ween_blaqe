import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("font awesome flutter ")),
      body: const Align(child: _FontAwesomeFlutter()),
    );
  }
}

class _FontAwesomeFlutter extends StatelessWidget {
  const _FontAwesomeFlutter();

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.amber,
            semanticLabel: "Google's Logo",
            size: 30,
          ),
          // FaIcon(
          //   FontAwesomeIcons.phoneFlip,
          //   color: Colors.blue,
          //   semanticLabel: "phone flip",
          //   size: 30,
          // )
        ]);
  }
}
