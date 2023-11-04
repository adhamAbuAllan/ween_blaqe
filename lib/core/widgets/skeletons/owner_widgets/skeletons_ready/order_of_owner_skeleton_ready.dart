import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import 'button_ready_selekton.dart';
import 'circle_of_steps_skeleton_ready.dart';
import 'text_skeleton_ready.dart';

//this class have request of user when he request to reservation apartment
class RequestReservationWidgetReady extends StatelessWidget {
  const RequestReservationWidgetReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container that have items
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //date of order
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 18,
                        width: 100,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ),
              ],
            ),
            //this row have profile or user or student and have his name and
            //the text that told owner that user request to reservation apartment
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 10, 0),
                  child: CircleOfStepsSkeletonReady(),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 5, 0),
                          child: TextTitleSkeletonReady(),
                        ),
                        // Expanded(child: Text("")),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: SmallTextSkeletonReady()),
                  ],
                ),
              ],
            ),
            //this padding have a image of apartment that user request reservation it.
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
              child: Row(
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 280,
                        width: 340,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ],
              ),
            ),
            //this line of title of Ad of apartment
            const Row(
              children: [
                TextTitleApartmentSkeletonReady(),
                Expanded(child: Text("")),
              ],
            ),
            //this row how tow buttons
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: SmallButtonReadySkeleton(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: SmallButtonReadySkeleton(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// this class have response
class ResponseReservationWidgetReady extends StatelessWidget {
  const ResponseReservationWidgetReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this padding have container
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //text of date skeleton
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 18,
                        width: 100,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  ),
                ),
              ],
            ),
//            first part of account that have profile(image) and name of user
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleOfStepsSkeletonReady(),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: TextTitleSkeletonReady(),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: SmallTextSkeletonReady()),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
                          child: SmallCircleSkeletonReady(),
                        ),
                        SmallTextSkeletonReady()
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
