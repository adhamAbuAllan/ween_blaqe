import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/get_it_controller.dart';

class HomeSkeletonWidget extends ConsumerStatefulWidget {
  const HomeSkeletonWidget(
      {super.key, this.hasCitiesBar, this.scrollController});

  final bool? hasCitiesBar;
  final ScrollController? scrollController;

  @override
  ConsumerState createState() => _HomeSkeletonWidgetState();
}

class _HomeSkeletonWidgetState extends ConsumerState<HomeSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
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

class ApartmentSkeleton extends ConsumerWidget {
  const ApartmentSkeleton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
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

// class ApartmentSkeleton extends StatelessWidget {
//   const ApartmentSkeleton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // final themeMode = Provider.of<ThemeProvider>(context).themeMode;
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Container(
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           color: themeMode.isLight
//               ? kContainerColorLightMode
//               : kContainerColorDarkMode,
//         ),
//         child: SkeletonItem(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     SkeletonLine(
//                       style: SkeletonLineStyle(
//                           height: 18,
//                           width: 100,
//                           borderRadius: BorderRadius.circular(4)),
//                     ),
//                     const Expanded(child: Text("")),
//                     const Padding(
//                       padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
//                       child: SkeletonAvatar(
//                           style: SkeletonAvatarStyle(width: 28, height: 28)),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 SkeletonAvatar(
//                   style: SkeletonAvatarStyle(
//                       width: double.infinity,
//                       height: 240,
//                       borderRadius: BorderRadius.circular(7)),
//                 ),
//                 const SizedBox(height: 10),
//                 Align(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18 / 1.3,
//                             width: 18 / 1.3,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18 / 1.3,
//                             width: 18 / 1.3,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18 / 1.3,
//                             width: 18 / 1.3,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       SkeletonLine(
//                         style: SkeletonLineStyle(
//                             height: 18 / 1.3,
//                             width: 18 / 1.3,
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SkeletonLine(
//                   style: SkeletonLineStyle(
//                       height: 18 / 1.3,
//                       width: 200,
//                       borderRadius: BorderRadius.circular(4)),
//                 ),
//                 const SizedBox(height: 10),
//                 SkeletonLine(
//                   style: SkeletonLineStyle(
//                       height: 18 / 1.3,
//                       width: 100,
//                       borderRadius: BorderRadius.circular(4)),
//                 ),
//                 const SizedBox(height: 10),
//                 const SkeletonAvatar(
//                     style: SkeletonAvatarStyle(width: 180, height: 18 / 1.3)),
//                 const SizedBox(height: 10),
//                 SkeletonLine(
//                   style: SkeletonLineStyle(
//                       height: 18 / 1.3,
//                       width: 80,
//                       borderRadius: BorderRadius.circular(4)),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

class CitiesBarSkeleton extends StatelessWidget {
  const CitiesBarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SkeletonItem(
          child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
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
          style: SkeletonAvatarStyle(
              width:
                  getIt<AppDimension>().isSmallScreen(context) ? 90 / 1.3 : 90,
              height: getIt<AppDimension>().isSmallScreen(context)
                  ? 40 / 1.3
                  : 40)),
    );
  }
}
