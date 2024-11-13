import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../api/users.dart';
import '../../../../constants/strings.dart';
import '../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../features/statuses/load_button_state.dart';
import 'package:http/http.dart' as http;

import '../../../../features/user/provider/auth_provider.dart';
import '../../../../sesstion/sesstion_of_user.dart';
import '../../../get_controllers.dart';

class LoginNotifier extends StateNotifier<AuthState> {
  LoginNotifier() : super(AuthState());

  Future<void> login(String phone, String password, WidgetRef ref,
      BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Make your API request here
    var url = Uri.parse(ServerWeenBalaqee.userLogin);
    var response = await http.post(
      url,
      body: {"phone": phone, "password": password},
    );

    if (response.statusCode <= 400) {
      var res = UserRes.fromJson(jsonDecode(response.body));
      apartmentModelController.ownerToken = res.data.token;
      saveUserInfo(res.data);
      state = state.copyWith(isLoading: false);

      await myPushReplacementNamedFuture(MyPagesRoutes.main, context);
    } else {
// Update form fields state with error messages
      ref.read(formFieldsProvider.notifier).updateErrors({
        'phone': SetLocalization.of(context)!.getTranslateValue("phoneOrPasswordIncorrect"),
        'password': SetLocalization.of(context)!.getTranslateValue("phoneOrPasswordIncorrect"),
      });
      state = state.copyWith(isLoading: false);
      return;
    }

    state = state.copyWith(isLoading: false);
  }
}
