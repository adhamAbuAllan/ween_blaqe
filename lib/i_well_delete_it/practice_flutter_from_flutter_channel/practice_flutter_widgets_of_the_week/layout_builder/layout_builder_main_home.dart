import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MyOneColumnLayout();
        } else {
          return const MyTwoColumnLayout();
        }
      }),
    );
  }
}

class MyOneColumnLayout extends StatelessWidget {
  const MyOneColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("your width is under 600"),
      ),
    );
  }
}

class MyTwoColumnLayout extends StatelessWidget {
  const MyTwoColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FittedBox(child: Text("your width is up 600")),
      ),
    );
  }
}
