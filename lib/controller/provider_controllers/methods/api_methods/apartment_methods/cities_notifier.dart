import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../api/cities.dart';
import '../../../../../constants/strings.dart';
import '../../../statuses/city_state.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/dropdown_fields_widgets/cities_drop_down_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets/bar_of_cities_widget.dart';
class CityNotifier extends StateNotifier<CityState> {
  CityNotifier() : super(CityState(cities: [], isLoading: false,));
/// a [getCity] method usages to show the cities in cities bar in
  /// [CitiesBarWidget].
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
/// a [setSelectedCity] usages to show cities in [DropdownCitiesWidget].
  void setSelectedCity(City city) {
    state = state.copyWith(selectedCity: city);
  }
  /// usage to get cities from database and but them in [DropdownCitiesWidget]
  Future<List?> fetchCities() async {
    state = state.copyWith(isLoading: true);
    var url = Uri.parse(ServerWeenBalaqee.city);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var getData = jsonData['data'];
      state.cities.clear();
      for (var item in getData) {
        state.cities.add(City.fromJson(item));
      }
      state = state.copyWith(cities:state.cities, isLoading: false);
      return state.cities;
    }else{
      debugPrint("data is null");
      return null;
    }
  }
}
