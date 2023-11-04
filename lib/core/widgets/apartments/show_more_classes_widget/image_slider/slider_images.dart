// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
// import 'package:ween_blaqe/core/utils/widgets_that_effect_another_widgets/image_sliders.dart';
// import '../../../../../i_well_delete_it/images_unnussery/unnussery_images.dart';
//
// var indexing = 0;
//
// //this Image Slider that off and that didn't have pointer
// class ImagesSlider extends StatefulWidget {
//   int? index = indexing;
//   final List<Widget> images;
//   final CarouselPageChangedReason? reason;
//   final CarouselController? myController;
//   Function(int, CarouselPageChangedReason)? onChanged;
//
//   ImagesSlider(
//       {Key? key,
//       required this.images,
//       this.myController,
//       this.index,
//       this.onChanged,
//       this.reason})
//       : super(key: key);
//
//   @override
//   State<ImagesSlider> createState() => _ImagesSliderState();
// }
//
// class _ImagesSliderState extends State<ImagesSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       carouselController: widget.myController,
//       options: CarouselOptions(
//         // autoPlay: true,
//         aspectRatio: 2.0,
//
//         enlargeCenterPage: true,
//         // viewportFraction: 1,
//         // enlargeFactor: Checkbox.width,
//         padEnds: true,
//         onPageChanged: (c, t) {
//           setState(() {
//             indexing = c;
//           });
//         },
//         animateToClosest: true,
//         pauseAutoPlayOnTouch: true,
//         pauseAutoPlayOnManualNavigate: true,
//         pauseAutoPlayInFiniteScroll: true,
//         pageSnapping: true,
//         enableInfiniteScroll: false,
//         // reverse: true,
//         disableCenter: true,
//         // enlargeFactor: ,
//         // initialPage: 1,
//         viewportFraction: 0.93,
//         height: 240,
//         scrollDirection: Axis.horizontal,
//         autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//         enlargeStrategy: CenterPageEnlargeStrategy.height,
//       ),
//       items: widget.images,
//     );
//   }
// }
//
// //this class is on and have pointer
//
//
