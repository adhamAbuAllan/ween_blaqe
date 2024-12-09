import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonImageWidget extends ConsumerWidget {
  const SkeletonImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            height: 110,
            width: 110,
          ),
        ));
  }
}

