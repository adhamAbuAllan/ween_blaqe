import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import '../../../../../api/photos.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
    required this.imageList,
    required this.apartmentId,
    required this.oneApartment, // Add apartmentId to the widget
  });

  final List<Photos> imageList;
  final int apartmentId; // Track the apartmentId
  final DataOfOneApartment oneApartment;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  late RxInt currentPhotoIndex;

  @override
  void initState() {
    super.initState();
    // Get the current photo index for this specific apartment
    currentPhotoIndex =
        imageOfApartmentController.getCurrentPhotoIndex(widget.apartmentId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Obx(() => CarouselSlider(
            controller: imageOfApartmentController.carouselSliderController,
            options: CarouselOptions(
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              pauseAutoPlayInFiniteScroll: true,
              enableInfiniteScroll: false,
              disableCenter: false,
              initialPage: widget.oneApartment.currentPhotoIndex.value,
              // Use apartment-specific index
              viewportFraction: 0.98,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                widget.oneApartment.currentPhotoIndex.value = index;

                debugPrint(
                    "index in custom slider for apartment ${widget.apartmentId}: $index");
              },
            ),
            items: widget.imageList.map((photo) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.0)),
                        child: CachedNetworkImage(
                          height: 220,
                          width: MediaQuery.of(context).size.width - 32,
                          fit: BoxFit.cover,
                          imageUrl: photo.url ?? "",
                          progressIndicatorBuilder: (context, url, progress) {
                            if (progress.progress != null) {
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
                          },
                        )),
                  );
                },
              );
            }).toList(),
          )),
    );
  }
}
