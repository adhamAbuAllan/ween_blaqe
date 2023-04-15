import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NotificationSkeleton extends StatefulWidget {
  const NotificationSkeleton({Key? key}) : super(key: key);

  @override
  State<NotificationSkeleton> createState() => _NotificationSkeletonState();
}

class _NotificationSkeletonState extends State<NotificationSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 20, 55),
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 26,
                        width: 100,
                        borderRadius: BorderRadius.circular(7 )
                    ),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
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
                              padding:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: SkeletonAvatar(style:
                                SkeletonAvatarStyle(height:
                                100,
                                    width: 100,),)
                              ),
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
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),
                                const SizedBox(height: 5,),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(height: 5,),

                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),

                                // Text(location),

                                const SizedBox(
                                  height: 10,
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
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
                              padding:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: SkeletonAvatar(style:
                                SkeletonAvatarStyle(height:
                                100,
                                    width: 100,),)
                              ),
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
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),
                                const SizedBox(height: 5,),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(height: 5,),

                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),

                                // Text(location),

                                const SizedBox(
                                  height: 10,
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
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
                              padding:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: SkeletonAvatar(style:
                                  SkeletonAvatarStyle(height:
                                  100,
                                    width: 100,),)
                              ),
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
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),
                                const SizedBox(height: 5,),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(height: 5,),

                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),

                                // Text(location),

                                const SizedBox(
                                  height: 10,
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
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
                              padding:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: SkeletonAvatar(style:
                                  SkeletonAvatarStyle(height:
                                  100,
                                    width: 100,),)
                              ),
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
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),
                                const SizedBox(height: 5,),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                const SizedBox(height: 5,),

                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 160,
                                      borderRadius: BorderRadius.circular(7 )),
                                ),

                                // Text(location),

                                const SizedBox(
                                  height: 10,
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
