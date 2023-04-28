import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/apartment_after_add_skeleton_ready.dart';
class ApartmentOfOwnerAfterAddSkeleton extends StatelessWidget {
  const ApartmentOfOwnerAfterAddSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              //apartment of owner containers
              ApartmentOfOwnerAfterAddSkeletonReady(),
              ApartmentOfOwnerAfterAddSkeletonReady(),
              ApartmentOfOwnerAfterAddSkeletonReady(),
              ApartmentOfOwnerAfterAddSkeletonReady(),
            ],
          ),
        ),
      ),
    );
  }
}
