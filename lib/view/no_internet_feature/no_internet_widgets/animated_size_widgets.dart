import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';

class AnimatedSizeWidget extends ConsumerWidget {
  const AnimatedSizeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      child: SizedBox(
          height: getIt<AppDimension>().isSmallScreen(context) ? 80 / 1.3 : 80),
    );
  }
}

class AnimatedSize2900Widget extends ConsumerWidget {
  const AnimatedSize2900Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AnimatedSize(
        duration: Duration(milliseconds: 2900),
        curve: Curves.linear,
        child: SizedBox());
  }
}

class AnimatedSizeWidget1000 extends ConsumerWidget {
  const AnimatedSizeWidget1000({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isWantToSepha = ref.read(isWantToSephaProvider.notifier).state;

    return AnimatedSize(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      child: SizedBox(
          height: !isWantToSepha
              ? (getIt<AppDimension>().isSmallScreen(context) ? 0 : 60)
              : 0),
    );
  }
}
