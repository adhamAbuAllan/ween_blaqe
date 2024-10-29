import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';

class UserProfileSkeleton extends StatelessWidget {
  final bool isLightMode;

  const UserProfileSkeleton({super.key, required this.isLightMode});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button Skeleton
          Container(
            color:
                isLightMode ? kContainerColorLightMode : kContainerColorDarkMode,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(width: 28, height: 24)),
                ),
                Expanded(child: Text("")),
              ],
            ),
          ),
          // Avatar Container Skeleton
          Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (themeMode.isLight
                      ? kBackgroundAppColorLightMode
                      : kBackgroundAppColorDarkMode),
                  (themeMode.isLight
                      ? kBackgroundAppColorLightMode
                      : kBackgroundAppColorDarkMode),
                  (themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0, 0.25, 0.0],
              ),
            ),
            child: const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
                width: 80,
                height: 80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                //  name and phone Container Skeleton
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLightMode
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 20,
                          width: 150,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 15,
                          width: 250,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(
                        height: 15 * 2,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            20,
                            getIt<AppDimension>().isSmallScreen(context)
                                ? 20 / 1.5
                                : 20,
                            20,
                            0),
                        child: SizedBox(
                          width: double.infinity,
                          height: getIt<AppDimension>().isSmallScreen(context)
                              ? 55 / 1.2
                              : 55,
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: getIt<AppDimension>().isSmallScreen(context)
                                  ? 55 / 1.2
                                  : 55,
                              // width: 150,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLightMode
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 20,
                          width: 180,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      //first row
                      Row(
                        children: [
                          const SizedBox(width: 15,),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 120,
                              height: 40,
                              // width: 150,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 120,
                              height: 40,
                              // width: 150,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      //second row
                      Row(
                        children: [
                          const SizedBox(width: 5,),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 100,
                              height: 40,
                              // width: 150,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 100,
                              height: 40,
                              // width: 150,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                // join time  Container Skeleton
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLightMode
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 18,
                          width: 150,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 16,
                          width: 250,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                //  account of posts Container Skeleton
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLightMode
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 18,
                          width: 150,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 16,
                          width: 250,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
