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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const _CustomText(
                text: "Text Button didn't have IgnorePointer widget"),
            TextButton(onPressed: () {}, child: const Text("Click me")),
            const _CustomText(text: "Text Button have IgnorePointer widget"),
            IgnorePointer(
                ignoring: true,
                child: TextButton(onPressed: () {}, child: const Text("Click me"))),
            const Spacer(),

          ]),
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: Text(text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontFamily: 'IBM',
        )),);
  }
}
