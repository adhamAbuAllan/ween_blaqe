import 'package:flutter/material.dart';
class TitleClassWidget extends StatelessWidget {
  const TitleClassWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 26.0,
              fontFamily: 'IBM',
              inherit: true,
            ),
          ),
        ),
        const Expanded(child: Text("")),
      ],
    );
  }
}
