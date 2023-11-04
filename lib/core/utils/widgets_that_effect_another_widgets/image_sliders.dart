import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/i_well_delete_it/images_unnussery/unnussery_images.dart';

import '../../../api/apartments_api/apartments.dart';
import '../../../api/photos.dart';
import '../../../i_well_delete_it/stop_the_war/normal_screen.dart';





//last edit
//10/28/2023 -v
// class BuildContainerOfImage{
  // Photos images = Photos()  ;
  //
  // final List<Widget> imageSliders = images.url
  //     .map((item) => Container(
  // margin: const EdgeInsets.all(5.0),
  // child: ClipRRect(
  // borderRadius: const BorderRadius.all(Radius.circular(7.0)),
  // child: Stack(
  // children: <Widget>[
  // Image.network(item.data?? "https://via.placeholder.com/150", fit: BoxFit.cover, width: 1000.0),
  // Positioned(
  // bottom: 0.0,
  // left: 0.0,
  // right: 0.0,
  // child: Container(
  // decoration: const BoxDecoration(
  // gradient: LinearGradient(
  // colors: [
  // Color.fromARGB(0, 0, 0, 0),
  // Color.fromARGB(0, 0, 0, 0)
  // ],
  // begin: Alignment.bottomCenter,
  // end: Alignment.topCenter,
  // tileMode: TileMode.mirror
  // // stops: List.empty()
  //
  // ),
  // ),
  // padding: const EdgeInsets.symmetric(
  // vertical: 10.0, horizontal: 20.0),
  // ),
  // ),
  // ],
  // )),
  // ))
  //     .toList();









// }








//first -v


//  Container frameOfPhoto(Photos photo)  {
//   return Container(
//     margin: const EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(7.0)),
//         child: Stack(
//           children: <Widget>[
//
//             Image.network(  photo.url??'https://via.placeholder.com/150', fit: BoxFit.cover, width: 1000.0),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(0, 0, 0, 0),
//                         Color.fromARGB(0, 0, 0, 0)
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       tileMode: TileMode.mirror
//                     // stops: List.empty()
//
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//               ),
//             ),
//           ],
//         )),
//   );
// }
//
//
//
//
//
//
//
//
//
//












//
// // class TestImageSlider extends StatelessWidget {
// //   final int current;
// //   final BuildContext myContext;
// //   final CarouselController controller = CarouselController();
// //   late final ArrayOfApartments ? apartments;
// //
// //   TestImageSlider({Key? key, required this.current, required this.myContext, this.apartments})
// //       : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children:
// //       // apartments!.photos!
// //         []
// //
// //           .asMap().entries.map((entry) {
// //         return GestureDetector(
// //           onTap: () => controller.animateToPage(entry.key),
// //           child: Container(
// //             width: 12.0,
// //             height: 12.0,
// //             margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
// //             decoration: BoxDecoration(
// //                 borderRadius: BorderRadiusDirectional.circular(12),
// //                 shape: BoxShape.rectangle,
// //                 color: (Theme.of(myContext).brightness == Brightness.dark
// //                         ? Colors.white.withOpacity(.9)
// //                     : Colors.white.withOpacity(.7))
// //                     .withOpacity(current == entry.key  ? 0.9 : 0.4)),
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// // }
