import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import 'general_skeleton_ready_widgets/button_of_account_skeleton_ready.dart';
import 'general_skeleton_ready_widgets/button_skeleton_ready.dart';
import 'general_skeleton_ready_widgets/first_part_of_account_skeleton_widget_ready.dart';
import 'owner_widgets/skeletons_ready/text_skeleton_ready.dart';

class AccountSkeletonWidget extends StatelessWidget {
  const AccountSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            //title
            const TitleTextSkeletonReady(),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 35, 10, 35),
              child: FirstPartOfAccountSkeletonReady(),
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountWithSwitchSkeletonReady(),
            const SizedBox(
              height: 10,
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(
              height: 10,
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountSkeletonReady2(),
            const SizedBox(
              height: 10,
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(
              height: 10,
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountSkeletonReady2(),
            const SizedBox(
              height: 10,
            ),
            alineSkeleton,
            const SizedBox(
              height: 10,
            ),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(
              height: 25 / 2,
            ),
            const ButtonSkeletonReady()
          ],
        ),
      ),
    );
  }
}
