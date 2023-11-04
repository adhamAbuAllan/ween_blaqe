import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Zoom the image 🔎",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),
        ),
        InteractiveViewer(
            child: const Image(
                image: AssetImage("assets/images/apartment_get_started.png")))
      ]),
    );
  }
}
