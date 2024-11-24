// import 'dart:ffi';
// import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import 'package:ween_blaqe/controller/pointer_of_images_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/apartments/show_more_classes_widget/new_show_more_containers/about_owner_container_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';

import '../../../../core/widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/custom_slider.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/pointer.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/image_slider/zoom_of_image/image_details_scree.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/new_show_more_containers/about_apartment_container_widget.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/new_show_more_containers/description_of_apartment_container_widget.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/new_show_more_containers/for_inquiries_container_widget.dart';
import '../../../../core/widgets/apartments/show_more_classes_widget/new_show_more_containers/general_of_apartment_info_container_widget.dart';

class NewShowMore extends StatefulWidget {
  const NewShowMore({
    super.key,
    this.oneApartment,
    this.onPageChanged,
  });

  final DataOfOneApartment? oneApartment;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  @override
  State<NewShowMore> createState() => _NewShowMoreState();
}

class _NewShowMoreState extends State<NewShowMore> {
  final bool _isDataLoaded = false;

  bool _isGirlStudent = false;
  bool _isBoyStudent = false;
  bool _isFamilies = false;

  bool isStart = false;

  @override
  void initState() {
    super.initState();

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
  }

  var imageAboutApartmentRoom =
      "assets/images/apartments_images/about_apartment/room.png";
  var titleAboutApartmentroom = "الغرف";

  PointerController pointerController = PointerController();

  // Assuming playersRes is the response you received
  CarouselSliderController controller = CarouselSliderController();
  PageController pageController = PageController();
  bool isRoomSizeChange = false;
  bool isRoomBathSizeChange = false;
  bool isAreaSizeChange = false;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: getIt<AppDimension>().isSmallScreen(context)
                    ? 50 / 1.6
                    : 50,
              ),
              //back arrow button
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: BackButton(
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${widget.oneApartment?.timeAgo} ",
                      style: TextStyle(
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          fontSize: 14),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: getIt<AppDimension>().isSmallScreen(context) ? 10 : 20,
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

              GeneralOfApartmentInfoContainerWidget(
                oneApartment: widget.oneApartment,
                isGirlStudent: _isGirlStudent,
                isBoyStudent: _isBoyStudent,
                isFamilies: _isFamilies,
              ),

              AboutApartmentContainerWidget(
                oneApartment: widget.oneApartment ?? DataOfOneApartment(),
                imageAboutApartmentRoom: imageAboutApartmentRoom,
              ),
              //advantages

              GetAdvantages(oneApartment: widget.oneApartment),
              DescriptionOfApartmentContainerWidget(
                  oneApartment: widget.oneApartment ?? DataOfOneApartment()),

              ForInquiriesContainerWidget(
                oneApartment: widget.oneApartment,
              ),
              AboutOwnerContainerWidget(
                  oneApartment: widget.oneApartment ?? DataOfOneApartment()),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 55 / 1.2
                      : 55,
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
                      style: fullButton().copyWith(
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.grey)),
                      child: Text(SetLocalization.of(context)!
                          .getTranslateValue("book_now"))),
                ),
              ),
            ],
          )),
    );
  }
}
