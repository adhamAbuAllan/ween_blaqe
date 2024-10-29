import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ContainerInputTextReadyWidgetSkeleton extends StatelessWidget {
  const ContainerInputTextReadyWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
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
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 65,
                        width: 340,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerInputLongTextReadyWidgetSkeleton extends StatelessWidget {
  const ContainerInputLongTextReadyWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //text of date skeleton
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 28,
                        width: 100,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 280,
                        width: 340,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
