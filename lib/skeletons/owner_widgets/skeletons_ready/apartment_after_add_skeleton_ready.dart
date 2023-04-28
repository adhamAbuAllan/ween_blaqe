import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
class ApartmentOfOwnerAfterAddSkeletonReady extends StatelessWidget {
  const ApartmentOfOwnerAfterAddSkeletonReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,

      ),
      child: Column(
        children: [
          //date apartment
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

          Column(
            children: [
              Row(

                children: [
                  //image skeleton
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
                  //text that 3 row skeleton
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

              // state of apartment text skeleton
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
            ],
          ),
        ],
      ),
    );
  }
}
