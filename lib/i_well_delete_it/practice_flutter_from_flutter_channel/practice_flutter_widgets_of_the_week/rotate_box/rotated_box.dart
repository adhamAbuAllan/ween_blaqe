import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Expanded(
            child: Align(
                alignment: Alignment.center,
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                        "you can Rotate any widget  by use RatatedBox Widget❤️")))),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: _container(
                "you can Rotate any widget  by use RatatedBox Widget❤️"),
          ),
        )
      ]),
    );
  }

  Container _container(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(25, 0, 30, 0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'IBM',
          inherit: true,
        ),
      ),
    );
  }
}
