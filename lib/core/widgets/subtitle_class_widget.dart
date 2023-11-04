import 'package:flutter/material.dart';
class SubtitleCalssWidget extends StatelessWidget {
  const SubtitleCalssWidget({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return             Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 55),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontFamily: 'IBM'),
          ),
        ),
        const Expanded(child: Text("")),
      ],
    );
  }
}
