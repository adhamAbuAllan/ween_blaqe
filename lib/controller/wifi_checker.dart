import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../constants/nums.dart';
import '../constants/strings.dart';
import '../core/utils/funcations/route_pages/push_routes.dart';

Future<void> checkWifiStatus({bool ? loading, BuildContext ? context})async {
  var connectivityResult =  (Connectivity().checkConnectivity());
  loading = true;

  if (connectivityResult ==   ConnectivityResult.wifi) {

    // myPushReplacementNamed( MyPagesRoutes.mainStudent,context: context);
    debugPrint  ("you have enternet");

    // loading == true ?
    // CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 2, backgroundColor: Colors.white,)
    //     :
    // Navigator.pop(context);
  } else {

    debugPrint("you don't have entrent");
    // loading == true ?
    const CircularProgressIndicator(
      color: kPrimaryColor,
      strokeWidth: 2,
      backgroundColor: Colors.white,
    )
    // :  myPushName(context, MyPagesRoutes.noInternet)
        ;
  }
  loading = false;
}
