// import 'dart:convert';
//
// import 'package:flutter/material.dart'; import 'package:flutter/material.dart';// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// // import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
// // import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
// // import 'package:ween_blaqe/i_well_delete_it/ask_for_stack_overflow/how_put_data_from_dropdown_to_database.dart';
// // import 'package:ween_blaqe/styles/button.dart';
// // import 'package:ween_blaqe/styles/show_more_widget/about_apartment_style.dart';
// // import 'package:ween_blaqe/widgets/toast_widget.dart';
// // import '../../../api/apartments.dart';
// // import '../../../urls_of_project/localhost_urls.dart';
// // import '../../../widgets/user/studnet/show_more.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// void main(){
//   runApp(MaterialApp(home: AdPost(image: 'assets/images/apartments_images/image1.png',),),);
// }
//
// class AdPost extends StatefulWidget {
//    AdPost({Key? key,
//     required this.image,
//     //  required this.title,
//     //  required this.price,
//     //  required this.city,
//      this.clicked
//   }) : super(key: key,);
//   String image;
//   // String title;
//   // int price;
//   // String city;
//   bool ? clicked;
//
//   @override
//   State<AdPost> createState() => _AdPostState();
// }
//
// class _AdPostState extends State<AdPost> {
//
//   @override
//   void initState() {
//     super.initState();
//     // getData();
//   }
//
//   Widget apartments(DataOfOneApartment apartment , Function onClick){
//     return
//        Container(
//           padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//           margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
//           // width: 373,
//           height: 395,
//           //decoration of show apartment style
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(7),
//             color: kPrimaryColorDarkMode,
//           ),
//
//
//           child:
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
//             children: [
//               // bookmark iconImage
//               Row(
//                 children: [
//                   Expanded(child: Text("")),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                     child: widget.clicked == false ?  IconButton(
//                         onPressed: () {
//                           setState(() {
//                             widget.clicked = true;
//                             // toast("تم حفظ الإعلان");
//
//                           });
//                         },
//                         icon:  const Icon(
//                           Icons.bookmark_outline,
//                           size: 28,
//                         )
//                     ): IconButton(
//                         onPressed: () {
//                           setState(() {
//                             widget.clicked = false;
//                             // toast("تم إلغاء حفظ الإعلان");
//
//
//                           });
//
//                         },
//                         icon:  const Icon(
//                           Icons.bookmark,
//                           size: 28,
//                         )
//                     ),
//                   ),
//                 ],
//               ),
//               // image/s of apartment
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(7/2),
//                   child: Image(
//                     image: AssetImage(widget.image)
//                     // child: Image(image: Image.network("src")),
//                     ,
//                     height: 240,
//                     // width:368,
//                   )),
//               // title and price
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(apartment.title??"",
//                         style: TextStyle(
//                           color: Colors.grey.shade800,
//                           fontFamily: 'IBM',
//                           fontSize: 15,
//
//                         )),
//                   ),
//                   const Expanded(child: Text("")),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
//                     child: Text(apartment.price.toString(),
//                         style: const TextStyle(color: kPrimaryColorDarkMode,
//                           fontSize: 16,
//                           fontFamily: 'IBM',)),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
//                     child: Text("ش/ش",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                           fontFamily: 'IBM',
//                         )),
//                   ),
//                 ],
//               ),
//
//               // see more and location
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(builder:
//                             (BuildContext context)=> NewShowMore(oneApartment:
//                             apartment,)));
//                         // myPushName(context, MyPagesRoutes.showMore);
//
//                       },
//                       style: outlineButton,
//                       child: const Text(
//                         " عرض المزيد ",
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontFamily: 'IBM',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(child: Text("")),
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     child: Text("الموقع:",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontFamily: 'IBM',
//                         )),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Text(apartment.title??"",
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontFamily: 'IBM',
//                         )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return
//     //   ListView.builder(itemBuilder: (ctx,pos){
//     //
//     // });
//
//
//         SingleChildScrollView(
//           child: Column(children:
//
//       arrayOfApartments.map((e) => apartments(e, ()async{
//           await getData();
//           // ShowMore(arrayOfApartments: e,);
//
//       })).toList(),
//       ));
//
//
//
//
//
//
//
//
//
//   }
//   List<DataOfOneApartment> arrayOfApartments = [];
//   getData()async{
//     setState(() {
//       arrayOfApartments.clear();
//     });
//     var url = Uri.parse(ServerWeenBalaqee.apartmentAll);
//     var response = await http.get(url);
//     var jsonData = jsonDecode(response.body);
//     var data = jsonData["data"] as List<dynamic>;
//     // var apartment = ArrayOfApartments.go(jsonData);
//     arrayOfApartments.clear();
//     for(var value in data){
//       arrayOfApartments.add(DataOfOneApartment(id: value['id'],title: value['title'],
//           city: value['city'],
//           location: value['location'],
//           // owner: value['owner'],
//           // squareMeters: value['square_meters'],
//
//           price: value['price'],
//
//           type: value['type']));
//       arrayOfApartments.first;
//       // ShowMore(arrayOfApartments: data[value],);
//
//
//     }
//
//
//     // setState(() {
//     //   var arrayRes = ApartmentsRes.fromJson(jsonData);
//     //   arrayRes.data.forEach((element) {
//     //    print (element.price);
//     //   });
//     // });
//     // print(jsonData);
//   }
// }
//
//
// // class AdPost extends StatelessWidget {
// //   const AdPost({
// //     Key? key,
// //     // required this.image,
// //     // required this.title,
// //     // required this.price,
// //     // required this.city,
// //   }) : super(
// //           key: key,
// //         );
// //   // String image;
// //   // String title;
// //   // int price;
// //   // String city;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Container(
// //           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
// //           margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
// //           width: 373,
// //           height: 395,
// //           //decoration of show apartment style
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(7),
// //             color: kContainerColor,
// //           ),
// //
// //           child: Column(
// //             // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
// //             children: [
// //               // bookmark iconImage
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
// //                 child: IconButton(
// //                   onPressed: () {},
// //                   icon: const Icon(
// //                     Icons.bookmark_outline,
// //                     size: 28,
// //                   ),
// //                 ),
// //               ),
// //               // image/s of apartment
// //               ClipRRect(
// //
// //                   borderRadius: BorderRadius.circular(7 / 2),
// //                   child: const Image(
// //                     image: AssetImage(
// //                         "assets/images/apartments_images/apartment.jpg")
// //                     // child: Image(image: Image.network("src")),
// //                     ,
// //                     height: 240,
// //                     // width:368,
// //                   )),
// //               // title and price
// //               Row(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Text("سكن طلاب في مدينة الخليل",
// //                         style: TextStyle(
// //                           color: Colors.grey.shade800,
// //                           fontFamily: 'IBM',
// //                           fontSize: 15,
// //                         )),
// //                   ),
// //                   const Expanded(child: Text("")),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
// //                     child: Text("950",
// //                         style: TextStyle(
// //                           color: kPrimaryColor,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
// //                     child: Text("ش/ش",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 12,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                 ],
// //               ),
// //
// //               // see more and location
// //               Row(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
// //                     child: OutlinedButton(
// //                       onPressed: () {
// //                         Get.to(const ShowMore());
// //                       },
// //                       style: outlineButton,
// //                       child: const Text(
// //                         " عرض المزيد ",
// //                         style: TextStyle(
// //                           fontSize: 13,
// //                           fontFamily: 'IBM',
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const Expanded(child: Text("")),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
// //                     child: Text("الموقع:",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
// //                     child: Text("الخليل",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //         Container(
// //           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
// //           margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
// //           width: 373,
// //           height: 395,
// //           //decoration of show apartment style
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(7),
// //             color: kContainerColor,
// //           ),
// //
// //           child: Column(
// //             // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
// //             children: [
// //               // bookmark iconImage
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
// //                 child: IconButton(
// //                   onPressed: () {},
// //                   icon: const Icon(
// //                     Icons.bookmark_outline,
// //                     size: 28,
// //                   ),
// //                 ),
// //               ),
// //               // image/s of apartment
// //               ClipRRect(
// //                   borderRadius: BorderRadius.circular(7 / 2),
// //                   child: const Image(
// //                     image: AssetImage(
// //                         "assets/images/apartments_images/apartment.jpg")
// //                     // child: Image(image: Image.network("src")),
// //                     ,
// //                     height: 240,
// //                     // width:368,
// //                   )),
// //               // title and price
// //               Row(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Text("سكن طلاب في مدينة الخليل",
// //                         style: TextStyle(
// //                           color: Colors.grey.shade800,
// //                           fontFamily: 'IBM',
// //                           fontSize: 15,
// //                         )),
// //                   ),
// //                   const Expanded(child: Text("")),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
// //                     child: Text("950",
// //                         style: TextStyle(
// //                           color: kPrimaryColor,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
// //                     child: Text("ش/ش",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 12,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                 ],
// //               ),
// //
// //               // see more and location
// //               Row(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
// //                     child: OutlinedButton(
// //                       onPressed: () {
// //                         Get.to(const ShowMore());
// //                       },
// //                       style: outlineButton,
// //                       child: const Text(
// //                         " عرض المزيد ",
// //                         style: TextStyle(
// //                           fontSize: 13,
// //                           fontFamily: 'IBM',
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const Expanded(child: Text("")),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
// //                     child: Text("الموقع:",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
// //                     child: Text("الخليل",
// //                         style: TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 16,
// //                           fontFamily: 'IBM',
// //                         )),
// //                   ),
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //         const SizedBox(
// //           height: 20,
// //         )
// //       ],
// //     );
// //   }
// // }
