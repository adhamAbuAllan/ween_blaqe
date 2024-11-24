import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

// import '../../../../../controller/auth_provider.dart';
import '../../show_more_classes_widget/image_slider/custom_slider.dart';
import '../../show_more_classes_widget/image_slider/pointer.dart';
// import '../../show_more_classes_widget/image_slider/zoom_of_image/image_details_scree.dart';

class ApartmentMainImage extends StatelessWidget {
  final Apartments apartmentsRes;
  final int index;

  const ApartmentMainImage(
      {super.key, required this.apartmentsRes, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(7 / 2),
            child: apartmentsRes.data?[index].photos?[0].url == null
                ? SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: 367,
                        height: 220,
                        borderRadius: BorderRadius.circular(7 / 2)),
                  )
                : CarouselSliderWidget(
                    imageList: apartmentsRes.data![index].photos!,
                    apartmentId: apartmentsRes.data![index].id!,
                    oneApartment: apartmentsRes.data![index],
                  )),
        // Image(
        //         errorBuilder: (context, error, stackTrace) {
        //           return SkeletonAvatar(
        //             style: SkeletonAvatarStyle(
        //                 width: 367,
        //                 height: 220,
        //                 borderRadius: BorderRadius.circular(7 / 2)),
        //           );
        //         },
        //         image: CachedNetworkImageProvider(
        //             apartmentsRes.data?[index].photos?[0].url ??
        //                 'https://via.placeholder.com/150'),
        //         height: 220,
        //         width: MediaQuery.of(context).size.width - 32,
        //         fit: BoxFit.cover,
        //       )),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,),
          child: PointerOfImage(
            imageList: apartmentsRes.data?[index].photos??[],
            oneApartment: apartmentsRes.data?[index]??DataOfOneApartment(),
          ),
        ),
        // TimeAgoWidget(apartmentsRes: apartmentsRes, index: index),
      ],
    );
  }
}

class TimeAgoWidget extends StatefulWidget {
  const TimeAgoWidget(
      {super.key, required this.apartmentsRes, required this.index});

  final Apartments apartmentsRes;
  final int index;

  @override
  State<TimeAgoWidget> createState() => _TimeAgoWidgetState();
}

class _TimeAgoWidgetState extends State<TimeAgoWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:10,
      left: 15,
      child: ClipRRect(
        // Add ClipRRect
        borderRadius: BorderRadius.circular(1.7),
        child: BackdropFilter(
          // Add BackdropFilter
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          // Adjust blur intensity
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(1.7),
            ),
            child: Text(
              "${widget.apartmentsRes.data?[widget.index].timeAgo ?? "التاريخ"} ",
              style: TextStyle(
                color: Colors.grey.shade300,
                
                fontSize: 14,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
