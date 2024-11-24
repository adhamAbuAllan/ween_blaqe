// import 'dart:ffi';

// import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../../../../api/photos.dart';
import '../../../../../../constants/nums.dart';

class DetailImageScreen extends StatefulWidget {
  final List<Photos> imageList;
  final BuildContext context;
  final int initialIndex;
  final DataOfOneApartment oneApartment;

  const DetailImageScreen({
    super.key,
    required this.imageList,
    required this.context,
    required this.initialIndex,
    required this.oneApartment,
  });

  @override
  DetailImageScreenState createState() => DetailImageScreenState();
}

class DetailImageScreenState extends State<DetailImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Stack(
        children: [
          PhotoViewGalleryWidget(
            imageList: widget.imageList,
            initialIndex: widget.initialIndex,
            onPageChanged: (index) {
              // Update the index in the controller if needed
              widget.oneApartment.currentPhotoIndex.value = index;
              imageOfApartmentController.carouselSliderController.animateToPage(
                widget.oneApartment.currentPhotoIndex.value,
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context)
                .padding
                .top+10, // Adds space for the status bar
            right: 16.0,
            child: CircleAvatar(
              backgroundColor: themeMode. isLight ? Colors.black.withOpacity(0.5): Colors.white.withOpacity(0.5),
              // Semi-transparent background
              child: BackButton(
                color:  themeMode.isLight ?
                kTextColorDarkMode: kTextColorLightMode,

              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoViewGalleryWidget extends StatefulWidget {
  final List<Photos> imageList;
  final int initialIndex;
  final ValueChanged<int>? onPageChanged;

  const PhotoViewGalleryWidget({
    super.key,
    required this.imageList,
    required this.initialIndex,
    this.onPageChanged,
  });

  @override
  PhotoViewGalleryWidgetState createState() => PhotoViewGalleryWidgetState();
}

class PhotoViewGalleryWidgetState extends State<PhotoViewGalleryWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: widget.imageList.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imageList[index].url!),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },
      pageController: _pageController,
      onPageChanged: (index) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(index);
        }
      },
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: BoxDecoration(
        color: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
      ),
    );
  }
}
