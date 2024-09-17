import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/funcations/snakbar_for_stream_builder.dart';

class ConnectivityController extends GetxController {
  var connectivity = ConnectivityResult.none.obs; // Use an Rx variable
  RxBool isInitState = false.obs;
  RxBool isSnackBarShow = false.obs;

  @override
  void onInit() {
    super.onInit();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//AsyncWidgetBuilder<ConnectivityResult>
      connectivity.value = result;

      debugPrint("connectivity result in controller: --${connectivity.value}");
    });
  }

  // No need forparameter
  bool isConnection() {
    debugPrint("connectivity result in controller: --${connectivity.value}");
    return connectivity.value != ConnectivityResult.none;
  }

  Future<void> handleConnectivityChange(BuildContext context,
      ConnectivityResult? connectivityResult, ) async {

    if (!isConnection()) {
      showSnakBarInStreamBuilder(context, "انقطع الانترنت",
              icon: Icons.wifi_off, );

    } else {
      // isStart
      //     ? (
          showSnakBarInStreamBuilder(
                  context,
                  ""
                  "تمت "
                  "إعادة الاتصال",
                  icon: Icons.wifi,
                  );


          // )
      //     :
      // const SizedBox();
      // isSnackBarShow.value
      //     ? const SizedBox()
      //     : (!isStart
      //         ? const SizedBox()
      //         : showSnakBarInStreamBuilder(
      //             context,
      //             ""
      //             "تمت "
      //             "إعادة الاتصال",
      //             icon: Icons.wifi,
      //             isStart: isStart));

    }

    isSnackBarShow.value = true;
  }
}
