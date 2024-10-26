import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/strings.dart';
import '../../main.dart';

class CreateSocialConnectionController extends GetxController {
  RxBool whatsAppIsActive = true.obs;
  RxBool phoneIsActive = true.obs;
  RxBool facebookIsActive = false.obs;
  RxBool emailIsActive = false.obs;
  TextEditingController whatsappController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> updateSocialConnectionData() async {
    final ownerId = (await sp).get("id");
    if (emailController.text != "" ||
        facebookController.text != "") {
      (await sp).remove("facebook");
      (await sp).remove("email");
      debugPrint("user id -- $ownerId");

      final url = Uri.parse(ServerWeenBalaqee.userUpdate);
      // Replace with your API endpoint
      final response = await http.post(
        url,
        body: jsonEncode({
          'id': ownerId,
          'email': emailController.text,
          'facebook': facebookController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        if (emailController.text !=
            "user_email") {
          (await sp).setString(
              "email", emailController.text);
          emailIsActive.value = true;
          debugPrint(
              "emailController -- ${emailController.text}");
          debugPrint(
              "email active value -- ${emailIsActive.value}");
        } else {
          (await sp).remove("email");
          // emailController.text = "user_email";
          // emailIsActive.value = false;
        }
        if (facebookController.text !=
            "user"
                "_name"
                "") {
          (await sp).setString("facebook",
              facebookController.text);
          facebookIsActive.value = true;
          debugPrint(
              "faceBookController -- ${facebookController.text}");
          debugPrint(
              "facebook active value -- ${facebookIsActive.value}");
        } else {
          (await sp).remove("facebook");
          // facebookController.text = "user_na"
          //     "me";
          // facebookIsActive.value = false;
        }

        debugPrint('User updated successfully');
      } else {
        debugPrint('Failed to update user');
      }
    }

  }

}
