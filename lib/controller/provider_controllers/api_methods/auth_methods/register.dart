
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../api/users.dart';
import '../../../../constants/strings.dart';
// import '../../../../controller/get_controllers.dart';
// import '../../../../core/utils/funcations/route_pages/push_routes.dart';
import 'package:http/http.dart'as http;

import '../../../../features/statuses/load_button_state.dart';
import '../../../../features/user/provider/auth_provider.dart';
import '../../../../sesstion/sesstion_of_user.dart';
import 'dart:convert';
    class RegisterNotifier extends StateNotifier<AuthState> {
  RegisterNotifier() : super(AuthState());
  Future<void> register(
      String name,
      String phone,
      String password,
      int typeId,
      int universityId,
      WidgetRef ref,
      ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      var url = Uri.parse(ServerWeenBalaqee.register);
      var response = await http.post(url, body: {
        "name": name,
          "phone": ref.read(selectedCountryCode) + phone,
        "password": password,
        "type_id": typeId.toString(),
        "university_id": universityId.toString(),
        "country_phone_number_id": "1",
      });

      debugPrint("Status code: ${response.statusCode}");

      if (response.statusCode <= 400) {
        var res = UserRes.fromJson(jsonDecode(response.body));

        if (!res.status) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: res.msg == "The phone has already been taken."
                ? "رقم الهاتف مسجل مسبقاً."
                : res.msg,
          );
        } else {
          // Save user data if registration is successful
          saveUserInfo(res.data);
          ref.read(phoneController).clear();
          ref.read(passwordController).clear();
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
        );
      }
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
