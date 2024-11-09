import 'package:skeletons/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../constants/get_it_controller.dart';

class HomeSkeletonWidget extends StatefulWidget {
  const HomeSkeletonWidget(
      {super.key, this.hasCitiesBar, this.scrollController});

  final bool? hasCitiesBar;
  final ScrollController? scrollController;

  @override
  State<HomeSkeletonWidget> createState() => _HomeSkeletonWidgetState();
}

class _HomeSkeletonWidgetState extends State<HomeSkeletonWidget> {
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
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: SingleChildScrollView(
          controller: widget.scrollController,
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              widget.hasCitiesBar ?? false
                  ? const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //cities skeleton
                  CitiesBarSkeleton(),

                  SizedBox(
                    height: 10,
                  ),
                ],
              )
                  : const SizedBox(),

              //a list of apartments skeleton
              const ApartmentSkeleton(),
              const ApartmentSkeleton(),
              const ApartmentSkeleton(),
              const ApartmentSkeleton(),
              const ApartmentSkeleton(),
              const ApartmentSkeleton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ApartmentSkeleton extends StatelessWidget {
  const ApartmentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: themeMode.isLight
              ? kContainerColorLightMode
              : kContainerColorDarkMode,
        ),
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
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 18 / 1.3,
                            width: 18 / 1.3,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 18 / 1.3,
                            width: 18 / 1.3,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 18 / 1.3,
                            width: 18 / 1.3,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 18 / 1.3,
                            width: 18 / 1.3,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ],
                  ),
                ),
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

class CitiesBarSkeleton extends StatelessWidget {
  const CitiesBarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SkeletonItem(
          child: Row(
            children: [
  ButtonOfCitySkeleton(),
  ButtonOfCitySkeleton(),
  ButtonOfCitySkeleton(),
  ButtonOfCitySkeleton(),
  ButtonOfCitySkeleton(),
            ],
          )),
    );
  }
}

class ButtonOfCitySkeleton extends StatelessWidget {
  const ButtonOfCitySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: SkeletonAvatar(
          style: SkeletonAvatarStyle(width: getIt<AppDimension>()
              .isSmallScreen(context) ? 90/1.3: 90,
              height:
              getIt<AppDimension>()
                  .isSmallScreen(context) ? 40/1.3: 40)),
    );
  }
}

