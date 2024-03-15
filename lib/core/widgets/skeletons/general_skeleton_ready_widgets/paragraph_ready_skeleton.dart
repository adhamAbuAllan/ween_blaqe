import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';
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
  const LongParagraphReadySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isDark ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,
      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(

                      lines: 1,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 20),
                      lineStyle: SkeletonLineStyle(
                        width: 200,
                        height: 28,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 50, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 2,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 10, 130, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 20),
                      lineStyle: SkeletonLineStyle(
                        width: 200,
                        height: 28,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 50, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 2,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 10, 130, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 20),
                      lineStyle: SkeletonLineStyle(
                        width: 200,
                        height: 28,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 50, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 2,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 10, 130, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 20),
                      lineStyle: SkeletonLineStyle(
                        width: 200,
                        height: 28,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 50, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      ))),
              SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 2,
                      spacing: 10,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 10, 130, 10),
                      lineStyle: SkeletonLineStyle(
                        height: 20,
                        borderRadius: BorderRadius.circular(7 / 2),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
