import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import 'skeleton_ready/notifcation_skeleton_ready.dart';

class NotificationSkeleton extends StatefulWidget {
  const NotificationSkeleton({Key? key}) : super(key: key);

  @override
  State<NotificationSkeleton> createState() => _NotificationSkeletonState();
}

class _NotificationSkeletonState extends State<NotificationSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 34,
                      width: 120,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            //subtitle
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 20, 55),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 26,
                        width: 100,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            //clear all
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 26,
                          width: 100,
                          borderRadius: BorderRadius.circular(7)),
                    )),
              ],
            ),
            //containers
            const NotificationSkeletonReady(),
            const NotificationSkeletonReady(),
            const NotificationSkeletonReady(),
            const NotificationSkeletonReady(),
          ],
        ),
      ),
    );
  }
}
