import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/api/apartments.dart';

import '../../../../classes_that_effect_widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
import '../../../../classes_that_effect_widgets/apartments/slider_images.dart';
import '../../../../funcations/route_pages/my_pages_routes.dart';
import '../../../../funcations/route_pages/push_routes.dart';
import '../../../../sesstion/new_session.dart';
import '../../../../skeletons/student_widgets/show_more_skeleton_widget.dart';
import '../../../../styles/button.dart';
import '../../../../styles/show_more_widget/about_apartment_style.dart';
import '../../../toast_widget.dart';

class NewShowMore extends StatefulWidget {

  //testing

  NewShowMore({Key? key,this.oneApartment,
  }) : super(key: key);
  final ArrayOfApartments ? oneApartment;

  @override
  State<NewShowMore> createState() => _NewShowMoreState();
}

class _NewShowMoreState extends State<NewShowMore> {

  @override
  void initState() {
    super.initState();
    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;

  }
  @override
  Widget build(BuildContext context) {
    // print(widget.oneApartment?.price??"");
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
    var titleAboutApartmentSM = "المساحة";
    var imageAboutApartmentSM =
        "assets/images/apartments_images/about_apartment/area.png";
    // var valueAboutApartmentSM = AddAdDataContainer.squareMeters??0;
    var titleAboutApartment = "الاًسرّة";
    var imageAboutApartment =
        "assets/images/apartments_images/about_apartment/bed1.png";
    var valueAboutApartment = 2;
    var imageAboutApartmentRoom =
        "assets/images/apartments_images/about_apartment/room.png";
    var titleAboutApartmentroom = "الغرف";

    // var valueAboutApartmentRoom = AddAdDataContainer.rooms??0;
    var imageAboutApartmentBathroom =
        "assets/images/apartments_images/about_apartment/bathroom.png";
    // var valueAboutApartmentBathroom = AddAdDataContainer.bathRooms??0;
    // var titleAboutApartmentBathroom = "الحمامات";
    // final CarouselController imageController = CarouselController();

    var ownIndex = 0;
// var arrayOfApartments = widget.arrayOfApartments;



    return ColorfulSafeArea(
      color: Colors.orange,
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
                ImageSliderWithPointer(),

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
          padding:const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white70,
          ),
          child: Column(
            // this children have ( general info that : title, price , and location
            // .
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      "معلومات عامة",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'IBM',
                      ),
                    ),
                  ),
                  Expanded(child: Text(""),),

                ],
              ),
              //title
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(widget.oneApartment?.title??""
                        // data.
                        ,
                        style: const TextStyle(
                          color: Colors.black87,
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
                      "المكان:${widget.oneApartment?.city??""

                      // data.
                      }-${widget.oneApartment?.location??""
                      // .data

                      }",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.grey.shade800,
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
                    child: Text("عدد الطلاب المسموح به:${widget.oneApartment?.countOfStudent??0}",
                        style: const TextStyle(
                          color: Colors.grey,
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
                    child: Text("نوع السكن:${widget.oneApartment?.type??""}",
                        style: const TextStyle(
                          color: Colors.grey,
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
                      "الأجرة:${widget.oneApartment?.price??""
                      // data.


                      }",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontFamily: 'IBM',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 3, 10),
                    child: Text("شيكل/شهري",
                        style: TextStyle(
                          color: Colors.orange,
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
                    color: Colors.white70,
                  ),
                  child: Column(

                    children: [
                      //about apartment  text
                      Row(
                        children: const [
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [

                          Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: OutlinedButton(
                                onPressed: null,
                                style: outlineBox,
                                child: Column(
                                  children: [
                                     Expanded(child: Text(""),),

                                    Text(
                                      titleAboutApartmentroom,
                                      style: const TextStyle(color: Colors.black87),
                                    ),
                                    const Expanded(
                                      child: Text(""),
                                    ),
                                    Row(
                                      children: [
                                        //Cubic meters
                                        const Expanded(child: Text(""),),

                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          child: Text(
                                            "${widget.oneApartment?.rooms??0}",
                                            style: const TextStyle(color: Colors.black87),
                                          ),
                                        ),
                                        Image(
                                          image: AssetImage(imageAboutApartmentRoom),
                                          width: 32,
                                          height: 32,
                                        ),
                                        const Expanded(child: Text(""),),
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
                    const Expanded(child: Text(""),),

                    const Text(
                      "الحمامات",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    Row(
                      children: [
                        //Cubic meters
                        const Expanded(child: Text(""),),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            "${widget.oneApartment?.bathrooms??0}",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                        const Image(
                          image: AssetImage("assets/images/apartments_images/about_apartment/bathroom.png"),
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
                    const Expanded(child: Text(""),),

                    const Text(
                      "المساحة",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    Row(
                      children: [
                        //Cubic meters
                        const Expanded(child: Text(""),),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            "${widget.oneApartment?.squareMeters??0}" "m",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                        const Image(
                          image: AssetImage("assets/images/apartments_images/about_apartment/area.png"),
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white70,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
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
                      const AdvantagesClassWidget(),

//button to show more advantages
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
//                         child: SizedBox(
//                           width: double.infinity,
//                           height: 55,
//                           // child: ElevatedButton(
//                           //     onPressed: () {
//                           //       Navigator.of(context).push(
//                           //         MaterialPageRoute(builder: (context) {
//                           //           return const ShowAllAdvantages();
//                           //         }),
//                           //       );
//                           //     },
//                           //     style: fullButton,
//                           //     child: const Text("عرض الميزات ال11")),
//                         ),
//                       ),
                    ],
                  ),
                ),

//notes of owner
                Container(
                  margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
// discription.length.toDouble() * 2,
//decoration of show apartment style
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white70,
                  ),
                  child: Column(
// this children have ( general info that : title, price , and location.
                    children:  [
//title
                      Row(
                        children: const [
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
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(widget.oneApartment?.description??"",
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
                  margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
                  height: 120,
// discription.length.toDouble() * 2,
//decoration of show apartment style
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white70,
                  ),
                  child: Column(
// this widget For inquiries that have title and social media
                    children: [
//title
                      Row(
                        children: const [
                          Padding(
                            padding:  EdgeInsets.fromLTRB(0, 10, 10, 10),
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
//whtsapp icon
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Image(
                                        image:
                                        AssetImage("assets/images/whatsapp.png"),
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
                            child: Text(""),
                            flex: 20,
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
                          NewSession.get("logged", "") == "" ? toast("يرجى تسجيل الدخول لإتمام عملية الحجز") :
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