import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BookingNowSkeletonWidget extends StatefulWidget {
  const BookingNowSkeletonWidget({Key? key}) : super(key: key);

  @override
  State<BookingNowSkeletonWidget> createState() => _BookingNowSkeletonWidgetState();
}

class _BookingNowSkeletonWidgetState extends State<BookingNowSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 28,
                        width: 100,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                Expanded(child: Text(""))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

                margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    //text of adv skeleton
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 28,
                                width: 100,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        Expanded(child: Text("")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      child: Row(
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 50,
                                width: 340,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
              margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //about apartment  text
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 28,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      Expanded(child: Text("")),
                    ],
                  ),

                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                        child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                          width: 40,
                          height: 40,
                        )),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 24,
                            width: 50,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ],
                  ),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 24,
                        width: 350,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 15),
              child: SizedBox(width: 350, height: 55, child: SkeletonAvatar()),
            ),
          ],
        ),
      ),
    );
  }
}
