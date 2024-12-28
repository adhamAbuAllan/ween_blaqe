import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/localization.dart';
import 'dart:convert';

import '../../api/users.dart';
import '../../constants/strings.dart';
import '../../core/utils/funcations/route_pages/push_routes.dart';
import '../../session/sesstion_of_user.dart';
import '../get_controllers.dart';

class UserModelController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController surePasswordController = TextEditingController();

  RxBool isPhoneNumberValid = false.obs;
  RxBool isPhoneNumberIsAlreadyTaken = false.obs;
  RxBool isLoading = false.obs;
  RxBool hasCheckedNumberPhone = false.obs;
  RxBool isObscure = true.obs;
  RxBool isSureObscure = true.obs;
  RxBool autoFocus = true.obs;
  RxString errorMsg = "".obs;
  RxString phoneValidationMsg = "".obs;
  RxString passwordValidationMsg = "".obs;
  RxString userNameValidationMsg = "".obs;
  RxString loginPhoneValidationMsg = "".obs;
  RxString loginPasswordValidationMsg = "".obs;
  RxString selectedCountryCode = '970'.obs;
  RxList<String> countryCodes = ['970', '972'].obs;
  final formRegisterKey = GlobalKey<FormState>();
  final formLoginKey = GlobalKey<FormState>();

  loginMethod(String phone, String password,BuildContext
  context)
  async {
    isLoading.value = true;
    update();
    debugPrint("phone is $phone");
    debugPrint("password is $password");
    var url = Uri.parse(ServerWeenBalaqee.userLogin);
    var response = await http.post(url, body: {
      "phone": "970123459876",
      "password": "123"});
    debugPrint("status code ${response.statusCode}");

    if (response.statusCode <= 400) {
      var res = UserRes.fromJson(jsonDecode(response.body));
      apartmentModelController.ownerToken = res.data.token;
      autoFocus.value = false;
      saveUserInfo(res.data);
      isLoading.value = false;
     myPushReplacementNamed(MyPagesRoutes.main, context: context);
      debugPrint("it should push");
      update();
    }else{
      debugPrint("message error is ${response.body}");
      userModelController.loginPhoneValidationMsg
          .value =
          SetLocalization.of(context)!
              .getTranslateValue(
              "phoneOrPasswordIncorrect");
      userModelController.loginPasswordValidationMsg
          .value =
          SetLocalization.of(context)!
              .getTranslateValue(
              "phoneOrPasswordIncorrect");
      isLoading.value = false;
      update();
    }
  }

















    register(String name, String phone, String password, int typeId,
        int universityId, BuildContext context,) async {
      isLoading.value = true;
      refresh();
      var url = Uri.parse(ServerWeenBalaqee.register);
      var response = await http.post(url, body: {
        "name": name,
        "phone":selectedCountryCode.value + phone,
        "password": password,
        "type_id": typeId.toString(),
        "university_id": universityId.toString(),
        "country_phone_number_id": "1",
      });
  debugPrint("status code ${response.statusCode}");
      if (response.statusCode <= 400) {
        var res = UserRes.fromJson(await jsonDecode(response.body));
        errorMsg.value = res.msg;

        if (res.status == false) {
          if (errorMsg.value == "The phone has already been taken.") {
            update();
            return;
          }
          removeUserInfo();
          return;
        } else {

          var data = res.data;
          saveUserInfo(data);
          isLoading.value = false;
          myPushReplacementNamed(MyPagesRoutes.main, context: context);
          phoneController.text = "";
          passwordController.text = "";
          //print the phone controller
          debugPrint("phone controller ${phoneController.text}");




  refresh();

        }
      } else {
        isLoading.value = false;
        refresh();
        // havePhoneTextValid.value = true;
        update();
        return;
      }
    }

  checkerPhoneNumber(String phoneNumber) async {
    final url = Uri.parse(ServerWeenBalaqee.checkPhone);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'phone': phoneNumber,
      }),
    );

    if (response.statusCode == 200 //200 mean is phone number already exists
        ) {
      isLoading.value = false;
      isPhoneNumberIsAlreadyTaken.value = true;
      update();
      return;
    } else if (response.statusCode == 404 //404 mean phone number is not
        // exists in data base
        ) {
      isPhoneNumberIsAlreadyTaken.value = false;

      update();
    } else {
      return;
    }
  }
}

//for login
/*
//phone number login
                          validator: (value) {
                            // userModelController.loginPhoneValidationMsg.value = "";

                            if (value!.isEmpty) {
                              return SetLocalization.of(context)!
                                  .getTranslateValue("fill_field");
                            }

                            if (value.length > 12 || value.length < 12) {
                              return SetLocalization.of(context)!
                                  .getTranslateValue(
                                      "the_phone_number_is_not_suitable");
                            }

                            if (!value.startsWith('97')) {
                              return SetLocalization.of(context)!.getTranslateValue(
                                  "phone_number_should_start_with_country_code");
                            }
                            if (userModelController
                                    .loginPhoneValidationMsg.value !=
                                "") {
                              return userModelController
                                  .loginPhoneValidationMsg.value;
                            }

                            return null;
                          }

                          //for password login

                    for login button
                    async {
                            await userModelController.loginMethod(
                                userModelController.phoneController.text,
                                userModelController.passwordController.text,
                                context);



                            //
                            // userModelController.formLoginKey.currentState!
                            //     .validate();
                            //
                            //
                            // userModelController.phoneController.text =
                            //     removePlusSymbol(
                            //         userModelController.phoneController.text);
                            // hideKeyboard(context);
                            // if (userModelController
                            //     .phoneController.text.isEmpty) {
                            //   return;
                            // }
                            // if (userModelController
                            //     .passwordController.text.isEmpty) {
                            //   return;
                            // }
                            // if (userModelController
                            //             .phoneController.text.length >
                            //         12 ||
                            //     userModelController
                            //             .phoneController.text.length <
                            //         12) {
                            //   return;
                            // }

                            // await userModelController.loginMethod(
                            //     userModelController.phoneController.text,
                            //     userModelController.passwordController.text,
                            //     context);
                          }
 */
