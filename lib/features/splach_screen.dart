import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/main.dart';

import '../constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // navigateToHome();
    checkWifiStatus();
    debugPrint("initState Of splashScreen is work now ! ");
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.pushReplacementNamed(context, MyPagesRoutes.main),
    // );
    // checkWifiStatus();

//   Future<void> goToMain()async{
//     connectivityResult = await (Connectivity().checkConnectivity());
//   }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0x2ef0f0fe),
      body: SingleChildScrollView(
        child: Center(
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/splash_screen.jpg"),
              )
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

  void checkWifiStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi
        // connectivityResult.name == ConnectivityResult.wifi
        ) {
      print("naviage to noIntrnet ");
      // await navigateToHome();
      navigateToHome();
    } else {
      if (connectivityResult == ConnectivityResult.none) {
        pushAndRemoveToNoInternet();

        debugPrint("you don't have entrent");
      }
    }
  }

  Future<void> navigateToHome() async {
    /*
    this is first -v code
     */
    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade, duration: kTranstionDuratoin);
    });

    /*
      this is 11/4/2023 -v
       */
    // await  Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
    // await  myPushName(context, MyPagesRoutes.main);

    // Future.delayed(const Duration(seconds: 2), () {
    //
    //   // Get.to(() => const HomeView(),
    //   //     transition: Transition.fade, duration: kTranstionDuratoin);
    //
    // });
  }

  Future<void> pushAndRemoveToNoInternet() async {
    Future.delayed(const Duration(milliseconds: 700), () {
      // Navigator.pushReplacementNamed(context, MyPagesRoutes.noInternet);
      myPushName(context, MyPagesRoutes.noInternet);

      // checkWifiStatus();
    });

    // Navigator.pushReplacementNamed(context,MyPagesRoutes.noInternet);
  }
}
