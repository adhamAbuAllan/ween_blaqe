import 'package:carousel_slider_plus/carousel_controller.dart';
// import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/controller/pointer_of_images_controller.dart';


class ImageOfApartmentController extends GetxController {
  CarouselSliderController carouselSliderController = CarouselSliderController();

  // Map to store the photo index for each apartment by its ID
  Map<int, RxInt> currentPhotoIndexMap = {};


  // Function to get or initialize the current photo index for an apartment
  RxInt getCurrentPhotoIndex(int apartmentId) {
    // Initialize if it doesn't exist for a particular apartment
    if (!currentPhotoIndexMap.containsKey(apartmentId)) {
      currentPhotoIndexMap[apartmentId] = 0.obs;
    }
    return currentPhotoIndexMap[apartmentId]!;
  }
}
class ShowDetailOfImageOfApartmentController extends GetxController {
  PointerController pointerController = PointerController();
  PageController pageController = PageController();
  void Function(int)? onPageChanged;
}
