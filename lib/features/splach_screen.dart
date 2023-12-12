import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
main(){
  runApp(MaterialApp(home:SplashScreen()));
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInitialized = false;
  // late var   connectivityResult =  Connectivity().checkConnectivity();

  @override
  void initState() {
    super.initState();
    // navigateToHome();

    debugPrint("initState Of splashScreen is work now ! ");
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.pushReplacementNamed(context, MyPagesRoutes.main),
    // );
    // checkWifiStatus();

//   Future<void> goToMain()async{
//     connectivityResult = await (Connectivity().checkConnectivity());
//   }
  isInitialized = true ;
  }

  @override
  Widget build(BuildContext context)  {

    // setState(() {
    // });d

    return  const Scaffold(
      backgroundColor: Color(0x2ef0f0fe),
      body:
      // isInitialized ?
      // (
    //   StreamBuilder<ConnectivityResult>(
    //     stream: Connectivity().onConnectivityChanged,
    //     builder: (context, snapshot) {
    //      return snapshot.data == ConnectivityResult.wifi ||
    //          snapshot.data == ConnectivityResult.mobile? const Main() : const NoInternet();
    //
    //   },
    // )

      // )
          // :  bulidSplashScreenWidget()
      SingleChildScrollView(
        child: Center(
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/splash screen heigh qulity with large size.png"),
    ) ]))));
      //         // Text(
      //         //   "وين",
      //         //   style: TextStyle(
      //         //     fontFamily: 'IBM',
      //         //     fontSize: 70,
      //         //     color: Colors.white,
      //         //     // height: 4
      //         //     // debugLabel: "Alamat"
      //         //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
      //         //     //     fontStyle:FontStyle.normal
      //         //     // inherit: true
      //         //     // backgroundColor: Colors.grey
      //         //     // fontWeight: FontWeight.w700
      //         //     shadows: [
      //         //       Shadow(
      //         //           color: Colors.black38,
      //         //           blurRadius: 20,
      //         //           offset: Offset.fromDirection(2, 4))
      //         //     ],
      //         //   ),
      //         //   textScaleFactor: 1.4,
      //         //   // selectionColor: Colors.blue
      //         // ),
      //         // Text(
      //         //   "بلاقي",
      //         //   style: TextStyle(
      //         //     // letterSpacing: 1,
      //         //     fontFamily: 'IBM',
      //         //     fontSize: 70,
      //         //     color: Colors.white,
      //         //     // height: 4
      //         //     // debugLabel: "Alamat"
      //         //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
      //         //     //     fontStyle:FontStyle.normal
      //         //     // inherit: true
      //         //     // backgroundColor: Colors.grey
      //         //     // fontWeight: FontWeight.w700
      //         //     shadows: [
      //         //       Shadow(
      //         //           color: Colors.black38,
      //         //           blurRadius: 20,
      //         //           offset: Offset.fromDirection(2, 4))
      //         //     ],
      //         //   ),
      //         //   textScaleFactor: 1.4,
      //         //   // selectionColor: Colors.blue
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    // );

  }

  // void checkWifiStatus() async {
  //    var   connectivityResult =  Connectivity().checkConnectivity();
  //
  //   if (connectivityResult ==  ConnectivityResult.wifi) {
  //     print("naviage to noIntrnet/you have entrent ");
  //     await navigateToHome();
  //     // bulidSplashScreenWidget();
  //     setState(() {
  //       isInitialized = true;
  //     });
  //   } else {
  //     if (connectivityResult == ConnectivityResult.none) {
  //       pushAndRemoveToNoInternet();
  //       isInitialized = true;
  //
  //
  //       debugPrint("you don't have entrent");
  //     }
  //   }
  // }

  // StatelessWidget bulidSplashScreenWidget()  {

    /*
    this is first -v code
     */
      // Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //    isInitialized = false;
    // });
    //
    //   return const SingleChildScrollView(
    //     child: Center(
    //       //
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image(
    //             image: AssetImage("assets/images/splash_screen.jpg"),
    //           )
    //           // Text(
    //           //   "وين",
    //           //   style: TextStyle(
    //           //     fontFamily: 'IBM',
    //           //     fontSize: 70,
    //           //     color: Colors.white,
    //           //     // height: 4
    //           //     // debugLabel: "Alamat"
    //           //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
    //           //     //     fontStyle:FontStyle.normal
    //           //     // inherit: true
    //           //     // backgroundColor: Colors.grey
    //           //     // fontWeight: FontWeight.w700
    //           //     shadows: [
    //           //       Shadow(
    //           //           color: Colors.black38,
    //           //           blurRadius: 20,
    //           //           offset: Offset.fromDirection(2, 4))
    //           //     ],
    //           //   ),
    //           //   textScaleFactor: 1.4,
    //           //   // selectionColor: Colors.blue
    //           // ),
    //           // Text(
    //           //   "بلاقي",
    //           //   style: TextStyle(
    //           //     // letterSpacing: 1,
    //           //     fontFamily: 'IBM',
    //           //     fontSize: 70,
    //           //     color: Colors.white,
    //           //     // height: 4
    //           //     // debugLabel: "Alamat"
    //           //     // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
    //           //     //     fontStyle:FontStyle.normal
    //           //     // inherit: true
    //           //     // backgroundColor: Colors.grey
    //           //     // fontWeight: FontWeight.w700
    //           //     shadows: [
    //           //       Shadow(
    //           //           color: Colors.black38,
    //           //           blurRadius: 20,
    //           //           offset: Offset.fromDirection(2, 4))
    //           //     ],
    //           //   ),
    //           //   textScaleFactor: 1.4,
    //           //   // selectionColor: Colors.blue
    //           // ),
    //         ],
    //       ),
    //     ),
    //   );


      // Get.to(() => const HomeView(),
      //     transition: Transition.fade, duration: kTranstionDuratoin);


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
    // setState(() {
    //   isInitialized = false;
    // });
  // }

  Future<void> pushAndRemoveToNoInternet() async {
    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushReplacementNamed(context, MyPagesRoutes.noInternet);
      // myPushName(context, MyPagesRoutes.noInternet);


      // checkWifiStatus();
    });


    // Navigator.pushReplacementNamed(context,MyPagesRoutes.noInternet);
  }
  // Future<void> navigateToHome() async {
  //   Future.delayed(const Duration(milliseconds: 700), () {
  //     // Navigator.pushReplacementNamed(context, MyPagesRoutes.noInternet);
  //
  //     Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
  //
  //
  //     // checkWifiStatus();
  //   });
  //
  //
  //   // Navigator.pushReplacementNamed(context,MyPagesRoutes.noInternet);
  // }
}
