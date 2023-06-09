

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/main.dart';
class SplashScreen extends StatefulWidget {

  SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, MyPagesRoutes.main),
    );
// checkWifiStatus();
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Color(0x2ef0f0fe),
      body: SingleChildScrollView(
        child: Center(
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage("assets/images/splash_screen.jpg"
                  ),)
              // Text(
              //   "وين",
              //   style: TextStyle(
              //     fontFamily: 'IBM',
              //     fontSize: 70,
              //     color: Colors.white,
              //     // height: 4
              //     // debugLabel: "Alamat"
              //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
              //     //     fontStyle:FontStyle.normal
              //     // inherit: true
              //     // backgroundColor: Colors.grey
              //     // fontWeight: FontWeight.w700
              //     shadows: [
              //       Shadow(
              //           color: Colors.black38,
              //           blurRadius: 20,
              //           offset: Offset.fromDirection(2, 4))
              //     ],
              //   ),
              //   textScaleFactor: 1.4,
              //   // selectionColor: Colors.blue
              // ),
              // Text(
              //   "بلاقي",
              //   style: TextStyle(
              //     // letterSpacing: 1,
              //     fontFamily: 'IBM',
              //     fontSize: 70,
              //     color: Colors.white,
              //     // height: 4
              //     // debugLabel: "Alamat"
              //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
              //     //     fontStyle:FontStyle.normal
              //     // inherit: true
              //     // backgroundColor: Colors.grey
              //     // fontWeight: FontWeight.w700
              //     shadows: [
              //       Shadow(
              //           color: Colors.black38,
              //           blurRadius: 20,
              //           offset: Offset.fromDirection(2, 4))
              //     ],
              //   ),
              //   textScaleFactor: 1.4,
              //   // selectionColor: Colors.blue
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      print('Wi-Fi is connected');
    } else {
      myPushName(context, MyPagesRoutes.noInternet);
    }
  }

}
