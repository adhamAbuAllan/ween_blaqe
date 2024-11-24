// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:http/http.dart' as http;
// import '../../../../api/apartments_api/apartments.dart';
//
//
// // void main(){runApp(MaterialApp(home:
// // GenericInfoClassWidget(apartments:
// // arrayOfApartments,),));}
// class GenericInfoClassWidget extends StatefulWidget {
//   const GenericInfoClassWidget({Key? key,
//     this.apartments
//     // required this.title,
//     //   required this.location,
//     //   required this.city,
//     //   required this.price,
//     //   required this.numberOfAllowedStudnet
//   }) : super(key: key);
//   // String title;
//   final DataOfOneApartment ? apartments;
//   // String location;
//   // String city;
//   // int price;
//   // int  numberOfAllowedStudnet;
//
//   @override
//   State<GenericInfoClassWidget> createState() => _GenericInfoClassWidgetState();
// }
//
//
// List<DataOfOneApartment> genericInfoData = [];
// late DataOfOneApartment oneApartment ;
//
// class _GenericInfoClassWidgetState extends
//
// State<GenericInfoClassWidget> {
//   @override
//   void initState() {
//     super.initState();
//     // getData();
//     // fetchApartment();
//
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return ListView.builder(itemBuilder: (c,i){
//   //     return
//   //   });
//   //
//   // }
//   @override
//   Widget build(BuildContext context){
//     return
//       // Column(children: genericInfoData.map((e) => genericInfoOfApartment(e)).toList(),);
//       // backgroundColor: Colors.,
//       // genericInfoData == []?
//
//
//       // ListView.builder(
//       //   scrollDirection: Axis.horizontal,
//       //     shrinkWrap: true,
//       // itemCount: genericInfoData.length,
//       // itemBuilder: (ctx,pos){
//       //   final generic = genericInfoData[pos];
//
//
//       Container(
//         margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
//         padding:const EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           color: Colors.white70,
//         ),
//         child: Column(
//           // this children have ( general info that : title, price , and location
//           // .
//           children: [
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   child: Text(
//                     "معلومات عامة",
//                     style: TextStyle(
//                       fontSize: 20,
//                       
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Text(""),),
//
//               ],
//             ),
//             //title
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//                   child: Hero(
//                     tag:oneApartment.id!,
//                     child: Text(widget.apartments?.title??""
//                         // data.
//                         ,
//                         style: const TextStyle(
//                           color: Colors.black87,
//                           fontSize: 16,
//                           
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//             // location
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
//                   child: Text(
//                     "المكان:${widget.apartments?.city??""
//
//                     // data.
//                     }-${widget.apartments?.location??""
//                     // .data
//
//                     }",
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //price
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
//                   child: Text(
//                     "الأجرة:${widget.apartments?.price??""
//                     // data.
//
//
//                     }",
//                     style: const TextStyle(
//                       color: Colors.orange,
//                       
//                     ),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.fromLTRB(0, 0, 3, 10),
//                   child: Text("شيكل/شهري",
//                       style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 16,
//                         
//                       )),
//                 ),
//                 const Expanded(child: Text("")),
//
//                 Padding(
//
//                   padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
//                   child: Text("نوع السكن:${widget.apartments?.type??""}",
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16,
//                         
//                       )),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     // });
//   }
// // Widget genericInfoOfApartment(DataOfOneApartment apartment){
// //   return
// //     Container(
// //     margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
// //     padding:const EdgeInsets.all(5),
// //     decoration: BoxDecoration(
// //       borderRadius: BorderRadius.circular(7),
// //       color: Colors.white70,
// //     ),
// //     child: Column(
// //       // this children have ( general info that : title, price , and location
// //       // .
// //       children: [
// //         Row(
// //           children: const [
// //             Padding(
// //               padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
// //               child: Text(
// //                 "معلومات عامة",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   
// //                 ),
// //               ),
// //             ),
// //             Expanded(child: Text(""),),
// //
// //           ],
// //         ),
// //         //title
// //         Row(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
// //               child: Text(apartment.
// //               // data.
// //               title??"",
// //                   style: const TextStyle(
// //                     color: Colors.black87,
// //                     fontSize: 16,
// //                     
// //                   )),
// //             ),
// //           ],
// //         ),
// //         // location
// //         Row(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
// //               child: Text(
// //                 "المكان:${apartment
// //                     .
// //                 // data.
// //                 city}-${apartment
// //                     // .data
// //                     .
// //                 location}",
// //                 textDirection: TextDirection.rtl,
// //                 style: TextStyle(
// //                   color: Colors.grey.shade800,
// //                   
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         //price
// //         Row(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
// //               child: Text(
// //                 "الأجرة:${apartment.
// //                 // data.
// //                 price}",
// //                 style: const TextStyle(
// //                   color: Colors.orange,
// //                   
// //                 ),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.fromLTRB(0, 0, 3, 10),
// //               child: Text("شيكل/شهري",
// //                   style: TextStyle(
// //                     color: Colors.orange,
// //                     fontSize: 16,
// //                     
// //                   )),
// //             ),
// //             const Expanded(child: Text("")),
// //
// //             Padding(
// //
// //               padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
// //               child: Text("نوع السكن:${apartment
// //                   // .data
// //                   .type}",
// //                   style: const TextStyle(
// //                     color: Colors.grey,
// //                     fontSize: 16,
// //                     
// //                   )),
// //             ),
// //           ],
// //         )
// //       ],
// //     ),
// //   );
// //
// // }
//
// }
// getData()async{
//   // setState(() {
//   //   genericInfoData.clear();
//   // });
//   var url = Uri.parse(ServerLocalDiv.apartmentOne);
//   var response = await http.get(url);
//   var data = jsonDecode(response.body);
//   debugPrint(data);
//   // setState(() {
//   // genericInfoData = DataOfOneApartment(response.body) as List<DataOfOneApartment>;
//   // genericInfoData = data[0] as List<DataOfOneApartment>;
//   // var generic = DataOfOneApartment.fromJson(data);
//
//   // });
//   // var json = jsonDecode(response.body);
//
//   // genericInfoData = DataOfOneApartment.fromJson(json) as List<DataOfOneApartment> ;
//   // setState(() {
//   //   genericInfoData = model.data as List<dynamic>  ;
//   // });
//   // print(genericInfoData);
//
//
//   // var data = json['data'] as List<dynamic>;
//   // for(var value in data){
//   //   genericInfoData.add(ArrayOfApartments(title: value['title'],
//   //       location: value['location'],price: value['price'],city: value['city'],type: value['type']));
//   //   genericInfoData.first;
//   //
//   // }
//
// }
//
//
// //
//
//
//
//
// //general info about apartment
//
