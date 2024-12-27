
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../controller/provider_controllers/providers/color_provider.dart';

class LongParagraphReadySkeletonUi extends ConsumerWidget {
  const LongParagraphReadySkeletonUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
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
class ParaSkeletonWidget extends ConsumerWidget {
  const ParaSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
