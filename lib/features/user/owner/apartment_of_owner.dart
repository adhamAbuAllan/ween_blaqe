// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
// import '../../../core/widgets/apartments/show_more_classes_widget/about_apartment_class_widget.dart';
// import '../../../core/widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
// import 'refactor_apartment.dart';
//
// import '../studnet/show_all_advantages.dart';
// import '../studnet/show_more.dart';
//
// class ApartmentOfOwner extends StatefulWidget {
//   const ApartmentOfOwner({Key? key}) : super(key: key);
//
//   @override
//   State<ApartmentOfOwner> createState() => _ApartmentOfOwnerState();
// }
//
// class _ApartmentOfOwnerState extends State<ApartmentOfOwner> {
//   @override
//   Widget build(BuildContext context) {
//     //general info box
//     // var title = "شقة للطالبات في مدينة الخليل";
//     // var city = "الخليل";
//     // var price = 900;
//     // var countOfStudent = 4;
//     // var location = "واد الهرية ";
//     //about apartment box
//     var titleAboutApartmentSM = "المساحة";
//     var imageAboutApartmentSM =
//         "assets/images/apartments_images/about_apartment/area.png";
//     var valueAboutApartmentSM = 40;
//     var titleAboutApartment = "الاًسرّة";
//     var imageAboutApartment =
//         "assets/images/apartments_images/about_apartment/bed1.png";
//     var valueAboutApartment = 4;
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                   child: IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.black87,
//                       )),
//                 ),
//                 const Expanded(child: Text("")),
//               ],
//             ),
//             //this widget for image only
//             //I stop Image Slider because didn't have indicator
//             // ImagesSlider(images: imageSliders),
//             //  ImageSliderWithPointer(items: [],itemsOfWidgets:imageSliders ),
//
//
//
//             // GenericInfoClassWidget(
//             //   apartments: DataOfOneApartment(),
//             //   // location: location,
//             //   // price: price,
//             //   // city: city,
//             //   // title: title,
//             //   // numberOfAllowedStudnet: countOfStudent,
//             // ),
//
//
//
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 children: [
//                   //about apartment  text
//                   const Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                         child: Text(
//                           "حول الشقة",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'IBM',
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Text("")),
//                     ],
//                   ),
//
//                   //about apartment items
//                   SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
//                         child: Row(
//                           children: [
//                             AboutApartmentSquareMeter(
//                                 title: titleAboutApartmentSM,
//                                 image: imageAboutApartmentSM,
//                                 value: valueAboutApartmentSM),
//                             AboutApartment(
//                                 title: titleAboutApartment,
//                                 image: imageAboutApartment,
//                                 value: valueAboutApartment)
//                           ],
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//             //advantages
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
//                 children: [
//                   const Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                         child: Text("المزايا",
//                             style: TextStyle(
//                               color: Colors.black87,
//                               fontSize: 20,
//                               fontFamily: 'IBM',
//                             )),
//                       ),
//                       Expanded(child: Text("")),
//                     ],
//                   ),
//                   // const AdvantagesClassWidget(),
//
// //button to show more advantages
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
//                     child: SizedBox(
//                       width: 350,
//                       height: 55,
//                       child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.of(context).push(
//                             //   MaterialPageRoute(builder: (context) {
//                             //     return const ShowAllAdvantages();
//                             //   }),
//                             // );
//                           },
//                           style: fullButton,
//                           child: const Text("عرض الميزات ال11")),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             //notes of owner
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
//               width: 373,
// // discription.length.toDouble() * 2,
// //decoration of show apartment style
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: const Column(
// // this children have ( general info that : title, price , and location.
//                 children: [
// //title
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(220, 10, 10, 0),
//                     child: Text("وصف الشقة",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 20,
//                           fontFamily: 'IBM',
//                         )),
//                   ),
// //description
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                     child: Text("description",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 16,
//                           fontFamily: 'IBM',
// // fontWeight: FontWeight.bold
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             //number phone
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
//               width: 373,
//               height: 120,
// // discription.length.toDouble() * 2,
// //decoration of show apartment style
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(7),
//                 color: kContainerColor,
//               ),
//               child: Column(
// // this widget For inquiries that have title and social media
//                 children: [
// //title
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(260, 10, 10, 10),
//                     child: Text("للإستفسار",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 20,
//                           fontFamily: 'IBM',
//                         )),
//                   ),
// //phone number
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: Text(""),
//                       ),
//                       SizedBox(
//                         width: 115,
//                         height: 50,
//                         child: OutlinedButton(
//                           onPressed: () {
// // _launchUrl;
// // final value = ClipboardData(text: number_phone);
// // Clipboard.setData(value);
//                             numberPhone2;
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
//                           },
//                           style: outlineButton,
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
// //whtsapp icon
//                                 Padding(
//                                   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                   child: Image(
//                                     image: AssetImage(
//                                         "assets/images/whatsapp.png"),
//                                     width: 28,
//                                     height: 28,
//                                   ),
//                                 ),
//
// //text
//                                 Padding(
//                                   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                   child: Text(" واتساب",
//                                       style: TextStyle(
//                                         color: Colors.black87,
//                                         fontSize: 16,
//                                         fontFamily: 'IBM',
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Expanded(
//                         flex: 20,
//                         child: Text(""),
//                       ),
//                     ],
//                   ),
// //               ForInquiries(, onClick, user)
//                 ],
//               ),
//             ),
//             //two buttons refactor and delete
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 20, 30, 25),
//                   child: SizedBox(
//                     width: 150,
//                     height: 65,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Get.to(const RefactorApartment());
//                         },
//                         style: fullButton,
//                         child: const Text("تعديل")),
//                   ),
//                 ),
//                 const Expanded(child: Text("")),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(30, 20, 0, 25),
//                   child: SizedBox(
//                     width: 150,
//                     height: 65,
//                     child: OutlinedButton(
//                         onPressed: () {},
//                         style: outlineButton,
//                         child: const Text("حذف")),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/widgets/empty_screen_class_widget.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';

// import '../../../api/apartments_api/one_apartment.dart';
import '../../../constants/nums.dart';
import 'package:get/get.dart';

import '../../../constants/strings.dart';
import '../../../controller/get_controllers.dart';

// import '../../../controller/models_controller/apartment_model_controller.dart';
import '../../../core/utils/funcations/route_pages/push_routes.dart';
import '..'
    '/../../core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import '../../error_widgets/no_internet.dart';
// ... other imports

class ApartmentsOwner extends StatefulWidget {
  const ApartmentsOwner({super.key});

  @override
  State<ApartmentsOwner> createState() => _ApartmentsOwnerState();
}

class _ApartmentsOwnerState extends State<ApartmentsOwner>
    with SingleTickerProviderStateMixin {
  // final ApartmentModelController apartmentController = Get.put(ApartmentModelController());
  bool isApartmentsListEmpty = false;
  late AnimationController _animationController;
  late Animation<Color?> _iconColorAnimation;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {});
    // });
    // setState(() {
      apartmentModelController.fetchApartments(isOwnerApartments: true);
    // });
    debugPrint("initState apartment_of_owner.dart");
    apiApartmentController.isEditMode.value = true;

    debugPrint(
        "apartment.isEditMode.value = ${apiApartmentController.isEditMode
            .value}");
    debugPrint(
        "apartment.delete.value = ${apiApartmentController.isDeleteMode
            .value}");

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _iconColorAnimation = ColorTween(
        begin: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
        end: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode)
        .animate(_animationController);
    // _animationController.addListener(() {
    //   // setState(() {});
    // });
    _animationController.forward();

    // apartmentModelController.apartments.value == OneApartment(data: [])
    //     ? setState(() {
    //         isApartmentsListEmpty = true;
    //       })
    //     : setState(() {
    //         isApartmentsListEmpty = false;
    //       });
  }

  @override
  void dispose() {
    apiApartmentController.isDeleteMode.value = false;
    apiApartmentController.isEditMode.value = false;
    _animationController.dispose();
    super.dispose();
  }

  void toggleDeleteMode() {
    setState(() {
      apiApartmentController.isDeleteMode.value =
          !apiApartmentController.isDeleteMode.value;
      if (apiApartmentController.isDeleteMode.value) {
        apiApartmentController.isEditMode.value = false;
        _animationController.forward();
      } else {
        apiApartmentController.isEditMode.value = true;
        _animationController.reverse();
      }
    });
  }
int photoIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          backgroundColor:
          themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
          title: const Text('شققك'),
          actions: apartmentModelController.isApartmentNull == false
              ? [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  apiApartmentController.isDeleteMode.value
                      ? Icons.delete
                      : Icons.edit,
                  key: ValueKey<bool>(apiApartmentController.isDeleteMode.value),
                  color: apartmentModelController.isApartmentNull
                      ? Colors.transparent
                      : _iconColorAnimation.value,
                ),
              ),
              onPressed: toggleDeleteMode,
            ),
          ),
          ]
              : [],
        ),
        body: Obx(() {
          if (apartmentModelController.isLoading.value) {
            return const Center(child: HomeSkeletonWidget());
          } else {
            return InternetConnectivityChecker(
              child: apartmentModelController.isApartmentNull
                  ? const EmptyScreenClassWidget(
                centerIcon: Icons.apartment,
                centerText: "تُعرض إعلاناتك هنا",
                centerIconInUnderCenterText: Icons.add_home_outlined,
                underCenterTextBeforeIcon: 'انقر على الزر ',
                underCenterTextAfterIcon: '  للبدء في إنشاء إعلان جديد',
              )
                  : ApartmentsList(
                haveCitiesBar: false,
                apartmentsRes: apartmentModelController.apartments.value,
                // scrollController: ScrollController(),
                isDeleteMode: apiApartmentController.isDeleteMode.value,
                onPressed: () {
                  setState(() {
                    apartmentModelController.fetchApartments(
                        isOwnerApartments: true);
                  });
                },
              ),
            );
          }
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
          themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
          onPressed: () {
            myPushName(context, MyPagesRoutes.step1);
          },
          child: const Icon(
            Icons.add_home_outlined,
            color: Colors.white,
          ),
        ));
  }
}
