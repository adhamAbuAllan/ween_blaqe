import 'package:flutter/material.dart';

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

class _HomeState extends State<_Home> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {
          controller.value;
        });
      });

    controller.repeat(reverse: true);
    super.initState();
    debugPrint("animatoin controller : $controller");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          LinearProgressIndicator(
            value: controller.value,
          ),
          const LinearProgressIndicator()
        ]),
      ),
    );
  }
}
