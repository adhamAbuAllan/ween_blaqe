import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../api/photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursolSliderWidget extends ConsumerStatefulWidget {
  const CoursolSliderWidget({
    super.key,
    required this.imageList,
    required this.apartmentId,
    required this.oneApartment,
    this.marageBetweenImages,
    this.isOwnerApartment,
  });

  final List<Photos> imageList;
  final int apartmentId;
  final DataOfOneApartment oneApartment;
  final double? marageBetweenImages;
  final bool? isOwnerApartment;

  @override
  ConsumerState createState() => _CoursolSliderWidgetState();
}

class _CoursolSliderWidgetState extends ConsumerState<CoursolSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final currentIndex =
        ref.watch(imageSliderNotifier)[widget.apartmentId]?.currentIndex ?? 0;
    // final isFirstIndex = currentIndex == 0;
    // final isLastIndex = currentIndex == widget.imageList.length - 1;

    return SizedBox(
      child: CarouselSlider.builder(
        controller: ref.watch(carouselSliderControllerNotifier),
        itemCount: widget.imageList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: widget.isOwnerApartment ?? false
                ? CarouselSliderItemWidget(
              widget: widget,
              index: index,
            )
                : Hero(
              tag: "${widget.apartmentId}-$index",
              child: CarouselSliderItemWidget(
                widget: widget,
                index: index,
              ),
            ),
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: false,
          aspectRatio: 16/9,
          pauseAutoPlayInFiniteScroll: true,
          enableInfiniteScroll: false,
          disableCenter: false,
          viewportFraction:.85,
          // widget.marageBetweenImages ?? 0.98,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enlargeFactor: 1,
          padEnds: false,
          // padEnds: (isFirstIndex || isLastIndex), // Set padEnds to false
          // only on first and last index
          enlargeStrategy: CenterPageEnlargeStrategy.height,

          initialPage: currentIndex,
          onPageChanged: (index, reason) {
            ref
                .watch(imageSliderNotifier.notifier)
                .updateIndex(widget.apartmentId, index);
          },
        ),
      ),
    );
  }}

class CarouselSliderItemWidget extends ConsumerWidget {
  const CarouselSliderItemWidget({
    super.key,
    required this.widget,
    required this.index,
  });

  final CoursolSliderWidget widget;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(7.0)),
      child: CachedNetworkImage(
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: widget.imageList[index].url ?? "",
        progressIndicatorBuilder: (context, url, progress) {
          return SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: double.infinity,
              height: 240,
              borderRadius: BorderRadius.circular(7),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: double.infinity,
              height: 240,
              borderRadius: BorderRadius.circular(7),
            ),
          );
        },
      ),
    );
  }
}

// class CarouselSliderWidget extends StatefulWidget {
//   const CarouselSliderWidget({
//     super.key,
//     required this.imageList,
//     required this.apartmentId,
//     required this.oneApartment, // Add apartmentId to the widget
//   });
//
//   final List<Photos> imageList;
//   final int apartmentId; // Track the apartmentId
//   final DataOfOneApartment oneApartment;
//
//   @override
//   State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
// }

// class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
//   late RxInt currentPhotoIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     // Get the current photo index for this specific apartment
//     currentPhotoIndex =
//         imageOfApartmentController.getCurrentPhotoIndex(widget.apartmentId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: getIt<AppDimension>().isSmallScreen(context) ? 220 : 280,
//       child: Obx(() => CarouselSlider(
//         controller: imageOfApartmentController.carouselSliderController,
//         options: CarouselOptions(
//           enlargeCenterPage: false,
//           aspectRatio: 1.5,
//           pauseAutoPlayInFiniteScroll: true,
//           enableInfiniteScroll: false,
//           disableCenter: false,
//           initialPage: widget.oneApartment.currentPhotoIndex.value,
//           // Use apartment-specific index
//           viewportFraction: 0.98,
//           autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//           enlargeStrategy: CenterPageEnlargeStrategy.height,
//           onPageChanged: (index, reason) {
//             widget.oneApartment.currentPhotoIndex.value = index;
//
//             debugPrint(
//                 "index in custom slider for apartment ${widget.apartmentId}:"
//                     " $index");
//           },
//         ),
//         items: widget.imageList.map((photo) {
//           return Builder(
//             builder: (BuildContext context) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 3),
//                 child: ClipRRect(
//                     borderRadius:
//                     const BorderRadius.all(Radius.circular(7.0)),
//                     child: CachedNetworkImage(
//                       height: 220,
//                       width: MediaQuery.of(context).size.width - 32,
//                       fit: BoxFit.cover,
//                       imageUrl: photo.url ?? "",
//                       progressIndicatorBuilder: (context, url, progress) {
//                         if (progress.progress != null) {
//                           return SkeletonAvatar(
//                             style: SkeletonAvatarStyle(
//                                 width: double.infinity,
//                                 height: 240,
//                                 borderRadius: BorderRadius.circular(7)),
//                           );
//                         }
//                         return SkeletonAvatar(
//                           style: SkeletonAvatarStyle(
//                               width: double.infinity,
//                               height: 240,
//                               borderRadius: BorderRadius.circular(7)),
//                         );
//                       },
//                     )),
//               );
//             },
//           );
//         }).toList(),
//       )),
//     );
//   }
// }
