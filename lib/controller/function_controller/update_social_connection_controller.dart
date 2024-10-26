
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateSocialConnectionController extends GetxController {
  RxBool whatsAppIsActive = true.obs;
  RxBool phoneIsActive = true.obs;
  RxBool facebookIsActive = false.obs;
  RxBool emailIsActive = false.obs;
  TextEditingController whatsappController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController emailController = TextEditingController();


}
