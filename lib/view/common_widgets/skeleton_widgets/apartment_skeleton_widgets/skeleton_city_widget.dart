import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';

class SkeletonCityWidget extends ConsumerWidget {
  const SkeletonCityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SkeletonItem(

          child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SkeletonCityButtonWidget(),
          SkeletonCityButtonWidget(),
          SkeletonCityButtonWidget(),
          SkeletonCityButtonWidget(),
          SkeletonCityButtonWidget(),
        ],
      )),
    );
  }
}

class SkeletonCityButtonWidget extends ConsumerWidget {
  const SkeletonCityButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: SkeletonAvatar(

          style: SkeletonAvatarStyle(

              width: getIt<AppDimension>().isSmallScreen(
                context,
              )
                  ? 90 / 1.3
                  : 90,
              height: getIt<AppDimension>().isSmallScreen(context)
                  ? 40 / 1.3
                  : 40)),
    );
  }
}
