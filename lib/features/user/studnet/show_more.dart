// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/utils/widgets_that_effect_another_widgets/image_sliders.dart';
import 'package:ween_blaqe/core/widgets/apartments/show_more_classes_widget/image_slider/pointer.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/features/user/studnet/show_all_advantages.dart';
import 'package:ween_blaqe/i_well_delete_it/images_unnussery/unnussery_images.dart';

import '../../../core/widgets/apartments/show_more_classes_widget/about_apartment_class_widget.dart';
import '../../../core/widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
import '../../../core/widgets/apartments/show_more_classes_widget/generic_info_class_widget.dart';
import '../../../core/widgets/apartments/show_more_classes_widget/image_slider/slider_images.dart';

import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import 'package:ween_blaqe/constants/nums.dart';
String phone = "569339613";
String numberPhone = "https://wa.me/+972$phone}";
String numberPhone2 = "https://api.whatsapp.com/send?phone=+972$phone";
// final Uri _url = Uri.parse('https://pub.dev');
late DataOfOneApartment _apartment;

/*
 String url() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "=${Uri.parse(message)}"; // new line
    }
  }
  ////////////////////////////////////////////////////////////////
 */
class ShowMore extends StatefulWidget {
  final DataOfOneApartment? oneApartment;

  const ShowMore({
    Key? key,
    this.oneApartment,
  }) : super(key: key);
  @override
  State<ShowMore> createState() => _ShowMoreState();
}

class _ShowMoreState extends State<ShowMore>  {
  @override
  void initState() {
    super.initState();
    // getData();
  }

  var title = AddAdDataContainer.title;
  var city = AddAdDataContainer.city;
  var price = AddAdDataContainer.price;
  var countOfStudent = AddAdDataContainer.countOfStudent;
  var location = AddAdDataContainer.address;
  //about apartment box
  var titleAboutApartmentSM = "المساحة";
  var imageAboutApartmentSM =
      "assets/images/apartments_images/about_apartment/area.png";
  var valueAboutApartmentSM = AddAdDataContainer.squareMeters ?? 0;
  var titleAboutApartment = "الاًسرّة";
  var imageAboutApartment =
      "assets/images/apartments_images/about_apartment/bed1.png";
  var valueAboutApartment = 2;
  var imageAboutApartmentRoom =
      "assets/images/apartments_images/about_apartment/room.png";
  var titleAboutApartmentroom = "الغرف";
  var valueAboutApartmentRoom = AddAdDataContainer.rooms ?? 0;
  var imageAboutApartmentBathroom =
      "assets/images/apartments_images/about_apartment/bathroom.png";
  var valueAboutApartmentBathroom = AddAdDataContainer.bathRooms ?? 0;
  var titleAboutApartmentBathroom = "الحمامات";
  final CarouselController imageController = CarouselController();

  var ownIndex = 0;
// var arrayOfApartments = widget.arrayOfApartments;

  @override
  Widget build(BuildContext context) {
    //general info box

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
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                      )),
                ),
                const Expanded(child: Text("")),
              ],
            ),

            //this widget for image only
            //I use this widget because the ImageSlider didn't have a indicator
            //  ImageSliderWithPointer(itemsOfWidgets: imageSliders, items: [],),

            // child: ImagesSlider(images: imageSliders,
            //   myController: imageController,index: ownIndex
            //     ),

            // TestImageSlider(current: ownIndex,myContext: context),

            // GenericInfoClassWidget(
            //   apartments: widget.oneApartment,
            //   // location: location??"",
            //   // price: price??0,
            //   // city: city??"",
            //   // title: title??"",
            //   // numberOfAllowedStudnet: countOfStudent??0,
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
                children: [
                  //about apartment  text
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          "حول الشقة",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IBM',
                          ),
                        ),
                      ),
                      Expanded(child: Text("")),
                    ],
                  ),

                  //about apartment items
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Row(
                          children: [
                            AboutApartmentSquareMeter(
                                title: titleAboutApartmentSM,
                                image: imageAboutApartmentSM,
                                value: valueAboutApartmentSM),
                            AboutApartment(
                                title: titleAboutApartmentroom,
                                image: imageAboutApartmentRoom,
                                value: valueAboutApartmentRoom),
                            AboutApartment(
                                title: titleAboutApartmentBathroom,
                                image: imageAboutApartmentBathroom,
                                value: valueAboutApartmentBathroom),
                          ],
                        ),
                      )),
                ],
              ),
            ),
//advantages
            Container(
              margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: kContainerColor,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text("المزايا",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      Expanded(child: Text("")),
                    ],
                  ),
                  // const AdvantagesClassWidget(),

//button to show more advantages
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (context) {
                            //     return const ShowAllAdvantages();
                            //   }),
                            // );
                          },
                          style: fullButton,
                          child: const Text("عرض الميزات ال11")),
                    ),
                  ),
                ],
              ),
            ),

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
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Text("وصف الشقة",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      Expanded(child: Text(""))
                    ],
                  ),
//description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(AddAdDataContainer.description ?? "",
                        style: const TextStyle(
                          color: Colors.black87,
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
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text("للإستفسار",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      Expanded(child: Text(""))
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
                          onPressed: () {
// _launchUrl;
// final value = ClipboardData(text: number_phone);
// Clipboard.setData(value);
                            numberPhone2;

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
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
//whtsapp icon
                                Padding(
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
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(" واتساب",
                                      style: TextStyle(
                                        color: Colors.black87,
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
//               ForInquiries(, onClick, user)
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
                      // NewSession.get("logged", "") == "" ? toast("يرجى تسجيل الدخول لإتمام عملية لحجز") :
                      myPushName(context, MyPagesRoutes.bookingNow);
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
}

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);
