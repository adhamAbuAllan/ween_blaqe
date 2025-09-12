import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

// import '../../../../controller/get_controllers.dart';
// import '../../../../core/utils/funcations/route_pages/push_routes.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../../../../api/users.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/strings.dart';
import '../../../statuses/auth_state.dart';
import '../../../providers/auth_provider.dart';
import '../../../../../session/sesstion_of_user.dart';

class RegisterNotifier extends StateNotifier<AuthState> {
  RegisterNotifier() : super(AuthState());

  Future<void> register(String name, String phone, String password, int typeId,
      int universityId, WidgetRef ref, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    var url = Uri.parse(ServerWeenBalaqee.register);
    typeId = typeId + 1;
    var response = await http.post(url, body: {
      "name": name,
      "phone": phone,
      "password": password,
      "type_id": typeId.toString(),
      "university_id": universityId.toString(),
      "country_phone_number_id": "1",
    });

    final responseData = jsonDecode(response.body);
    debugPrint("response from server ${response.body}");

    debugPrint("the type id ${typeId}");
    debugPrint("msg from server ${responseData['msg']}");
    debugPrint("Status code: ${response.statusCode}");
    // debugPrint("response body -> ${response.body}");
    if (response.statusCode <= 400) {
      var res = UserRes.fromJson(jsonDecode(response.body));

      saveUserInfo(res.data);

      ref
          .read(refreshUserDataNotifier.notifier)
          .refreshUserData(userId: res.data.id ?? -1, ref: ref);
      ref.read(phoneLoginController).clear();
      ref.read(passwordLoginController).clear();
      state = state.copyWith(isLoading: false);
      await myPushReplacementNamedFuture(MyPagesRoutes.main, context);
    } else {
      if (response.statusCode == 404) {
        ref.read(formFieldsNotifier.notifier).updateApiErrors({
          'phoneNumberRegistration': SetLocalization.of(context)!
              .getTranslateValue("try_different_phone"),
        });
        state = state.copyWith(isLoading: false);
        return;
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
      );
      return;
    }
  }
}
