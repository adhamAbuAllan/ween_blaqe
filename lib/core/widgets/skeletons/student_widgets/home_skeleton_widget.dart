import 'package:skeletons/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class CitiesBarSkeleton extends StatelessWidget {
  const CitiesBarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SkeletonItem(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 90, height: 40)),
          ),
        ],
      )),
    );
  }
}

class HomeSkeletonWidget extends StatelessWidget {
  const HomeSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //app bar skeleton
        // appBar: AppBar(
        //   elevation: 10,
        //   backgroundColor: Colors.white,
        //   toolbarHeight: 80,
        //   actions: const [
        //     Padding(
        //       padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        //       child: Skeleton(
        //         isLoading: true,
        //         skeleton: SkeletonAvatar(
        //             style: SkeletonAvatarStyle(width: 290, height: 80)),
        //         child: Text(""),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
        //       child: SkeletonAvatar(
        //           style: SkeletonAvatarStyle(width: 38, height: 28)),
        //     ),
        //     Expanded(
        //       child: Text(""),
        //     )
        //   ],
        // ),
        backgroundColor: themeMode.isDark
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //cities skeleton
              //apartments skeleton
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: SkeletonItem(
                      child: Column(
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
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //title
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          //price
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                              width: 28,
                              height: 28,
                            )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: SkeletonItem(
                      child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("")),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 28, height: 28)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: double.infinity,
                            height: 240,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 200,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 80, height: 30)),
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 18,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
