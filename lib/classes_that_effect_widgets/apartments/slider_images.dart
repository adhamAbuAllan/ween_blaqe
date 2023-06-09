import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../i_well_delete_it/images_unnussery/unnussery_images.dart';
import '../../widgets/widgets_that_effect_another_widgets/image_sliders.dart';
var indexing = 0;
//this Image Slider that off and that didn't have pointer
class ImagesSlider extends StatefulWidget {
  int ?index = indexing;

  List<Widget> images;
  CarouselPageChangedReason ? reason;
  final CarouselController ?myController;
Function(int,CarouselPageChangedReason) ?onChanged;

  ImagesSlider({Key? key,
   required this.images,
     this.myController,
     this.index,
     this.onChanged,
    this.reason
   }) : super(key: key);

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  @override
  Widget build(BuildContext context) {
    return
       CarouselSlider(

         carouselController:widget.myController ,
        options: CarouselOptions(
          // autoPlay: true,
          aspectRatio: 2.0,

          enlargeCenterPage: true,
          // viewportFraction: 1,
          // enlargeFactor: Checkbox.width,
          padEnds: true,
          onPageChanged: (c,t){
            setState(() {
              indexing = c;

            });
          },
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
        items: widget.images,
      );


  }
}
 //this class is on and have pointer
class ImageSliderWithPointer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageSliderWithPointer();
  }
}

class _ImageSliderWithPointer extends State<ImageSliderWithPointer> {
  int current = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(

          items: imageSliders,
          carouselController: controller,
          options: CarouselOptions(
              autoPlay: false,

              enlargeCenterPage: true,
              aspectRatio: 2.0,
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

              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(7/3.5),
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.orange.shade200
                        : Colors.orange)
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );

  }
}