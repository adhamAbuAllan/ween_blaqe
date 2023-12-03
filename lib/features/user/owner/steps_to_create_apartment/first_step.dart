// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
//
// import '../../../../constants/nums.dart';
// import '../../../../core/widgets/alirt_class_widget.dart';
// import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// import '../../../../core/widgets/registration/dropdown_button.dart';
// import '../../../../data_containers/add_ad_data_container.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
//
// TextEditingController addressController = TextEditingController();
// TextEditingController countOfRoomsController = TextEditingController();
// TextEditingController countOfBathRoomsController = TextEditingController();
//
// // City? currentCity ;
// // int? countOfRooms = AddAdDataContainer.rooms;
// // int? countOfBathRooms = AddAdDataContainer.bathRooms;
// // String? address = AddAdDataContainer.address;
// // String getInputText(){
// // return AddAdDataContainer.cityId;
// // addressController.text;
//
// // }/
//
// class FirstStep extends StatefulWidget {
//   const FirstStep({Key? key}) : super(key: key);
//
//   @override
//   State<FirstStep> createState() => _FirstStepState();
// }
//
// class _FirstStepState extends State<FirstStep> {
//   // late DropDownCity city;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // print(address);
//   }
//
// //Cities box
//   String firstCity = 'الخليل';
//   String cityBoxTitle = "المدينة";
//
// // var msg = "";
//   List<String> cities = [
//     'الخليل',
//     'نابلس',
//     'بيرزيت',
//     ' القدس',
//     'رام الله',
//     'طولكرم',
//     ' جنين',
//     'أريحا',
//     'بيت لحم',
//     'سلفيت',
//   ];
//
//   //choose address box
//   String chooseAddressTitle = "العنوان";
//   String hintAddress = "مثال:الخليل-وادالهرية-بجانب مسجد ابوعيشة";
//   TextInputType text = TextInputType.text;
//
// //choose rooms box
//   String chooseCountRoomText = "عدد الغرف ";
//   String hintCountRooms = "0";
//   TextInputType number = TextInputType.number;
//   var addressFocusnose = FocusNode();
//   var countRoomsfocusnode = FocusNode();
//   var countBathroomsfocusnode = FocusNode();
// //choose bathrooms box;
//
//   int cityId = 0;
//   String chooseCountBathroomsText = "عدد الحمامات";
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
//       color: kPrimaryColor,
//       child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           backgroundColor: Colors.grey.shade200,
//           body: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         OutlinedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: outlineButton,
//                           child: const Text("إلغاء"),
//                         ),
//                         const Expanded(child: Text("")),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               try {
//                                 AddAdDataContainer.address =
//                                     addressController.text;
//                                 AddAdDataContainer.rooms =
//                                     int.parse(countOfRoomsController.text);
//                                 AddAdDataContainer.bathRooms =
//                                     int.parse(countOfBathRoomsController.text);
//                                 AddAdDataContainer.city = firstCity;
//                                 /*
//                                 be careful !!!
//                                 * don't delete those commands it's will active after
//                                 solve dropdown save data  problem
//                                   --------------------------
//
//                                                               setState(() {
//                                   AddAdDataContainer.cityId?.id = city_id;
//                                 });
//
//                                  --------------------------
//
//                                 * */
//
//                                 if (AddAdDataContainer.address != null &&
//                                     AddAdDataContainer.bathRooms != null &&
//                                     AddAdDataContainer.rooms != null) {
//                                   debugPrint(
//                                       "type of apartment after add on class --${AddAdDataContainer.city}");
//
//                                   myPushName(context, MyPagesRoutes.step2);
//                                 }
//                               } catch (c) {
//                                 NormalAlert.show(
//                                     context,
//                                     "بيانات ناقصة",
//                                     "يوجد "
//                                         "بيانات"
//                                         " ناقصة "
//                                         "، تأكد "
//                                         "من إدخال "
//                                         "البيانات"
//                                         " في جميع "
//                                         "الحقول،"
//                                         "ثم حاول"
//                                         " مرة إخرى",
//                                     "حسنًا");
//                                 return;
//                               }
//                               // AddAdDataContainer.bathRooms =
//                               // AddAdDataContainer.currentCity?.name = currentCity;
//                               // Testing.printValue();
//                               //AddAdDataContainer.printValues();
//
//                               // AddAdDataContainer.cityId ;
//                               //   print("city_id --${AddAdDataContainer.cityId} -- in first_step page");
//                               //   print(City);
//
//                               // AddAdDataContainer.currentCityId?.id = currentCity?.id??0;
//                               // currentCity?.id = 0;
//                               // print(currentCity?.id);
//                               debugPrint("${AddAdDataContainer.rooms}");
//                             });
//                             // print("this is current value of city : ${currentCity?.id}");
//                             // AddAdDataContainer.address = addressController.text;
//                             // AddAdDataContainer.bathRooms = countc;
//                             // AddAdDataContainer.bathRooms = countOfBathRoomsController.text;
//
//                             // AddAdDataContainer.tesing(addressController.text);
//                             //     print("this is result of address value that in AddAdDataContainer class : "
//                             //         "${AddAdDataContainer.address}");
//                             //     currentCity
//
//                             // addressController.text = AddAdDataContainer.address??"";
//                             //    print(addressController.text);
//                             //  print(countOfBathRoomsController.text);
//                             // print(AddAdDataContainer.address);
//                             // address = addressController.text;
//                             // countOfRooms = int.tryParse(countOfRoomsController.text)?? 0;
//                             // countOfBathRooms = int.tryParse(countOfRoomsController.text)?? 0;
//
//                             // print(address);
//                             // print(countOfRoomsController);
//                             // print(countOfBathRoomsController);
//                           },
//                           style: fullButton,
//                           child: const Text("التالي"),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //text steps
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                     child: Text(
//                       "الخطوة الاولى",
//                       style: TextStyle(
//                         color: Colors.grey.shade800,
//                         fontSize: 20,
//                         fontFamily: 'IBM',
//                       ),
//                     ),
//                   ),
//                   //image steps
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
//                     child: Image.asset(
//                       'assets/'
//                       'images/'
//                       'apartments_images/'
//                       'images_to_create_apartment/'
//                       'step_one.png',
//                       width: 65,
//                       height: 65,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   //city box
//                   Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                       child: Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                         height: 140,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                           color: kContainerColor,
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                                   child: Text(
//                                     "المدينة",
//                                     style: TextStyle(
//                                       color: Colors.grey.shade800,
//                                       fontSize: 18,
//                                       fontFamily: 'IBM',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             DropdownButtonClassWidget(
//                               firstItem: firstCity,
//                               items: cities,
//                               fontSize: 15,
//                               onSelected: (c) {
//                                 firstCity = c;
//                               },
//                             ),
//                           ],
//                         ),
//                       )
//
//                       //this container stop until know how insert data from this container
//                       /*
//                     * ba careful !!!
//                     * don't delete this container
//                     * */
//                       // ContainerChooseCityItemClassWidget(
//                       //   title: city_box_title,
//                       //
//                       //   onSelected: (c){
//                       //     setState(() {
//                       //       setState(() {
//                       //         city_id = c.id;
//                       //
//                       //       });
//                       //
//                       //     });
//                       //   },
//                       // ),
//                       ),
//                   //location box
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                     child: ContainerInputTextClassWidget(
//                         title: chooseAddressTitle,
//                         hintInput: hintAddress,
//                         inputType: text,
//                         controller: addressController,
//                         focusNode: addressFocusnose,
//                         onFieldSubmitted: (value) {}),
//                   ),
//                   //rooms box
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                     child: ContainerInputTextClassWidget(
//                         title: chooseCountRoomText,
//                         hintInput: hintCountRooms,
//                         inputType: number,
//                         controller: countOfRoomsController,
//                         focusNode: countRoomsfocusnode,
//                         onFieldSubmitted: (value) {}),
//                   ),
//                   //bathrooms box
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     child: ContainerInputTextClassWidget(
//                         title: chooseCountBathroomsText,
//                         hintInput: hintCountBathrooms,
//                         inputType: number,
//                         controller: countOfBathRoomsController,
//                         focusNode: countBathroomsfocusnode,
//                         onFieldSubmitted: (value) {}),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String hintCountBathrooms = "0";
// }
