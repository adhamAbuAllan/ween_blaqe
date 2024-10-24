// import 'dart:ffi';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:skeletons/skeletons.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
// import 'package:colorful_safe_area/colorful_safe_area.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

// import 'package:ween_blaqe/api/photos.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/pointer_of_images_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';
import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/custom_slider.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/pointer.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/zoom_of_image/image_details_scree.dart';
// import '../../../../i_well_delete_it/slove_get_advantage_data/advantages_class_widget.dart';

// import '../../../toast_widget.dart';
// main() {
//   runApp(    const MaterialApp(home: NewShowMore()));
// }

class NewShowMore extends StatefulWidget {
  const NewShowMore({
    super.key,
    this.oneApartment,
    this.onPageChanged,
  });

  final DataOfOneApartment? oneApartment;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  // late List<Photos>? photosOfApartment;
  @override
  State<NewShowMore> createState() => _NewShowMoreState();
}

class _NewShowMoreState extends State<NewShowMore> {
  bool _isDataLoaded = false;

  bool _isGirlStudent = false;
  bool _isBoyStudent = false;
  bool _isFamilies = false;

  // Object tag = 'photo';
  bool isStart = false;

  @override
  void initState() {
    super.initState();

    // debugPrint(
    //     "initPage Index = ${widget.currentIndex}");
    isStart = true;
    if (widget.oneApartment?.type?.name == "طلاب") {
      _isBoyStudent = true;
    }
    if (widget.oneApartment?.type?.name == "طالبات") {
      _isGirlStudent = true;
    }
    if (widget.oneApartment?.type?.name == "عائلات") {
      _isFamilies = true;
    }

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
//   int current = 0;

  PointerController pointerController = PointerController();

  // Assuming playersRes is the response you received
  CarouselSliderController controller = CarouselSliderController();
  PageController pageController = PageController();
  bool isRoomSizeChange = false;
  bool isRoomBathSizeChange = false;
  bool isAreaSizeChange = false;

  @override
  Widget build(BuildContext context) {
    // bool isMove = false;
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //back arrow button
              //back arrow button
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
                      child: BackButton(
                        style: const ButtonStyle(
                          // iconSize : WidgetStateProperty.all(34),
                          //    maximumSize: WidgetStateProperty.all(Size(32,
                          //        32)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                    ),
                    Text(
                      "${widget.oneApartment?.timeAgo} ",
                      style: TextStyle(
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          fontFamily: "IBM",
                          fontSize: 14),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ), // image/s of apartment
              _isDataLoaded
                  ? SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: 368,
                          height: 240,
                          borderRadius: BorderRadius.circular(7)),
                    )
                  : const SizedBox(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailImageScreen(
                          context: context,
                          imageList: widget.oneApartment!.photos!,
                          initialIndex:
                              widget.oneApartment?.currentPhotoIndex.value ?? 0,
                          oneApartment: widget.oneApartment!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      CarouselSliderWidget(
                        imageList: widget.oneApartment!.photos!,
                        apartmentId: widget.oneApartment!.id ?? 1,
                        oneApartment: widget.oneApartment!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PointerOfImage(
                        oneApartment: widget.oneApartment!,
                        imageList: widget.oneApartment!.photos!,
                      ),
                    ],
                  )),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
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
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode
                                //kTextColor
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
                        SizedBox(
                          width: getIt<AppDimension>().isSmallScreen(context)
                              ? 360 / 1.5
                              : 360,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                                widget.oneApartment?.title ?? ""
                                // data.
                                ,
                                softWrap: true,
                                style: TextStyle(
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode,
                                  fontSize: 18,
                                  fontFamily: 'IBM',
                                )),
                          ),
                        ),
                      ],
                    ),
                    // location
                    Row(
                      children: [
                        SizedBox(
                          width: getIt<AppDimension>().isSmallScreen(context)
                              ? 360 / 1.1
                              : 360,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: Text(
                              "المكان:${widget.oneApartment?.city?.name ?? ""

                              // data.
                              }-${widget.oneApartment?.location ?? ""
                              // .data

                              }",
                              softWrap: true,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                                fontFamily: 'IBM',
                              ),
                            ),
                          ),
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),
                    // count of student
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                          child: Text(
                              (_isBoyStudent
                                  ? "عدد الطلاب المسموح به:${widget.oneApartment?.countOfStudnet ?? 0}"
                                  : (_isGirlStudent
                                      ? "عدد الطالبات المسموح به:${widget.oneApartment?.countOfStudnet ?? 0}"
                                      : (_isFamilies
                                          ? "عدد الافراد المسموح به:${widget.oneApartment?.countOfStudnet ?? 0}"
                                          : "عدد الافراد المسموح به:${widget.oneApartment?.countOfStudnet ?? 0}"))),
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
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
                          child: Text(
                              "نوع السكن:${widget.oneApartment?.type?.name ?? ""}",
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
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
                            style: TextStyle(
                              color: themeMode.isLight
                                  ? kPrimaryColorLightMode
                                  : kPrimaryColorDarkMode,
                              fontFamily: 'IBM',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 3, 10),
                          child: Text("شيكل/شهري",
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kPrimaryColorLightMode
                                    : kPrimaryColorDarkMode,
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
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
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
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode),
                          ),
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),

                    //about apartment items
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FittedBox(
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.linear,
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  clipBehavior: Clip.antiAlias,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isRoomSizeChange = !isRoomSizeChange;
                                      });
                                    },
                                    style: outlinedButton(themeMode: themeMode)
                                        .copyWith(
                                            padding:
                                                const WidgetStatePropertyAll(
                                                    EdgeInsets.all(10)),
                                            overlayColor:
                                                const WidgetStatePropertyAll(
                                                    Colors.transparent),
                                            side: WidgetStatePropertyAll(BorderSide(
                                                width: !isRoomSizeChange ? 1 : 2,
                                                color: isRoomSizeChange
                                                    ? themeMode.isLight
                                                        ? kPrimaryColorLightMode
                                                        : kPrimaryColorDarkMode
                                                    : themeMode.isLight
                                                        ? kPrimaryColor300LightMode
                                                        : kPrimaryColor300DarkMode))),
                                    child: Column(
                                      children: [
                                        Text(
                                          titleAboutApartmentroom,
                                          style: TextStyle(
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode),
                                        ),
                                        Row(
                                          children: [
                                            //Cubic meters

                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: isRoomSizeChange
                                                  ? FittedBox(
                                                      child: buildAnimatedTextKit(
                                                          "${widget.oneApartment?.rooms ?? 0}"),
                                                    )
                                                  : Text(
                                                      "${widget.oneApartment?.rooms ?? 0}",
                                                      style: TextStyle(
                                                          color: themeMode
                                                                  .isLight
                                                              ? kTextColorLightMode
                                                              : kTextColorDarkMode),
                                                    ),
                                            ),
                                            Image(
                                              image: AssetImage(
                                                  imageAboutApartmentRoom),
                                              width: 32,
                                              height: 32,
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FittedBox(
                                // clipBehavior: Clip.antiAlias,
                                // alignment: Alignment.topCenter,
                                // fit: BoxFit.none,
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.linear,
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  clipBehavior: Clip.antiAlias,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isRoomBathSizeChange =
                                            !isRoomBathSizeChange;
                                      });
                                    },
                                    style: outlinedButton(themeMode: themeMode)
                                        .copyWith(
                                            padding:
                                                const WidgetStatePropertyAll(
                                                    EdgeInsets.all(10)),
                                            overlayColor:
                                                const WidgetStatePropertyAll(
                                                    Colors.transparent),
                                            side: WidgetStatePropertyAll(BorderSide(
                                                width: !isRoomBathSizeChange ? 1 : 2,
                                                color: isRoomBathSizeChange
                                                    ? themeMode.isLight
                                                        ? kPrimaryColorLightMode
                                                        : kPrimaryColorDarkMode
                                                    : themeMode.isLight
                                                        ? kPrimaryColor300LightMode
                                                        : kPrimaryColor300DarkMode))),
                                    child: Column(
                                      children: [
                                        // const Expanded(
                                        //   child: Text(""),
                                        // ),
                                        Text(
                                          "الحمامات",
                                          style: TextStyle(
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode),
                                        ),
                                        // const Expanded(
                                        //   child: Text(""),
                                        // ),
                                        Row(
                                          // mainAxisSize: MainAxisSize.max,
                                          children: [
                                            //Cubic meters
                                            // const Expanded(
                                            //   child: Text(""),
                                            // ),

                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: isRoomBathSizeChange
                                                  ? FittedBox(
                                                      child: buildAnimatedTextKit(
                                                          "${widget.oneApartment?.bathrooms ?? 0}"),
                                                    )
                                                  : Text(
                                                      "${widget.oneApartment?.bathrooms ?? 0}",
                                                      style: TextStyle(
                                                          color: themeMode
                                                                  .isLight
                                                              ? kTextColorLightMode
                                                              : kTextColorDarkMode),
                                                    ),
                                            ),
                                            Image(
                                              image: const AssetImage(
                                                  "assets/images/apartments_images/about_apartment/bathroom.png"),
                                              width: 32,
                                              height: 32,
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FittedBox(
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.linear,
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  clipBehavior: Clip.antiAlias,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isAreaSizeChange = !isAreaSizeChange;
                                      });
                                    },
                                    style: outlinedButton(themeMode: themeMode)
                                        .copyWith(
                                            padding:
                                                const WidgetStatePropertyAll(
                                                    //10
                                                    EdgeInsets.all(10)), // ),
                                            overlayColor:
                                                const WidgetStatePropertyAll(
                                                    Colors.transparent),
                                            side: WidgetStatePropertyAll(BorderSide(
                                                width: !isAreaSizeChange ? 1 : 2,
                                                color: isAreaSizeChange
                                                    ? themeMode.isLight
                                                        ? kPrimaryColorLightMode
                                                        : kPrimaryColorDarkMode
                                                    : themeMode.isLight
                                                        ? kPrimaryColor300LightMode
                                                        : kPrimaryColor300DarkMode))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "المساحة",
                                          style: TextStyle(
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode),
                                        ),
                                        Row(
                                          children: [
                                            //Cubic meters

                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: isAreaSizeChange
                                                  ? FittedBox(
                                                      child: buildAnimatedTextKit(
                                                          "²م${widget.oneApartment?.squareMeters ?? 0}"),
                                                    )
                                                  : Text(
                                                      "²م${widget.oneApartment?.squareMeters ?? 0}",
                                                      style: TextStyle(
                                                          color: themeMode
                                                                  .isLight
                                                              ? kTextColorLightMode
                                                              : kTextColorDarkMode),
                                                    ),
                                            ),
                                            Image(
                                              image: const AssetImage(
                                                "assets/images/apartments_images/about_apartment/area.png",
                                              ),
                                              width: 32,
                                              height: 32,
                                              color: themeMode.isLight
                                                  ? kTextColorLightMode
                                                  : kTextColorDarkMode,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                    ),
                  ],
                ),
              ),
              //advantages

              GetAdvantages(oneApartment: widget.oneApartment),

              // Container(
              //   margin:     EdgeInsets.fromLTRB(10, 23, 10, 0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(7),
              //     color: kContainerColor,
              //   ),
              //   child:     Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              //             child: Text("المزايا",
              //                 style: TextStyle(
              //                   color:kTextColor,
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
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
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
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                                fontSize: 20,
                                fontFamily: 'IBM',
                              )),
                        ),
                        const Expanded(child: Text(""))
                      ],
                    ),
                    //description
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(widget.oneApartment?.description ?? "",
                          style: TextStyle(
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
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
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
                // height: 120,
                // discription.length.toDouble() * 2,
                //decoration of show apartment style
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
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
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
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
                          // height: 50,
                          child: OutlinedButton(
                            onPressed: () async {
                              // sendMessageToMessenger("https://www.facebook.com/adhm.alaan"," السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title}");
                              sendMessageToWhatsApp(
                                  widget.oneApartment!.owner!.phone,
                                  "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title} ",
                                  image: widget.oneApartment?.photos?[0].url);
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
                            style: outlinedButton(themeMode: themeMode),
                            child: Padding(
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(" واتس اب",
                                        style: TextStyle(
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
                                          fontSize: 16,
                                          fontFamily: 'IBM',
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //     SizedBox(width: 20,),
                        //                           widget.oneApartment!.owner!.email.isEmpty?     SizedBox(): SizedBox(
                        //                               height: 50,
                        //                               child: OutlinedButton(
                        //                                 onPressed: () async {
                        //                                   sendEmailToGmail(
                        //
                        //
                        //                                       widget.oneApartment!.owner!.email,"إستفسار عن إعلان ${widget.oneApartment!.title },","  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title} ",);
                        //
                        //                                   // openBrowserURL(
                        //                                   //     url: 'https://wa.me/970569118259/',
                        //                                   //     inApp: false);
                        //
                        // // _launchUrl;
                        // // final value = ClipboardData(text: number_phone);
                        // // Clipboard.setData(value);
                        // //                                 number_phone2;
                        //
                        // // Fluttertoast.showToast(
                        // //     msg: "الرقم غير صحيح",
                        // //     toastLength: Toast.LENGTH_SHORT,
                        // //     gravity: ToastGravity.BOTTOM_RIGHT,
                        // //     timeInSecForIosWeb: 10,
                        // //     backgroundColor: Colors.blue,
                        // //     textColor: Colors.white,
                        // //     fontSize: 16.0
                        // // );
                        //                                     },
                        //                                     style: outlineButton,
                        //                                     child: Padding(
                        //                                       padding: const EdgeInsets.all(8.0),
                        //                                       child: Row(
                        //                                         children: [
                        // //whtsapp icon
                        //                                           Padding(
                        //                                         padding:
                        //                                             EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //                                         child: Image(
                        //                                           image: AssetImage(
                        //                                               "assets/images/gmail.png"),
                        //                                           width: 28,
                        //                                           height: 28,
                        //                                         ),
                        //                                       ),
                        //
                        // //text
                        //                                       Padding(
                        //                                         padding:     EdgeInsets.fromLTRB(
                        //                                             0, 0, 0, 0),
                        //                                         child: Text(" جيميل",
                        //                                             style: TextStyle(
                        //                                               color:
                        //                                                  kTextColor,
                        //                                               fontSize: 16,
                        //                                               fontFamily: 'IBM',
                        //                                             )),
                        //                                       ),
                        //                                     ],
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                             ),
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
              Container(
                margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
                // discription.length.toDouble() * 2,
                //decoration of show apartment style
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                ),
                //about the owner
                child: Column(
                  // this children have ( general info that : title, price , and location.
                  children: [
                    //title
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          child: Text("عن المؤجر",
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                                fontSize: 20,
                                fontFamily: 'IBM',
                              )),
                        ),
                        const Expanded(child: Text(""))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: widget.oneApartment?.owner?.profile ==
                              "images/profile/user.png"
                              ? CircleAvatar(
                              radius: 28,
                              //put a normal person Icon
                              backgroundColor: Colors.grey.shade700,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 28,
                              ))
                              : CircleAvatar(
                            radius: 28,
                            // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                            // Adjust the radius as needed
                            backgroundColor: Colors.grey.shade700,
                            // Set the background color of the avatar
                            backgroundImage: NetworkImage(
                                "https://weenbalaqee"
                                    ".com/${widget.oneApartment?.owner
                                    ?.profile??"images/profile/user.png"}"),
                            child:
                            apartmentModelController.isLoading.value
                                ? const CircularProgressIndicator()
                                : null,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.oneApartment?.owner?.name??"",
                              style: TextStyle(
                                fontSize: getIt<AppDimension>().isSmallScreen(context)
                                    ? 16
                                    : 18,
                                fontFamily: 'IBM',
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Text(
                              // "عرض الملف الشخصي",
                              widget.oneApartment?.owner?.phone??"",
                              // "972569339613",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'IBM',
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode),
                            )
                          ],
                        ),
                        const Expanded(
                            child: SizedBox(
                              child: Text(""),
                            )),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10,),
                        //   child: Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: themeMode.isLight
                        //         ? kTextColorLightMode
                        //         : kTextColorDarkMode,
                        //     // size: ,
                        //   ),
                        // ),
                      ],
                    )
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
                        //     :
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         BookingNow(oneApartment: widget.oneApartment)));
                        showSnakBar(context,
                            "هذه الميزة قيد التطوير وسيتم إضافتها قريبًا");
                      },
                      style: fullButton(themeMode: themeMode).copyWith(
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.grey)),
                      child: const Text("إحجز الآن")),
                ),
              ),
            ],
          )),
    );
  }

  // Future<List<Photos>> fetchPhotos() async {
  //   setState(() {
  //     _isDataLoaded = true;
  //   });
  //   Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     List jsonResponse = jsonDecode(response.body);
  //
  //     return jsonResponse.map((item) => Photos.fromJson(item)).toList();
  //   } else {
  //     setState(() {
  //       _isDataLoaded = false;
  //     });
  //     throw Exception('Failed to load photos from API');
  //   }
  // }

  //aniatoin
  AnimatedTextKit buildAnimatedTextKit(String text) {
    return AnimatedTextKit(
      totalRepeatCount: 3,
      pause: Duration.zero,
      onFinished: () {
        setState(() {
          isRoomSizeChange = false;
          isRoomBathSizeChange = false;
          isAreaSizeChange = false;
        });
      },
      //aniatedTextOfCounter
      animatedTexts: [
        FadeAnimatedText(
          text,
          textStyle: TextStyle(
              fontFamily: "IBM",
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode),
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }

//////////////////////
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
//                 margin:     EdgeInsets.all(5.0),
//                 child: ClipRRect(
//                     borderRadius:
//                         BorderRadius.all(Radius.circular(7.0)),
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
//                             decoration:     BoxDecoration(
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
//                             padding:     EdgeInsets.symmetric(
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
// physics:     NeverScrollableScrollPhysics(),
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
//                       margin:     EdgeInsets.all(5.0),
//                       child: ClipRRect(
//                           borderRadius:
//                                   BorderRadius.all(Radius.circular(7.0)),
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
//                                   decoration:     BoxDecoration(
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
//                                   padding:     EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 20.0),
//                                 ),
//                               ),
//                             ],
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//                   Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // children: [widget.onePlayer?.photos[index].urlentries.map((entry) {
//                 //   return GestureDetector(
//                 //     onTap: () => controller.animateToPage(entry.key),
//                 //     child: Container(
//                 //       width: 12.0,
//                 //       height: 12.0,
//                 //       margin:
//                 //           EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
//               //             EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
//       GetImages({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return     Placeholder();
//   }
//
//
//   final List<Widget>? imageSliders =
//       ?.map((item) => Container(
//   margin:     EdgeInsets.all(5.0),
//   child: ClipRRect(
//   borderRadius:     BorderRadius.all(Radius.circular(7.0)),
//   child: Stack(
//   children: <Widget>[
//   Image.network(item.url?? "https://via.placeholder.com/150", fit: BoxFit.cover, width: 1000.0),
//   Positioned(
//   bottom: 0.0,
//   left: 0.0,
//   right: 0.0,
//   child: Container(
//   decoration:     BoxDecoration(
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
//   padding:     EdgeInsets.symmetric(
//   vertical: 10.0, horizontal: 20.0),
//   ),
//   ),
//   ],
//   )),
//   ))
//       .toList();
// }

/////////////////////
