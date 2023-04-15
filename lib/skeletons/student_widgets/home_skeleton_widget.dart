import 'package:skeletons/skeletons.dart';
import 'package:flutter/material.dart';

class HomeSkeletonWidget extends StatefulWidget {
  const HomeSkeletonWidget({Key? key}) : super(key: key);

  @override
  State<HomeSkeletonWidget> createState() => _HomeSkeletonWidgetState();
}

class _HomeSkeletonWidgetState extends State<HomeSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: Skeleton(
              isLoading: true,
              skeleton: SkeletonAvatar(
                  style: SkeletonAvatarStyle(width: 290, height: 80)),
              child: Text(""),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 38, height: 28)),
          ),
          Expanded(
            child: Text(""),
          )
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //cities skeleton\
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 28,
                                width: 80,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SkeletonItem(
                          child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: SkeletonAvatar(
                                style:
                                    SkeletonAvatarStyle(width: 90, height: 40)),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
            //apartments skeleton
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //title
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        //price
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("")),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 28, height: 28)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 200,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 80, height: 30)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 18,
                              width: 100,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
