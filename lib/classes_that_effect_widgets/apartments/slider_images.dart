import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets_that_effect_another_widgets/image_sliders.dart';
class ImagesSlider extends StatelessWidget {
  List<Widget> images;
   ImagesSlider({Key? key,
   required this.images
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       CarouselSlider(
        options: CarouselOptions(
          // autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          // viewportFraction: 1,
          // enlargeFactor: Checkbox.width,
          padEnds: true,
          animateToClosest: true,
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayInFiniteScroll: true,
          pageSnapping: true,
          enableInfiniteScroll: false,
          // reverse: true,
          disableCenter: true,
          // enlargeFactor: ,
          // initialPage: 1,
          viewportFraction: 0.93,
          height: 240,
          scrollDirection: Axis.horizontal,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: images,
      );


  }
}
