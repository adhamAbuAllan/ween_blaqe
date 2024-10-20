import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxInt errorStatusCode = 0.obs;
  RxString validatorValue = "".obs;

  String? validator(String? value) {
    debugPrint("status code ${errorStatusCode.value}");
    if (errorStatusCode.value == 400) {
      debugPrint("status code ${errorStatusCode.value} ");
      return validatorValue.value = " كلمة المرور خاطئة";
    } else {
   debugPrint("no error you have ");
      errorStatusCode.value = 0;

      return null;
    }
  }
}
