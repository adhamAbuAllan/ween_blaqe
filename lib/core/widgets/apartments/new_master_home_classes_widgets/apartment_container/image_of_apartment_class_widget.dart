import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

class ApartmentMainImage extends StatelessWidget {
  final OneApartment apartmentsRes;
  final int index;

  const ApartmentMainImage(
      {super.key, required this.apartmentsRes, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(7 / 2),
            child: Image(
              errorBuilder: (context, error, stackTrace) {
                return SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 367,
                      height: 220,
                      borderRadius: BorderRadius.circular(7 / 2)),
                );
              },
              image: CachedNetworkImageProvider(
                  apartmentsRes.data?[index].photos?[0].url ??
                      apartmentsRes.data![0].photos![0].url!
                  // 'https://via.placeholder.com/150'
                  ),
              height: 220,
              width: MediaQuery.of(context).size.width - 32,
              fit: BoxFit.cover,
            )),
        TimeAgoWidget(apartmentsRes: apartmentsRes, index: index),
      ],
    );
  }
}
class TimeAgoWidget extends StatefulWidget {
  const TimeAgoWidget({super.key, required this.apartmentsRes, required this.index});
  final OneApartment apartmentsRes;
  final int index;
  @override
  State<TimeAgoWidget> createState() => _TimeAgoWidgetState();
}

class _TimeAgoWidgetState extends State<TimeAgoWidget> {
  @override
  Widget build(BuildContext context) {
    return         Positioned(
      bottom: 5,
      left: 5,
      child: ClipRRect( // Add ClipRRect
        borderRadius: BorderRadius.circular(1.7),
        child: BackdropFilter( // Add BackdropFilter
          filter:ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(1.7),
            ),
            child: Text(
              "${widget.apartmentsRes.data?[widget.index].timeAgo} ",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontFamily: "IBM",
                fontSize: 14,shadows: [
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

