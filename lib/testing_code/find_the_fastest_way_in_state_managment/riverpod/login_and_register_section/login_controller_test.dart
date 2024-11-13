import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/users.dart';
import '../../../../constants/strings.dart';
import '../../../../controller/get_controllers.dart';
import '../../../../core/utils/funcations/route_pages/push_routes.dart';
import 'package:http/http.dart'as http;

import '../../../../sesstion/sesstion_of_user.dart';


class LoginState {
  final bool isLoading;
  final String? errorMessage;

  LoginState({this.isLoading = false, this.errorMessage});

  LoginState copyWith({bool?  isLoading, String? errorMessage}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());


  Future<void> login(String phone, String password,BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      // Make your API request here
      var url = Uri.parse(ServerWeenBalaqee.userLogin);
      var response = await http.post(url, body: {"phone": phone, "password": password});

      if (response.statusCode <= 400) {
        // Parse the response
        var res = UserRes.fromJson(jsonDecode(response.body));
        apartmentModelController.ownerToken = res.data.token;
        saveUserInfo(res.data);
         pushToMainPage(context);
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "رقم الهاتف أو كلمة المرور خاطئة",
        );
      }
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "حدث خطأ أثناء تسجيل الدخول. حاول مرة أخرى.",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
  Future<void> pushToMainPage(BuildContext context) async {
    await myPushName(context, MyPagesRoutes.main);
    // await  Navigator.of(context).push(MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeBeforeAddData())
    // );

    // studentController.index = 0;
  }

}
