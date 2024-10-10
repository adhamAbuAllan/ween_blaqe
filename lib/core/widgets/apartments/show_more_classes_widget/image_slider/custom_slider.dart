// import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
// import 'package:ween_blaqe/constants/nums.dart';
import '../../../../../api/photos.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

StatefulBuilder buildCarouselSlider({
  List<Photos>? photos,
  required BuildContext context,
  CarouselSliderController? controller,
  dynamic Function(int, CarouselPageChangedReason)? onPageChange,
  // required Object tag,
  int? current,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return SizedBox(
        height: 250,
        child: CarouselSlider(
            controller: controller,
            items: photos?.map((photo) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.0)),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: 1000.0,
                          imageUrl: photo.url ?? "",
                          progressIndicatorBuilder: (context, url, progress) {
                            if (progress.progress != null) {
                              // final percent = progress.progress! * 100;
                              // return Text('$percentتم التحميل %');
                              return SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    width: double.infinity,
                                    height: 240,
                                    borderRadius: BorderRadius.circular(7)),
                              );
                            }
                            return SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                  width: double.infinity,
                                  height: 240,
                                  borderRadius: BorderRadius.circular(7)),
                            );

                            // const Text('جاري التحميل...')
                          },
                        )),
                  );
                },
              );
            }).toList(),
            // widget.getImages!.generateImageSliders,
            // caourselSliderController: controller,
            options: CarouselOptions(
                // padEnds: true,
                // animateToClosest: true,
                // pageSnapping: true,
                // autoPlay: true,
                // pauseAutoPlayOnManualNavigate: true,
                // pauseAutoPlayOnTouch: true,

                // scrollPhysics: RangeMaintainingScrollPhysics(),
                enlargeCenterPage: true,
                // scrollPhysics: PageScrollPhysics(),

                aspectRatio: 2.0,
                pauseAutoPlayInFiniteScroll: true,
                enableInfiniteScroll: false,
                disableCenter: false,
                initialPage: current!,
                viewportFraction: 0.93,

                height: 240,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: onPageChange
                // onPageChanged: (){}
                )),
      );
    },
  );
}
