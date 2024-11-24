// State for Cities
import '../../../api/cities.dart';

class CityState {
   final int cityId;
  final bool isLoading;
  final List<City> cities;

  CityState({
    this.cityId = 0,
    this.isLoading = false,
    this.cities = const [],
  });

  CityState copyWith({
    int? cityId,
    bool? isLoading,
    List<City>? cities,
  }) {
    return CityState(
      cityId: cityId ?? this.cityId,
      isLoading: isLoading ?? this.isLoading,
      cities: cities ?? this.cities,
    );
  }
}

