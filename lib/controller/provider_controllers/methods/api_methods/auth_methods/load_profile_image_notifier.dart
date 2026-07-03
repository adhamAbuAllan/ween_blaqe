import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';

import '../../../../../constants/strings.dart';
import '../../../../../session/new_session.dart';

class LoadProfileImageNotifier extends StateNotifier<AuthState> {
  /// a [LoadProfileImageNotifier] usage to fetch data of user even in profile
  /// or to get the image of user 'if-exists'.
  LoadProfileImageNotifier() : super(AuthState());
  Future<String> loadProfileImage(WidgetRef ref) async {
    state = state.copyWith(isLoading: true);
    final url = Uri.parse(ServerWeenBalaqee.loadProfileImage);
    var userId = NewSession.get(PrefKeys.id, -1).toString();
    var response = await http.post(url, body: {"id": userId});
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var jsonResponse = jsonDecode(responseBody);
      await NewSession.save(
        PrefKeys.profile,
        ServerWeenBalaqee.normalizePublicUrl(jsonResponse['data']['profile']),
      );
      await NewSession.save(
        PrefKeys.createdAt,
        jsonResponse['data']['time_ago'] ?? "",
      );

      debugPrint("you created at -- ${jsonResponse['data']['time_ago']}");
      debugPrint(
        "the profile image in SP -- ${NewSession.get(PrefKeys.profile, "")}",
      );

      state = state.copyWith(isLoading: false);

      return response.body;
    } else {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to load profile image${response.body}');
    }
  }
}
