import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
class SubtitleWidget extends ConsumerWidget {
  const SubtitleWidget({super.key, required this.subtitle,this.color,this
      .delay,this.duration});

  final String subtitle;
  final Color ? color;
  final Duration ? delay;
  final Duration ? duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInOnVisible(
      isVisibleOnScroll: false,
      direction:SlideDirection.right,
      delay: delay,
      duration: duration,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              style: TextStyle(
                  color:color?? Colors.grey.shade600,
                  fontSize:
                  getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(child: Text("")),
        ],
      ),
    );
  }
}
