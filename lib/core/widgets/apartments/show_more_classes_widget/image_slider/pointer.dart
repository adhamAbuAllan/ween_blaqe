import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import '../../../../../api/photos.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/get_controllers.dart';
// import '../../../../../controller/auth_provider.dart'; // Assuming this is where imageOfApartmentController is

class PointerOfImage extends StatefulWidget {
  const PointerOfImage({
    super.key,
    required this.imageList,
    required this.oneApartment,
  });

  final List<Photos> imageList;
  final DataOfOneApartment oneApartment;


  @override
  State<PointerOfImage> createState() => _PointerOfImageState();
}

class _PointerOfImageState extends State<PointerOfImage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.imageList.asMap().entries.map((entry) {
          int index = entry.key;

          return GestureDetector(
            onTap: () {
              // Update the current photo index on tap
              setState(() {

                widget.oneApartment.currentPhotoIndex.value = index;
                imageOfApartmentController.carouselSliderController.animateToPage(
                  widget.oneApartment.currentPhotoIndex.value,
                );
              });
            },
            child: Obx(() {
              // Observe the current photo index and apply the pointer style accordingly
              bool isActive =
                  widget.oneApartment.currentPhotoIndex.value == index;

              return AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(1.5),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? (isActive
                              ? kPrimaryColor300LightMode
                              : kPrimaryColor300DarkMode)
                          .withOpacity(isActive ? 0.9 : 0.4)
                      : (isActive
                              ? kPrimaryColorLightMode
                              : kPrimaryColorDarkMode)
                          .withOpacity(isActive ? 0.9 : 0.4),
                  // Adjust opacity based on active state
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: themeMode.isLight
                                ? kPrimaryColorLightMode.withOpacity(0.1)
                                : kPrimaryColorDarkMode.withOpacity(0.1),
                            spreadRadius: 7,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                duration: const Duration(milliseconds: 300),
              );
            }),
          );
        }).toList(),
      ),
    );
  }
}
