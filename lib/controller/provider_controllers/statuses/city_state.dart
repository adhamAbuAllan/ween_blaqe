// State for Cities
import '../../../api/cities.dart';

class CityState {
  late final int cityId;
  final bool isLoading;
  final List<City> cities;
  final City? selectedCity; // Currently selected city

  CityState({
    this.cityId = 0,
    this.isLoading = false,
    this.cities = const [],
    this.selectedCity,
  });

  CityState copyWith({
    int? cityId,
    bool? isLoading,
    List<City>? cities,
    City? selectedCity,
  }) {
    return CityState(
      cityId: cityId ?? this.cityId,
      isLoading: isLoading ?? this.isLoading,
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}
