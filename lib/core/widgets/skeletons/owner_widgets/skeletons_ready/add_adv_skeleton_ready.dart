import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'text_skeleton_ready.dart';

class AddAdvantagesSkeletonReady extends StatefulWidget {
  const AddAdvantagesSkeletonReady({super.key});

  @override
  State<AddAdvantagesSkeletonReady> createState() =>
      _AddAdvantagesSkeletonReadyState();
}

class _AddAdvantagesSkeletonReadyState
    extends State<AddAdvantagesSkeletonReady> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        children: [
          //text of adv skeleton
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 28,
                      width: 100,
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const Expanded(child: Text("")),
            ],
          ),
          //advantages skeleton
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
          const TextAdvantageesSkeletonReadyWithPadding(),
        ],
      ),
    );
  }
}

class TextAdvantageesSkeletonReadyWithPadding extends StatelessWidget {
  const TextAdvantageesSkeletonReadyWithPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: TextAdvantagesSkeletonReady());
  }
}
