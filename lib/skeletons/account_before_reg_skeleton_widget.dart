import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/text_skeleton_ready.dart';

import '../styles/text_style/aline_style.dart';
import 'general_skeleton_ready_widgets/button_of_account_skeleton_ready.dart';
import 'general_skeleton_ready_widgets/button_skeleton_ready.dart';

class AccountBeforeRegSkeletonWidget extends StatelessWidget {
  const AccountBeforeRegSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Column(children: [
            //title
            const TitleTextSkeletonReady(),
            LongSubTextSkeletonReady(),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountWithSwitchSkeletonReady(),
            const SizedBox(height: 10,),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(height: 10,),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountSkeletonReady2(),
            const SizedBox(height: 10,),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(height: 10,),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountSkeletonReady2(),
            const SizedBox(height: 10,),
            alineSkeleton,
            const SizedBox(height: 10,),
            const ButtonOfAccountSkeletonReady(),
            const SizedBox(height: 10,),

            alineSkeleton,

            const SizedBox(height: 15,),
            const ButtonSkeletonReady(),
            const SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
              child: const SmallTextSkeletonReady(),
            )

          ],),
        ));
  }
}
