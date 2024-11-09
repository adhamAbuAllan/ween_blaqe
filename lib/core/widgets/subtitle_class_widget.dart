import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';

import '../../constants/get_it_controller.dart';
class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return             Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  20),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 :
                18,
                fontWeight: FontWeight.w500
                ),
          ),
        ),
        const Expanded(child: Text("")),
      ],
    );
  }
}
