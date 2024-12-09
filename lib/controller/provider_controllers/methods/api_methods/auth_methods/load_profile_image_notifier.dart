import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';

import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../../../session/new_session.dart';

class LoadProfileImageNotifier extends StateNotifier<AuthState> {
  LoadProfileImageNotifier() : super(AuthState());
  Future<String> loadProfileImage( WidgetRef
  ref) async {
    state = state.copyWith(isLoading: true);
    final url = Uri.parse(ServerWeenBalaqee.loadProfileImage);
    var userId = (await sp).get("id").toString();
    var response = await http.post(url, body: {"id": userId});
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var jsonResponse = jsonDecode(responseBody);
      NewSession.save("profile", await jsonResponse['data']['profile']);
      NewSession.save(
          "createdAt", await jsonResponse['data']['time_ago']);

      debugPrint("you created at -- ${await jsonResponse['data']['time_ago']}");
      debugPrint("the profile image in SP -- ${(await sp).get("profile")}");


      state = state.copyWith(isLoading: false);

      return response.body;
    } else {

      state = state.copyWith(isLoading: false);
      throw Exception('Failed to load profile image${response.body}');
    }
  }


}

