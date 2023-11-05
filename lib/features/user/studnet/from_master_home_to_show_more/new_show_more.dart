import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skeletons/skeletons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/api/photos.dart';
import 'package:ween_blaqe/controller/pointer_of_images_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import '../../../../constants/nums.dart';
import '../../../../constants/strings.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/pointer.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/zoom_of_image/home.dart';
import '../../../../i_well_delete_it/slove_get_advantage_data/home_screen.dart';

// import '../../../toast_widget.dart';


class NewShowMore extends StatefulWidget {
  const NewShowMore({
    Key? key,
    this.oneApartment,
  }) : super(key: key);
  final DataOfOneApartment? oneApartment;

  // late List<Photos>? photosOfApartment;
  @override
  State<NewShowMore> createState() => _NewShowMoreState();
}

class _NewShowMoreState extends State<NewShowMore> {
  bool _isDataLoaded = false;
  late final List<Photos>? photos = widget.oneApartment?.photos;

  Object tag = 'photo';

  @override
  void initState() {
    super.initState();

    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;
  }

  // depugPrint(widget.oneApartment?.price??"");
  // print(widget.oneApartment?.title??"");
  // print(widget.oneApartment?.type??"");
  // print(widget.oneApartment?.city??"");
  // print(widget.oneApartment?.location??"");
  // print(widget.oneApartment?.rooms??"");
  // print(widget.oneApartment?.description??"");
  //general info box
  // var title = AddAdDataContainer.title;
  // var city = AddAdDataContainer.city;
  // var price = AddAdDataContainer.price;
  // var countOfStudent = AddAdDataContainer.countOfStudent;
  // var location = AddAdDataContainer.address;
  //about apartment box
  // var titleAboutApartmentSM = "المساحة";
  // var imageAboutApartmentSM =
  // "assets/images/apartments_images/about_apartment/area.png";
  // var valueAboutApartmentSM = AddAdDataContainer.squareMeters??0;
  // var titleAboutApartment = "الاًسرّة";
  // var imageAboutApartment =
  //     "assets/images/apartments_images/about_apartment/bed1.png";
  // var valueAboutApartment = 2;
  var imageAboutApartmentRoom =
      "assets/images/apartments_images/about_apartment/room.png";
  var titleAboutApartmentroom = "الغرف";

  // var valueAboutApartmentRoom = AddAdDataContainer.rooms??0;
  // var imageAboutApartmentBathroom =
  //     "assets/images/apartments_images/about_apartment/bathroom.png";
  // var valueAboutApartmentBathroom = AddAdDataContainer.bathRooms??0;
  // var titleAboutApartmentBathroom = "الحمامات";
  // final CarouselController imageController = CarouselController();

  // var ownIndex = 0;
// var arrayOfApartments = widget.arrayOfApartments;
  int current = 0;
  PointerController pointerController = PointerController();

  // Assuming playersRes is the response you received
  final CarouselController controller = CarouselController();
   PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isMove = false;
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //back arrow button
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:  Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black.withOpacity(.7),
                      )),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            // image/s of apartment
            _isDataLoaded
                ? SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: 368,
                        height: 240,
                        borderRadius: BorderRadius.circular(7)),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            controller: pageController,
                            isMove: isMove,
                            current: current,
                            initialIndex: current,
                            onPageChanged: (index) {
                              setState(() {
                                debugPrint("current still : $current");
                                current = index;
                                pointerController.currentValue = current.obs;


                                // pageController = PageController(initialPage: current);
                                // pageController.jumpToPage(current);
                                controller.jumpToPage(current);

                                print("the current.reactive.value is:${current.reactive.value}");

                              });
                            },
                            context: context,
                            imageList: widget.oneApartment!.photos!,
                            onVerticalDragEnd: (p0) {
                              setState(() {
                                debugPrint("onVerticalDragEnd");
                                Navigator.pop(context);
                                setState(() {
                                  controller.animateToPage(current);
                                });
                              });
                            },
                            tag: tag,
                          ),
                        ),
                      );
                    },
                    child: ImageSliderWithPointer(
                      controller: controller,
                      items: photos!,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                      current: current,
                      tag: tag,
                      onPageChange: (index, p1) {
                        setState(() {
                          current = index;
                          print("the p1 is like this : $p1");

                          // current = lastIndex!;

                          // photos?[index] = photos![lastIndex!];
                          // index = lastIndex!;
                        });
                      },
                    ),
                  ),

            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
                // this children have ( general info that : title, price , and location
                // .
                children: [
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          "معلومات عامة",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IBM',
                            color: Colors.black.withOpacity(.7)
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(""),
                      ),
                    ],
                  ),
                  //title
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                            widget.oneApartment?.title ?? ""
                            // data.
                            ,
                            style:  TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 18,
                              fontFamily: 'IBM',
                            )),
                      ),
                    ],
                  ),
                  // location
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text(
                          "المكان:${widget.oneApartment?.city ?? ""
                              

                          // data.
                          }-${widget.oneApartment?.location ?? ""
                          // .data

                          }",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.black.withOpacity(.7),
                            fontFamily: 'IBM',
                          ),
                        ),
                      ),
                      const Expanded(child: Text("")),
                    ],
                  ),
                  //count of student
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                        child: Text(
                            "عدد الطلاب المسموح به:${widget.oneApartment?.countOfStudnet ?? 0}",
                            style:  TextStyle(
                              color: Colors.black.withOpacity(.6),
                              fontSize: 16,
                              fontFamily: 'IBM',
                            )),
                      ),
                      const Expanded(child: Text("")),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                        child:
                            Text("نوع السكن:${widget.oneApartment?.type ?? ""}",
                                style:  TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                  fontSize: 16,
                                  fontFamily: 'IBM',
                                )),
                      ),
                      const Expanded(child: Text("")),
                    ],
                  ),
                  //price
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text(
                          "الأجرة:${widget.oneApartment?.price ?? ""
                          // data.

                          }",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'IBM',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 3, 10),
                        child: Text("شيكل/شهري",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: 'IBM',
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
                children: [
                  //about apartment  text
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          "حول الشقة",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IBM',
                            color: Colors.black.withOpacity(.7)
                          ),
                        ),
                      ),
                      const Expanded(child: Text("")),
                    ],
                  ),

                  //about apartment items
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: OutlinedButton(
                              onPressed: null,
                              style: outlineBox,
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                  Text(
                                    titleAboutApartmentroom,
                                    style:
                                         TextStyle(color: Colors.black.withOpacity(.7)),
                                  ),
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                  Row(
                                    children: [
                                      //Cubic meters
                                      const Expanded(
                                        child: Text(""),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          "${widget.oneApartment?.rooms ?? 0}",
                                          style:  TextStyle(
                                              color: Colors.black.withOpacity(.7)),
                                        ),
                                      ),
                                      Image(
                                        image:
                                            AssetImage(imageAboutApartmentRoom),
                                        width: 32,
                                        height: 32,
                                        color: Colors.black.withOpacity(.6),

                                      ),
                                      const Expanded(
                                        child: Text(""),
                                      ),
                                    ],
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: Text(""),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: OutlinedButton(
                              onPressed: null,
                              style: outlineBox,
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                   Text(
                                    "الحمامات",
                                    style: TextStyle(color: Colors.black.withOpacity(.7)),
                                  ),
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                  Row(
                                    children: [
                                      //Cubic meters
                                      const Expanded(
                                        child: Text(""),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          "${widget.oneApartment?.bathrooms ?? 0}",
                                          style:  TextStyle(
                                              color: Colors.black.withOpacity(.7)),
                                        ),
                                      ),
                                       const Image(
                                        image: AssetImage(
                                            "assets/images/apartments_images/about_apartment/bathroom.png"),
                                        width: 32,
                                        height: 32,

                                      ),
                                      const Expanded(child: Text("")),
                                    ],
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: Text(""),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 100,
                            height: 80,
                            child: OutlinedButton(
                              onPressed: null,
                              style: outlineBox,
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                   Text(
                                    "المساحة",
                                    style: TextStyle(color: Colors.black.withOpacity(.7)),
                                  ),
                                  const Expanded(
                                    child: Text(""),
                                  ),
                                  Row(
                                    children: [
                                      //Cubic meters
                                      const Expanded(
                                        child: Text(""),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          "${widget.oneApartment?.squareMeters ?? 0}"
                                          "m",
                                          style:  TextStyle(
                                              color: Colors.black.withOpacity(.7)),
                                        ),
                                      ),
                                       Image(
                                        image: const AssetImage(
                                            "assets/images/apartments_images/about_apartment/area.png",),
                                        width: 32,
                                        height: 32,
                                        color: Colors.black.withOpacity(.6),
                                      ),
                                      const Expanded(child: Text("")),
                                    ],
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: Text(""),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )

                        // AboutApartmentSquareMeter(
                        //     title: titleAboutApartmentSM,
                        //     image: imageAboutApartmentSM,
                        //     value: valueAboutApartmentSM),
                        //
                        // AboutApartment(
                        //     title: titleAboutApartmentroom,
                        //     image: imageAboutApartmentRoom,
                        //     value: valueAboutApartmentRoom),
                        // AboutApartment(
                        //     title: titleAboutApartmentBathroom,
                        //     image: imageAboutApartmentBathroom,
                        //     value: valueAboutApartmentBathroom),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //advantages

            GetAdvantages(oneApartment: widget.oneApartment),

            // Container(
            //   margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(7),
            //     color: kContainerColor,
            //   ),
            //   child: const Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            //             child: Text("المزايا",
            //                 style: TextStyle(
            //                   color: Colors.black.withOpacity(.7),
            //                   fontSize: 20,
            //                   fontFamily: 'IBM',
            //                 )),
            //           ),
            //           Expanded(child: Text("")),
            //         ],
            //       ),
            //       AdvantagesClassWidget(),
            //
            //     ],
            //   ),
            // ),
            //notes of owner
            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
// discription.length.toDouble() * 2,
//decoration of show apartment style
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
// this children have ( general info that : title, price , and location.
                children: [
//title
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Text("وصف الشقة",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      const Expanded(child: Text(""))
                    ],
                  ),
//description
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(widget.oneApartment?.description ?? "",
                        style:  TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontSize: 16,
                          fontFamily: 'IBM',
// fontWeight: FontWeight.bold
                        )),
                  ),
                ],
              ),
            ),
            //number phone
            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
              height: 120,
// discription.length.toDouble() * 2,
//decoration of show apartment style
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
// this widget For inquiries that have title and social media
                children: [
//title
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text("للإستفسار",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      const Expanded(child: Text(""))
                    ],
                  ),
//phone number
                  Row(
                    children: [
                      const Expanded(
                        child: Text(""),
                      ),
                      SizedBox(
                        width: 115,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () async {
                            sendMessageToWhatsApp(
                                '569339613', "هل يمكنني الاستفسار عن هذا؟");
                            // openBrowserURL(
                            //     url: 'https://wa.me/970569118259/',
                            //     inApp: false);

// _launchUrl;
// final value = ClipboardData(text: number_phone);
// Clipboard.setData(value);
//                                 number_phone2;

// Fluttertoast.showToast(
//     msg: "الرقم غير صحيح",
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM_RIGHT,
//     timeInSecForIosWeb: 10,
//     backgroundColor: Colors.blue,
//     textColor: Colors.white,
//     fontSize: 16.0
// );
                          },
                          style: outlineButton,
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
//whtsapp icon
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/whatsapp.png"),
                                    width: 28,
                                    height: 28,
                                  ),
                                ),

//text
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(" واتساب",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 16,
                                        fontFamily: 'IBM',
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 20,
                        child: Text(""),
                      ),
                    ],
                  ),
                  // ForInquiries(, onClick, user)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      // NewSession.get("logged", "") == ""
                      //     ?showSnakBar(context, "يرجى تسجيل الدخول لإتمام عملية الحجز")
                      //
                      // // toast("يرجى تسجيل الدخول لإتمام عملية الحجز")
                      //     : Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         BookingNow(oneApartment: widget.oneApartment)));
                    },
                    style: fullButton,
                    child: const Text("إحجز الآن")),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<List<Photos>> fetchPhotos() async {
    setState(() {
      _isDataLoaded = true;
    });
    Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((item) => Photos.fromJson(item)).toList();
    } else {
      setState(() {
        _isDataLoaded = false;
      });
      throw Exception('Failed to load photos from API');
    }
  }

//   CarouselSlider buildCarouselSlider(
//       {List<Photos>? photos, CarouselController? controller}) {
//     return CarouselSlider(
//                 items:
//         photos?.map((photo) {
//           return Builder(
//             builder: (BuildContext context) {
//               return
//
//               Container(
//                 margin: const EdgeInsets.all(5.0),
//                 child: ClipRRect(
//                     borderRadius:
//                     const BorderRadius.all(Radius.circular(7.0)),
//                     child: Stack(
//                       children: <Widget>[
//                         Image.network(
//                             photo.url!,
//                             fit: BoxFit.cover,
//                             width: 1000.0),
//                         Positioned(
//                           bottom: 0.0,
//                           left: 0.0,
//                           right: 0.0,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Color.fromARGB(0, 0, 0, 0),
//                                     Color.fromARGB(0, 0, 0, 0)
//                                   ],
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter,
//                                   tileMode: TileMode.mirror
//                                 // stops: List.empty()
//
//                               ),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 20.0),
//                           ),
//                         ),
//                       ],
//                     )),
//               );
//
//             },
//           );
//
//         }).toList(),
//                   // widget.getImages!.generateImageSliders,
//                   carouselController: controller,
//                   options: CarouselOptions(
//                       autoPlay: false,
//                       enlargeCenterPage: true,
//                       aspectRatio: 2.0,
//                       animateToClosest: true,
//                       pauseAutoPlayOnTouch: true,
//                       pauseAutoPlayOnManualNavigate: true,
//                       pauseAutoPlayInFiniteScroll: true,
//                       pageSnapping: true,
//                       enableInfiniteScroll: false,
//                       // reverse: true,
//                       disableCenter: true,
//                       // enlargeFactor: ,
//                       // initialPage: 1,
//                       viewportFraction: 0.93,
//                       height: 240,
//                       scrollDirection: Axis.horizontal,
//                       autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                       enlargeStrategy: CenterPageEnlargeStrategy.height,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           current = index;
//
//                         });
// ;
//                       }),
//                 );
//   }
//last -v

//   SizedBox multiImages(List<Photos> photos) {
//     return SizedBox(
//       height: 240,
//       width: 368,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: photos.length,
//         // widget.oneApartment?.photos?.length,
// physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: ((context, index) {
//           return SizedBox(
//             height: 240,
//             width: 390,
//             child: Column(children: [
//               SizedBox(
//                 child: CarouselSlider(
//                 // items:  widget.oneApartment?.photos[index].url ?? [],
//
//                   // widget.getImages!.generateImageSliders,
//                   carouselController: controller,
//                   options: CarouselOptions(
//                       autoPlay: false,
//                       enlargeCenterPage: true,
//                       aspectRatio: 2.0,
//                       animateToClosest: true,
//                       pauseAutoPlayOnTouch: true,
//                       pauseAutoPlayOnManualNavigate: true,
//                       pauseAutoPlayInFiniteScroll: true,
//                       pageSnapping: true,
//                       enableInfiniteScroll: false,
//                       // reverse: true,
//                       disableCenter: true,
//                       // enlargeFactor: ,
//                       // initialPage: 1,
//                       viewportFraction: 0.93,
//                       height: 240,
//                       scrollDirection: Axis.horizontal,
//                       autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                       enlargeStrategy: CenterPageEnlargeStrategy.height,
//                       onPageChanged: (index, reason) {
//                         // setState(() {
//                         //   current = index;
//                         // });
//                       }),
//                   items: [
//                     Container(
//                       margin: const EdgeInsets.all(5.0),
//                       child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(7.0)),
//                           child: Stack(
//                             children: <Widget>[
//                               Image.network(
//                                   // item.url
//                                   // widget.oneApartment!.photos![index].url,
//                                   widget.oneApartment?.photos![index].url!??"",
//                                   fit: BoxFit.cover,
//                                   width: 1000.0),
//                               Positioned(
//                                 bottom: 0.0,
//                                 left: 0.0,
//                                 right: 0.0,
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     gradient: LinearGradient(
//                                         colors: [
//                                           Color.fromARGB(0, 0, 0, 0),
//                                           Color.fromARGB(0, 0, 0, 0)
//                                         ],
//                                         begin: Alignment.bottomCenter,
//                                         end: Alignment.topCenter,
//                                         tileMode: TileMode.mirror
//                                         // stops: List.empty()
//
//                                         ),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 20.0),
//                                 ),
//                               ),
//                             ],
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // children: [widget.onePlayer?.photos[index].urlentries.map((entry) {
//                 //   return GestureDetector(
//                 //     onTap: () => controller.animateToPage(entry.key),
//                 //     child: Container(
//                 //       width: 12.0,
//                 //       height: 12.0,
//                 //       margin:
//                 //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                 //       decoration: BoxDecoration(
//                 //           borderRadius: BorderRadiusDirectional.circular(7 / 3.5),
//                 //           shape: BoxShape.rectangle,
//                 //           color: (Theme.of(context).brightness == Brightness.dark
//                 //               ? kPrimaryColor300
//                 //               : kPrimaryColor)
//                 //               .withOpacity(current == entry.key ? 0.9 : 0.4)),
//                 //     ),
//                 //   );
//                 // }).toList(),]
//               )
//
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: widget.onePlayer?.photos[index].url.asMap().entries.map((entry) {
//               //     return GestureDetector(
//               //       onTap: () => controller.animateToPage(entry.key),
//               //       child: Container(
//               //         width: 12.0,
//               //         height: 12.0,
//               //         margin:
//               //         const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadiusDirectional.circular(7 / 3.5),
//               //             shape: BoxShape.rectangle,
//               //             color: (Theme.of(context).brightness == Brightness.dark
//               //                 ? kPrimaryColor300
//               //                 : kPrimaryColor)
//               //                 .withOpacity(current == entry.key ? 0.9 : 0.4)),
//               //       ),
//               //     );
//               //   }).toList(),
//               // ),
//             ]),
//           );
//         }),
//       ),
//     );
//   }

// Future openBrowserURL({
//   required String url,
//   bool inApp = false,
// }) async {
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(
//       Uri.parse(url),

//       // forceSafariVC: inApp,
//       // forceWebView: inApp,
//       // enableJavaScript: true,
//     );
//   }
// }

// void sendMessageToWhatsApp(String phoneNumber, String message) async {
//   String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';
//
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
}
// class GetImages extends StatelessWidget {
//   const GetImages({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//
//
//   final List<Widget>? imageSliders =
//       ?.map((item) => Container(
//   margin: const EdgeInsets.all(5.0),
//   child: ClipRRect(
//   borderRadius: const BorderRadius.all(Radius.circular(7.0)),
//   child: Stack(
//   children: <Widget>[
//   Image.network(item.url?? "https://via.placeholder.com/150", fit: BoxFit.cover, width: 1000.0),
//   Positioned(
//   bottom: 0.0,
//   left: 0.0,
//   right: 0.0,
//   child: Container(
//   decoration: const BoxDecoration(
//   gradient: LinearGradient(
//   colors: [
//   Color.fromARGB(0, 0, 0, 0),
//   Color.fromARGB(0, 0, 0, 0)
//   ],
//   begin: Alignment.bottomCenter,
//   end: Alignment.topCenter,
//   tileMode: TileMode.mirror
//   // stops: List.empty()
//
//   ),
//   ),
//   padding: const EdgeInsets.symmetric(
//   vertical: 10.0, horizontal: 20.0),
//   ),
//   ),
//   ],
//   )),
//   ))
//       .toList();
// }

/////////////////////
