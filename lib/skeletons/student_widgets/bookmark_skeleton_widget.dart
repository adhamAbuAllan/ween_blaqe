import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BookMarkSkeletonWidget extends StatefulWidget {
  const BookMarkSkeletonWidget({Key? key}) : super(key: key);

  @override
  State<BookMarkSkeletonWidget> createState() => _BookMarkSkeletonWidgetState();
}

class _BookMarkSkeletonWidgetState extends State<BookMarkSkeletonWidget> {
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
                  padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 34,
                      width: 120,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            //subtitle
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 20, 55),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 26,
                        width: 100,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            //clear all
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 26,
                          width: 100,
                          borderRadius: BorderRadius.circular(7)),
                    )),
              ],
            ),
            //bookmark container
            Container(
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
                      Expanded(child: Text("")),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    width: 373,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: const SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      height: 100,
                                      width: 100,
                                    ),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // SizedBox(
                                //   height: 5,
                                // ),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 240,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 240,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 190,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
                                            height: 34,
                                            width: 34,
                                            borderRadius:
                                            BorderRadius.circular(7)),
                                      ),
                                    ),

                                  ],
                                ),
                              ],

                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
