import 'package:flutter/material.dart';import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/nums.dart';


 




class ShowAllAdvSkeletonWidget extends StatefulWidget {
  const ShowAllAdvSkeletonWidget({Key? key}) : super(key: key);

  @override
  State<ShowAllAdvSkeletonWidget> createState() => _ShowAllAdvSkeletonWidgetState();
}

class _ShowAllAdvSkeletonWidgetState extends State<ShowAllAdvSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:SingleChildScrollView(
        child: Column(children: [

          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(width: 38, height: 38)),
              ),
              Expanded(child: Text("")),
            ],
          ),
          //advantages
          Container(
            margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: themeMode.isDark ? kContainerColorLightMode : kContainerColorDarkMode,
            ),
            child: Column(
              children: [

                //text of adv skeleton
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 28,
                            width: 100,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    const Expanded(child: Text("")),
                  ],
                ),
                //advantages skeleton
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 18),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 18),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 18),
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


        ],),
      ),
    );
  }
}
