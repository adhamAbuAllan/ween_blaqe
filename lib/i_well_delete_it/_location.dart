// // import 'dart:html';
//
// import 'package:flutter/material.dart';//  import 'package:location/location.dart';
//
// class MyLocation extends StatefulWidget {
//   const MyLocation({Key? key}) : super(key: key);
//
//   @override
//   State<MyLocation> createState() => _MyLocationState();
// }
//
// class _MyLocationState extends State<MyLocation> {
//   final formKey = GlobalKey<FormState>();
//   String lat = "0" ;
//   String lng = "0" ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("$lat"),
//           Text("$lng"),
//           ElevatedButton(onPressed: (){
//             getLocal();
//           }, child: Text("start"))
//
//
//         ],
//       ),
//     );
//   }
//
//   getLocal() async {
//     Location location = Location();
//     location.onLocationChanged.listen((LocationData currentLocation) {
//       setState(() {
//          lat = currentLocation.latitude.toString();
//          lng = currentLocation.longitude.toString();
//       });
//     });
//   }
//   testGetLocal() async {
//     Location location = new Location();
//
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return ;
//       }
//     }
//
//     _locationData = await location.getLocation();
//   }
// }
