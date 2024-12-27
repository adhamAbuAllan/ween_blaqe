import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../controller/provider_controllers/providers/color_provider.dart';

//
// class SmallParagraphSkeletonReady extends StatefulWidget {
//   const SmallParagraphSkeletonReady({Key? key}) : super(key: key);
//
//   @override
//   State<SmallParagraphSkeletonReady> createState() =>
//       _SmallParagraphSkeletonReadyState();
// }
//
// class _SmallParagraphSkeletonReadyState
//     extends State<SmallParagraphSkeletonReady> {
//   @override
//   void initState() {
//     super.initState();
//     // Timer(
//     //   const Duration(seconds: 3),
//     //       () => Navigator.pushNamed(context, MyPagesRoutes.main),
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SkeletonParagraph(
//                 style: SkeletonParagraphStyle(
//                     lines: 1,
//                     padding: const EdgeInsets.fromLTRB(0, 50, 25, 20),
//                     lineStyle: SkeletonLineStyle(
//                       width: 200,
//                       height: 28,
//                       borderRadius: BorderRadius.circular(7 / 2),
//                     ))),
//             SkeletonParagraph(
//                 style: SkeletonParagraphStyle(
//                     lines: 3,
//                     spacing: 10,
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(30, 0, 50, 10),
//                     lineStyle: SkeletonLineStyle(
//                       height: 20,
//                       borderRadius: BorderRadius.circular(7 / 2),
//                     ))),
//             SkeletonParagraph(
//                 style: SkeletonParagraphStyle(
//                     lines: 3,
//                     spacing: 10,
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(30, 10, 70, 10),
//                     lineStyle: SkeletonLineStyle(
//                       height: 20,
//                       borderRadius: BorderRadius.circular(7 / 2),
//                     ))),
//           ],
//         ),
//       ),
//     );
//   }
// }
class LongParagraphReadySkeleton extends StatelessWidget {
  const LongParagraphReadySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      body: const SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ParaSkeletonWidget(),
                ParaSkeletonWidget(),
                ParaSkeletonWidget(),
                ParaSkeletonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ParaSkeletonWidget extends StatelessWidget {
  const ParaSkeletonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 1,
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                lineStyle: SkeletonLineStyle(
                  width: 200,
                  height: 28,
                  borderRadius: BorderRadius.circular(7 / 2),
                ))),
        SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 3,
                spacing: 10,
                padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 10),
                lineStyle: SkeletonLineStyle(
                  height: 20,
                  borderRadius: BorderRadius.circular(7 / 2),
                ))),
        SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 2,
                spacing: 10,
                padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 130, 10),
                lineStyle: SkeletonLineStyle(
                  height: 20,
                  borderRadius: BorderRadius.circular(7 / 2),
                ))),
      ],
    );
  }
}
