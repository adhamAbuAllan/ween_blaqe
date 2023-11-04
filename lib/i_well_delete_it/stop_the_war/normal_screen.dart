// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../../core/widgets/apartments/show_more_classes_widget/image_slider/pointer.dart';
//
//
// main()  {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: NormalScreen(),
//   ));
// }
//
// List<String> _imageList = [
//   'assets/images/stop_war/b1.jpg',
//   'assets/images/stop_war/b2.png',
//   'assets/images/stop_war/b3.png',
//   'assets/images/stop_war/c1.jpeg',
//   'assets/images/stop_war/c2.jpg',
//   'assets/images/stop_war/c3.jpg',
//   'assets/images/stop_war/c4.jpg',
//   'assets/images/stop_war/c5.png',
//   'assets/images/stop_war/c6.png',
//   'assets/images/stop_war/c7.png',
// ];
// // final List<String> imageList2 = [
// //   'assets/images/apartmen',
// //   'assets/images/apartments_images/advantages/hot-water.png',
// //   'assets/images/apartments_images/advantages/gas-stove.png',
// //   'assets/images/apartments_images/advantages/first-aid-box.png',
// //   'assets/images/apartments_images/advantages/kitchen-set.png',
// //   'assets/images/assets/images/apartments_images/advantages/microwave.png',
// //   'assets/images/apartments_images/advantages/fire-extinguisher.png',
// //   'assets/images/apartments_images/advantages/refrigerator-.png',
// //   'assets/images/apartments_images/advantages/wifi.png',
// //   'assets/images/apartments_images/advantages/plate.png',
// // ];
//
// class NormalScreen extends StatefulWidget {
//   const NormalScreen({
//     super.key,
//   });
//
//   @override
//   State<NormalScreen> createState() => _NormalScreenState();
// }
//
// class _NormalScreenState extends State<NormalScreen> {
//   int current = 0;
//
//   bool removeWidget = false;
//   double _width = 45.0;
//   double _widthContainer = 375;
//   double _height = 28.0;
//   double _heightContainer = 50;
//   Duration duration = const Duration(milliseconds: 700);
//   bool makeChange = false;
//   int sec = 5;
//   int couner = 0;
//
//   final CarouselController controller = CarouselController();
//
//   // PageController controllera = PageController();
//
//   // final CarouselController controllera = CarouselController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Align(
//         // alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 42,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   "assets/images/svg_images/tiktok_icons/LIVE.svg",
//                   width: 28,
//                   height: 28,
//                 ),
//                 const SizedBox(
//                   width: 50 + 30,
//                 ),
//                 Text("Following",
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.5),
//                       fontSize: 15,
//                       fontFamily: 'TT Norms',
//                       fontWeight: FontWeight.w600,
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: [
//                     const SizedBox(
//                       height: 14,
//                     ),
//                     const Text("For You",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'TT Norms',
//                           fontWeight: FontWeight.w800,
//                           fontSize: 15,
//                         )),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                         width: 29,
//                         height: 3,
//                         decoration: BoxDecoration(
//                             // border: Border.all(width: 2,),
//                             borderRadius: BorderRadiusDirectional.circular(8),
//                             color: Colors.white))
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 50 + 30,
//                 ),
//                 SvgPicture.asset(
//                   "assets/images/svg_images/tiktok_icons/Vector.svg",
//                   width: 24,
//                   height: 24,
//                 )
//               ],
//             ),
//             const Spacer(),
//             //image , icons , discription
//             Row(
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       //the text
//                       const Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Wrap(
//                           spacing: 5,
//                           direction: Axis.vertical,
//                           children: [
//                             SizedBox(
//                               height: 60 * 9.6,
//                             ),
//                             Row(
//                               children: [
//                                 FaIcon(FontAwesomeIcons.solidImage,
//                                     color: Colors.white, size: 16),
//                                 SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text("Photo",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       fontFamily: 'TT Norms',
//                                     )),
//                               ],
//                             ),
//                             Text("the Humanity",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                   fontFamily: 'TT Norms',
//                                 )),
//                             Text("Gaza is ethnic cleansing ",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontFamily: 'TT Norms',
//                                 ))  ,
//                             Text("#ethnic_cleansing #no_humanity...See more",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontFamily: 'TT Norms',
//                                 )),
//                           ],
//                         ),
//                       ),
//
//
//                       //the images
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 47 * 2.0
//                         ),
//                         child: ImageSliderWithPointer(
//                             // controllera: controllera,
//                             items: _imageList,
//                             current: current,
//                             controller: controller,
//                             myEntry: MapEntry(current, imageList[current]),
//                             autoPlayer: false,
//                             duration: duration,
//                             onPaageChanged: ((index, reason) async {
//                               setState(()  {
//                                 current = index;
//                                 // controllera.jumpToPage(current);
//                               });
//                               print("local current : $current ");
//                               // if(current!= current){
//                               //
//                               //   print("the index is $index, the current is $current and index is not = index");
//                               // }
//
//                               // while(current>=3){
//                               //
//                               // }
//                               // if(current >= 3){
//                               //
//                               // }
//                               setState(() {
//                                 // controller.jumpToPage(index++);
//                                 // if(index == 3 ){
//                                 //   for(int i = current; current <= imageList.length;i++ ) {
//                                 //     setState(() {
//                                 //       // i++;
//                                 //       current++;
//                                 //       setState(() {
//                                 //
//                                 //       });
//                                 //       controller.jumpToPage(current);
//                                 //     });
//                                 //   }
//                                 //
//                                 //
//                                 // }
//
//                                 if (index == 3) {
//                                   print("index  : $index");
//                                   print("current  : $current");
//
//                                   for (int i = 3; i < _imageList.length; i++) {
//                                     setState(() {
//                                       controller.animateToPage(i,
//                                           duration: Duration(
//                                             seconds: _imageList.length,
//                                           ));
//                                     });
//                                   }
//                                   setState(() {
//                                     _width = _width == 45.0 ? 45.0 * 3 : 45.0;
//                                     _height = _height == 28.0 ? (28.0 * 3)-13 : 28.0;
//                                     _heightContainer =
//                                         _heightContainer == 50 ? 50 * 3 : 50;
//                                     if (sec > 2) {
//                                       makeChange = true;
//                                     }
//                                   });
//                                 }
//
//                                 // do {
//                                 //   setState(() {
//                                 //     // current++;
//                                 //     index++;
//                                 //     controller.jumpToPage(index);
//                                 //     // controller.animateToPage(index);
//                                 //
//                                 //     // current = index;
//                                 //   });
//                                 //   print(current);
//                                 // } while (index > 3 && index != imageList.length);
//                               });
//                             })),
//                       ),
//
//
//
//                       //the icons
//                       Align(
//                           alignment: Alignment.centerRight,
//                           child: Wrap(
//                             direction: Axis.vertical,
//                             // alignment: WrapAlignment.start,
//                             // crossAxisAlignment: WrapCrossAlignment.center,
//                             spacing: -87,
//                             // Adjust the horizontal spacing as needed
//                             // runSpacing: .0,
//                             // Adjust the vertical spacing as needed
//                             children: [
//                               const SizedBox(
//                                 height: 39 * 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 2.5, bottom: 65.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           color: Colors.white.withOpacity(.9),
//                                           width: 1)),
//                                   child: CircleAvatar(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.0),
//                                     radius: 22,
//                                     child: SvgPicture.asset(
//                                         "assets/images/svg_images/tiktok_icons/Account Stroke Icon.svg",
//                                         color: Colors.green),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 15, top: 10),
//                                 child: SvgPicture.asset(
//                                   "assets/images/svg_images/tiktok_icons/Plus Button.svg",
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 10.0),
//                                 child: iconInCenterRight("20M",
//                                     "assets/images/svg_images/tiktok_icons/Like.svg"),
//                               ),
//                               iconInCenterRight("23k",
//                                   "assets/images/svg_images/tiktok_icons/Comments.svg"),
//                               iconInCenterRight("10k",
//                                   "assets/images/svg_images/tiktok_icons/Bookmark.svg"),
//                               iconInCenterRight("7k",
//                                   "assets/images/svg_images/tiktok_icons/Share.svg"),
//                               Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 10, top: 98),
//                                   child: SvgPicture.asset(
//                                     "assets/images/svg_images/tiktok_icons/Disc.svg",
//
//                                     height: 49,
//                                     width: 130,
//                                     // color: Color,
//                                   )),
//                             ],
//                           )),
//                       // const Column(
//                       //   children: [
//                       //     Align(
//                       //       alignment: Alignment.bottomLeft,
//                       //     ),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//              const Spacer(),
//             //search container
//             AnimatedContainer(
//               height: 30,
//               margin: const EdgeInsets.symmetric(vertical: 1),
//               decoration: BoxDecoration(
//
//                   color: Colors.white.withOpacity(.09),
//                   border: Border.symmetric(
//
//                       horizontal: BorderSide(
//
//                           width: 1, color: Colors.white.withOpacity(.03)))),
//               duration: const Duration(seconds: 4),
//               child: Row(
//
//                   // mainAxisAlignment: ,
//                   children: [
//
//                 const SizedBox(
//                   width: 10,
//
//                 ),
//                 SvgPicture.asset(
//                   "assets/images/svg_images/tiktok_icons/Vector.svg",
//                   width: 14,
//                   height: 14,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Text(
//                   "Search . Gaza ethnic cleansing",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontFamily: 'TT Norms',
//                   ),
//                 ),
//                 const Spacer(),
//                 Transform.rotate(
//                     angle: 3.1416,
//                     child: SvgPicture.asset(
//                       "assets/images/svg_images/tiktok_icons/Left Arrow Icon.svg",
//                       width: 14,
//                       height: 14,
//                     )),
//                 const SizedBox(
//                   width: 10
//                 )
//               ]),
//             ),
//
//             // Spacer(),
//             Divider(
//               height: 1,
//               thickness: 1,
//               color: Colors.white.withOpacity(.1),
//               indent: 0,
//               endIndent: 0,
//             ),
//             Expanded(
//               flex: 2*200,
//               child: AnimatedContainer(
//                 width: _widthContainer,
//                 height: _heightContainer,
//                 duration: Duration(seconds: sec),
//                 curve: Curves.linear,
//                 child: Container(
//                   decoration: const BoxDecoration(color: Colors.black),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //!Home
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/images/svg_images/tiktok_icons/Home Solid Icon.svg",
//                               width: 20 - 2,
//                               height: 24 - 2,
//                             ),
//                             const Text("Home",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                   fontFamily: 'TT Norms',
//                                 )),
//                           ],
//                         ),
//                       ),
//                       //!Discovery
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Opacity(
//                             opacity: 0.7,
//                             child: Image(
//                                 width: 24,
//                                 height: 24,
//                                 image: AssetImage(
//                                   "assets/images/svg_images/tiktok_icons/discovery.png",
//                                 )),
//                           ),
//
//                           Text("Discover",
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.7),
//                                 fontSize: 10,
//                                 fontFamily: 'TT Norms',
//                               )),
//
//                           // const Text("Inbox",
//                           //     style: TextStyle(
//                           //       fontFamily: 'TT Norms',
//                           //       fontSize: 10,
//                           //       color: Colors.white
//                           //     ))
//                         ],
//                       ),
//
//                       //////////////////////////////// don't go up /////////////////////////////////
//
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           GestureDetector(
//
//                             child: AnimatedContainer(
//                               duration: Duration(seconds: sec),
//                               width: _width,
//                               height: _height,
//                               curve: Curves.linear,
//                               child: SvgPicture.asset(
//                                 makeChange == false
//                                     ? "assets/images/svg_images/tiktok_icons/add_of_tiktok_app_icon.svg"
//                                     : "assets/images/svg_images/tiktok_icons/stop_war.svg",
//                               ),
//                             ),
//                             onTap: () {
//                               if (couner == 15) {
//                                 _width = 45;
//                                 _height = 28;
//                                 _heightContainer = 50;
//                                 setState(() {
//                                   makeChange = false;
//                                 });
//                                 // setState(() {
//                                 //   if(current == imageList.length){
//                                 //     setState(() {
//                                 //       imageList = imageList2;
//                                 //
//                                 //     });
//                                 //     for(int i = 0; i< imageList2.length ; i++ ) {
//                                 //       setState(() {
//                                 //         controller.animateToPage(i,duration: Duration(seconds: imageList2.length*3,) );
//                                 //
//                                 //       });
//                                 //
//                                 //
//                                 //     }
//                                 //   }
//                                 //
//                                 //
//                                 //
//                                 // });
//                               }
//                               couner++;
//
//                               print("global current is : $current");
//                               // setState(() {
//                               //   current++;
//                               //   setState(() {
//                               //     controller.animateToPage(current);
//                               //   });
//                               // });
//                               // setState(() {
//
//                               // });
//                               //   if (current < imageList.length) {
//                               //     setState(() {
//                               //       current++;
//                               //       controller.jumpToPage(current);
//                               //     });
//                               //
//                               //
//                               //   }
//                               //   if(current == 2 ){
//                               //     for(int i = 2 ; i < imageList.length;i++ ) {
//                               //       setState(() {
//                               //         current = i;
//                               //         i++;
//                               //         controller.jumpToPage(current);
//                               //
//                               //       });
//                               //
//                               //     }
//                               //   }
//                               //
//                               //
//                             },
//                           ),
// // Spacer(),                        // const Text("Inbox",
//                           //     style: TextStyle(
//                           //       fontFamily: 'TT Norms',
//                           //       fontSize: 10,
//                           //       color: Colors.white
//                           //     ))
//                         ],
//                       ),
//
//                       //////////////////////////////// don't go down /////////////////////////////////
//
//                       //inbox
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SvgPicture.asset(
//                             "assets/images/svg_images/tiktok_icons/Message Stroke Icon.svg",
//                             width: 20 - 2,
//                             height: 24 - 2,
//                           ),
//                           Text("Inbox",
//                               style: TextStyle(
//                                   fontFamily: 'TT Norms',
//                                   fontSize: 10,
//                                   color: Colors.white.withOpacity(0.7)))
//                         ],
//                       ),
//                       //!Profile
//                       Padding(
//                         padding: const EdgeInsets.only(right: 5.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/images/svg_images/tiktok_icons/Account Stroke Icon.svg",
//                               width: 20 - 2,
//                               height: 24 - 2,
//                             ),
//                             Text("Porfile",
//                                 style: TextStyle(
//                                     fontFamily: 'TT Norms',
//                                     fontSize: 10,
//                                     color: Colors.white.withOpacity(0.7)))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   SizedBox iconInCenterRight(String text, image) {
//     return SizedBox(
//       // height: 1,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 0, top: 100.0),
//         child: Column(
//           children: [
//             SvgPicture.asset(
//               image,
//               height: 30,
//               width: 130,
//               color: Colors.white.withOpacity(.9),
//             ),
//             const SizedBox(height: 3),
//             Text(
//               text,
//               style: TextStyle(
//                   fontFamily: 'TT Norms',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 10,
//                   color: Colors.white.withOpacity(0.9)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
