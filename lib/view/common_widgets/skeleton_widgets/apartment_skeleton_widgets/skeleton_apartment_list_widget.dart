import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

class SkeletonApartmentListWidget extends ConsumerWidget {
  const SkeletonApartmentListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
        SkeletonApartmentContainerWidget(),
      ],
    );
  }
}

class SkeletonApartmentContainerWidget extends ConsumerWidget {
  const SkeletonApartmentContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color:
                ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)),
        child: SkeletonItem(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 18,
                      width: 100,
                      borderRadius: BorderRadius.circular(4)),
                ),
                const Expanded(child: Text("")),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(width: 28, height: 28)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  width: double.infinity,
                  height: 240,
                  borderRadius: BorderRadius.circular(7)),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 15,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                  height: 18 / 1.3,
                  width: 200,
                  borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(height: 10),
            SkeletonLine(
              style: SkeletonLineStyle(
                  height: 18 / 1.3,
                  width: 100,
                  borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(height: 10),
            const SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 180, height: 18 / 1.3)),
            const SizedBox(height: 10),
            SkeletonLine(
              style: SkeletonLineStyle(
                  height: 18 / 1.3,
                  width: 80,
                  borderRadius: BorderRadius.circular(4)),
            )
          ],
        )),
      ),
    );
  }
}
