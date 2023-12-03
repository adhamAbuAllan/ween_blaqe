import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';


class ApartmentMainImage extends StatelessWidget {
 final OneApartment apartmentsRes;
final  int index;

 const ApartmentMainImage(
      {super.key, required this.apartmentsRes, required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(7 / 2),
        child: Image(
          errorBuilder: (context, error, stackTrace) {
            return SkeletonAvatar(

              style: SkeletonAvatarStyle(
                  width: 367,
                  height: 220,
                  borderRadius: BorderRadius.circular(7/2)),
            );

          },
          image: CachedNetworkImageProvider(

              apartmentsRes.data?[index].photos?[0].url ??apartmentsRes.data![0].photos![0].url!
                  // 'https://via.placeholder.com/150'
          ),

        height: 220,width: 367,
          fit: BoxFit.cover,
        ));
  }
}
