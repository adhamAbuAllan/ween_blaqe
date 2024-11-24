import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../api/cities.dart';
import '../../../../../constants/strings.dart';
import '../../../statuses/city_state.dart';
import 'package:http/http.dart' as http;
class CityNotifier extends StateNotifier<CityState> {
  CityNotifier() : super(CityState());

  Future<void> getCity() async {
    state = state.copyWith(isLoading: true);

    try {
      final url = Uri.parse(ServerWeenBalaqee.city);
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        final data = json["data"] as List<dynamic>;
        final cities = data.map((value) => City.fromJson(value)).toList();

        state = state.copyWith(
          cities: cities,
          isLoading: false,
        );
      } else {
        throw Exception("Failed to fetch cities");
      }
    } catch (e) {
      debugPrint("Error fetching cities: $e");
      state = state.copyWith(isLoading: false);
    }
  }
}
