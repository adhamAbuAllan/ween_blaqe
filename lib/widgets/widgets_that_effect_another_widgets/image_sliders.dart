import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import '../../i_well_delete_it/images_unnussery/unnussery_images.dart';

final List<Widget> imageSliders = imgList
    .map((item) => Container(

      margin: const EdgeInsets.all(5.0),

      child: ClipRRect(

          borderRadius: const BorderRadius.all(Radius.circular(7.0)),

          child: Stack(

            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),

              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,

                child: Container(

                  decoration: const BoxDecoration(

                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],

                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      tileMode: TileMode.mirror
                      // stops: List.empty()


                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],

          )
      ),
    ))
    .toList();

class TestImageSlider extends StatelessWidget {
  int current;
  BuildContext myContext;

  TestImageSlider({Key? key,
  required this.current,
  required this.myContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CarouselController controller = CarouselController();
    return    Row(
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

                color: (Theme.of(myContext).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.orange)
                    .withOpacity(current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}





