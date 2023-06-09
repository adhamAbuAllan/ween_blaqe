// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../api/apartments.dart';
// class MyRefreshIndicator extends StatefulWidget {
//   Widget? myWidget;
//    MyRefreshIndicator({Key? key,this.myWidget}) : super(key: key);
//
//   @override
//   State<MyRefreshIndicator> createState() => _MyRefreshIndicatorState();
// }
//
// class _MyRefreshIndicatorState extends State<MyRefreshIndicator> {
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//
//         onRefresh: ()async{
//       await loaResources();
//     }, child: widget);
//   }
// Future<void>loaResources()async{
//   await Get.find<Apartment>().title;
// }
//
// }
