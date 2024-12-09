import 'dart:convert';

import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/session/new_session.dart';

import '../../../../../../api/users.dart';
import '../../../../../../constants/strings.dart';
import 'package:http/http.dart' as http;

class SocialConnectionDataUpdaterNotifier extends StateNotifier<AuthState> {
  SocialConnectionDataUpdaterNotifier() : super(AuthState());

  Future<void> socialConnectionDataUpdater(WidgetRef ref, BuildContext context,) async {
    state = state.copyWith(isLoading: true);
    final ownerId = NewSession.get("id", -1);

    final url = Uri.parse(ServerWeenBalaqee.userUpdate);

    final response = await http.post(
      url,
      body: jsonEncode({
        'id': ownerId,
        'email': ref.read(emailController).text.isEmpty
            ? "user_email"
            : ref.read(emailController).text,
        'facebook': ref.read(facebookController).text.isEmpty
            ? "user_name"
            : ref.read(facebookController).text
      }),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint("the status code in updater is ${response.statusCode}");
    debugPrint("the body in updater is ${response.body}");
    if (response.statusCode == 200) {
      ref.read(userData.notifier).state =
          User.fromJson(jsonDecode(response.body));

      state = state.copyWith(isLoading: false);
      Navigator.pop(context);

    }
  }
}
