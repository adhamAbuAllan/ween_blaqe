import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/type_of_apartment.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:http/http.dart' as http;

import '../../../statuses/type_state.dart';

class TypeNotifier extends StateNotifier<TypeState> {
  TypeNotifier() : super(TypeState(types: [], isLoading: false));

/// a [setSelectedType] method that to set a type that in dopdown menu apartment have before.
  void setSelectedType(TypeOfApartment type) {
    state = state.copyWith(selectedType: type);
  }
  /// a [fetchTypes] to feetch types in dropdown of types
  Future<List?> fetchTypes() async {
    state = state.copyWith(isLoading: true);
    var url = Uri.parse(ServerWeenBalaqee.typeOfApartment);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var getData = jsonData['data'];
      state.types.clear();
      for (var item in getData) {
        state.types.add(TypeOfApartment.fromJson(item));
      }
      state = state.copyWith(types:state.types, isLoading: false);
      return state.types;
    }else{
      debugPrint("data is null");
      return null;
    }
  }
}
