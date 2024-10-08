// import 'package:carousel_slider_plus/carousel_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:flutter/material.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/nums.dart';
import 'custom_slider.dart';

// import 'package:carousel_slider_plus/carousel_slider_plus.dart' ;
// import 'package:smooth_page_indicator/src/painters/worm_painter.dart';
class ImageSliderWithPointer extends StatefulWidget {
  const ImageSliderWithPointer({
    super.key,
    // required this.itemsOfWidgets,
    required this.items,
    required this.controller,
    // required this.myEntry,
    // this.onPaageChanged,
    this.onPageChange,
    required this.current,
    // required this.curve,
    required this.duration,
    // required this.tag
  });

  final List<Photos> items;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChange;
  final int current;
  final CarouselSliderController controller;
  final Duration duration;

  // Curve curve;
  // final   Object tag;
  @override
  State<StatefulWidget> createState() {
    return _ImageSliderWithPointer();
  }
}

class _ImageSliderWithPointer extends State<ImageSliderWithPointer> {
  // indexController () {
  //     for (int i = 0; widget.items[i].id! <= widget.items.length;  i++ ) {
  //       if (i <= widget.items.length&& i== widget.items[i].id!) {
  //         setState(() {
  //           current = widget.items[i].id??0;
  //           debugPrint("the current in for , i++ : $i;");
  //         });
  //       } else if (i >= widget.items.length&& i== widget.items[i].id!) {
  //         setState(() {
  //           current = (widget.items[i].id!-1);
  //           debugPrint("the current in for , i-- : $i;");
  //         });
  //       }
  //     }
  //   }
  // int indexCurrent (){
  //   for(int i = 0; i < widget.items.length; i++ ) {
  //     current = i;
  //     return current;
  //   }
  //   return current;
  // }

  @override
  void initState() {
    super.initState();
    // indexController();
  }

  // final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildCarouselSlider(
          // tag:widget.tag ,
          controller: widget.controller,
          context: context,
          photos: widget.items,
          onPageChange: widget.onPageChange,
          current: widget.current),
      const SizedBox(
          // height: 2,
          ),
      // BuildContext context ,
      // int current,
      // List<Photos> photos,
      // CarouselController controller
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ThePointerOfImage(
          photos: widget.items, duration: widget.duration,
          // widget.curve,
          current: widget.current, controller: widget.controller,
        ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: widget.items.asMap().entries.map((entry) {
//           return GestureDetector(
//               onTap: ()
//               {
//                 setState(() {
//                   widget.controller.animateToPage(entry.key);
//                   print("the pointer is animated");
//
//                 });
//               },
//               //
//               // => setState(() {
//               //   widget.controller
//               //       .animateToPage(entry.key);
//               // }),
// //             onTap: () {
// //               setState(() {
// // return
// //                 widget.current = entry.key;
// //                        widget.controller
// //                           .animateToPage(entry.key);
// //                 // widget.current = entry.key;
// //                 // widget.controller.animateToPage(entry.key);
// //                 debugPrint("the current in pionter file is : ${widget.current}");
// //             //     if (widget.items[entry.key] == entry.key) {
// //             //       print('the current is itself of entry.key ?');
// //             //     }
// //             //     widget.items.length = entry.key;
// //             //     // widget.controller.jumpToPage(entry.key);
// //               });
// //             },
//             child: thePointerOfImage(entry, context, widget.current!,widget.items,widget.controller),
//           );
//         }).toList(),
//       ),
      ),
    ]);
  }
}

class ThePointerOfImage extends StatefulWidget {
  const ThePointerOfImage({
    super.key,
    required this.photos,
    required this.duration,
    this.current, required this.controller,
  });

  final List<Photos> photos;
  final Duration duration;
  final CarouselSliderController controller;
// Curve curve,
  final int? current;

  @override
  State<ThePointerOfImage> createState() => _ThePointerOfImageState();
}

class _ThePointerOfImageState extends State<ThePointerOfImage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: widget.photos.asMap().entries.map((entry) {
        return GestureDetector(
          // onTap: () {
          //   setState(() {
          //     widget.controller.animateToPage(
          //       entry.key,
          //       duration: widget.duration, // Set the duration for the animation
          //       // curve:  Car
          //     );
          //   });
          //
          //
          //   debugPrint("entry.key : --${entry.key}");
          // },
          child: AnimatedContainer(
            duration: widget.duration,
            curve: Curves.linear,
            width: 12.0,
            height: 12.0,
            // width: (12 / 2),
            // height: (12 / 2),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: (BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(7 / 3.5),
                //   borderRadius: BorderRadiusDirectional.circular((12/2)),
                shape: BoxShape.rectangle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? themeMode.isDark
                            ? kPrimaryColor300LightMode
                            : kPrimaryColor300DarkMode
                        : themeMode.isDark
                            ? kPrimaryColorLightMode
                            : kPrimaryColorDarkMode
                    // ? Colors.white.withOpacity(.9)
                    // : Colors.white.withOpacity(.7)
                    )
                    .withOpacity(widget.current == entry.key ? 0.9 : 0.4))),
          ),
        );
      }).toList()),
    );
    // children: _pointer(photos, context, current,duration
    //   // ,curve
    // ).toList());
  }
}

// Row thePointerOfImage(
//     BuildContext context, List<Photos> photos, Duration duration,
// // Curve curve,
//     {int? current}) {
//   return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: _pointer(photos, context, current,duration
//           // ,curve
//       ).toList());
// }

// Iterable<GestureDetector> _pointer(List<Photos> photos, BuildContext context, int? current,Duration
// duration,
//     // Curve curve
//     ) {
//   return photos.asMap().entries.map((entry) {
//       return GestureDetector(
//         // onTap: () {
//         //
//         //   controller?.animateToPage(entry.key,
//         //     duration:duration , // Set the duration for the animation
//         //     curve:  curve
//         //   );
//         //   print("the pointer is animated");
//         // },
//         child: AnimatedContainer(
//           duration:duration,curve: Curves.linear,
//           width: 12.0,
//           height: 12.0,
//           // width: (12 / 2),
//           // height: (12 / 2),
//           margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//           decoration: (BoxDecoration(
//               borderRadius: BorderRadiusDirectional.circular(7 / 3.5),
//               //   borderRadius: BorderRadiusDirectional.circular((12/2)),
//               shape: BoxShape.rectangle,
//               color: (Theme.of(context).brightness == Brightness.dark
//                       ? kPrimaryColor300
//                       : kPrimaryColor
//                   // ? Colors.white.withOpacity(.9)
//                   // : Colors.white.withOpacity(.7)
//                   )
//                   .withOpacity(current == entry.key ? 0.9 : 0.4))),
//
//         ),
//       );
//     });
// }
