// import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../../../api/photos.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../controller/pointer_of_images_controller.dart';

class DetailScreen extends StatefulWidget {
  final int initialIndex;
  final List<Photos> imageList;
  final int current;
 final BuildContext context;
 final void Function(DragEndDetails)? onVerticalDragEnd;
  // Object tag;
 final void Function(int)? onPageChanged;
  bool isMove = false;
  PageController controller;

  // (details) {
  // setState(() {
  // debugPrint("is on Tap up !");
  // });
  // }

  DetailScreen({
    required this.initialIndex,
    required this.imageList,
    required this.current,
    this.onVerticalDragEnd,
    required this.context,
    // required this.tag,
    required this.onPageChanged,
    required this.isMove,
    required this.controller,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PointerController pointerController = PointerController();

  bool isPointerVisible = true;
  double startingScale = 1.0;

  @override
  void initState() {
    super.initState();
// newShowMore = NewShowMore(newShowMoreCurrent: _current,);
//     _current = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    // final PageController controller = PageController(initialPage: widget.initialIndex,);
    widget.controller = PageController(initialPage: widget.initialIndex);
    return ColorfulSafeArea(

      bottomColor: Colors.transparent , color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(.2),
        body: GestureDetector(
          onVerticalDragEnd: widget.onVerticalDragEnd,
          onScaleEnd: (details) {
            // print(  "the c is : ${c.prevScaleState.index}");

            setState(() {
              isPointerVisible = !false;
              print("on Scale end : $details");
            });
          },
          child: Stack(
            children: [
              BuildPhotoViewGallery(controller: widget.controller,
                  current: widget.current
                  ,imageList: widget.imageList
                  ,onPageChanged:widget.onPageChanged ),
              // buildPointerOfImageZoom(
              //     controller: widget.controller,
              //     context: context,
              //     current:pointerController.currentValue.toInt(),
              //     imageList: widget.imageList,
              //     isPointerVisible: isPointerVisible,
              //   isMove: widget.isMove
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // PhotoViewGallery buildPhotoViewGallery(
  //     PageController controller, int current) {
  //   return PhotoViewGallery.builder(
  //     allowImplicitScrolling: true,
  //     itemCount: widget.imageList.length,
  //     builder: (context, index) {
  //       return PhotoViewGalleryPageOptions(
  //         imageProvider: NetworkImage(widget.imageList[index].url!),
  //         minScale: PhotoViewComputedScale.contained * 0.8,
  //         maxScale: PhotoViewComputedScale.covered * 2,
  //         heroAttributes: const PhotoViewHeroAttributes(tag: 'apartment'),
  //         onScaleEnd: (context, details, controllerValue) {
  //           // print("details when on Scale End is : $details");
  //           print("controllerValue when on Scale End is : $controllerValue");
  //           if (controllerValue.scale! >= 0.23) {
  //             setState(() {
  //               isPointerVisible = false;
  //             });
  //           } else {
  //             print("isPointerVisible = !false");
  //             setState(() {
  //               isPointerVisible = !false;
  //             });
  //           }
  //         },
  //       );
  //     },
  //     scrollPhysics: const BouncingScrollPhysics(),
  //     backgroundDecoration: BoxDecoration(
  //       color: Colors.grey.withOpacity(.001),
  //     ),
  //     pageController: controller,
  //     // onPageChanged:widget.onPageChanged ,
  //
  //     onPageChanged: widget.onPageChanged,
  //
  //     //  (index) {
  //     //   setState(() {
  //     //     widget.current = index;
  //     //   });
  //     // },
  //   );
  // }
}

class BuildPhotoViewGallery extends StatelessWidget {
  const BuildPhotoViewGallery(
      {super.key,
      // this.pageController,
     required this.controller,
      required this.current,
      required this.imageList,
      this.onPageChanged});

  // final pageController;

  final PageController controller;
  final int current;
  final void Function(int)? onPageChanged;
  final List<Photos> imageList;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      allowImplicitScrolling: true,
      itemCount: imageList.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(imageList[index].url!),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,

          // heroAttributes: const PhotoViewHeroAttributes(tag: ),
          // onScaleEnd: (context, details, controllerValue) {
          //   // print("details when on Scale End is : $details");
          //   print(
          //       "controllerValue when on Scale End is : $controllerValue");
          //   if (controllerValue.scale! >= 0.23) {
          //     setState(() {
          //       isPointerVisible = false;
          //     });
          //   } else {
          //     print("isPointerVisible = !false");
          //     setState(() {
          //       isPointerVisible = !false;
          //     });
          //   }
          // },
        );
      },
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: BoxDecoration(
        color: Colors.grey.withOpacity(.001),
      ),
      pageController: controller,
      // onPageChanged:widget.onPageChanged ,

      onPageChanged: onPageChanged,

      //  (index) {
      //   setState(() {
      //     widget.current = index;
      //   });
      // },
    );
  }
}
