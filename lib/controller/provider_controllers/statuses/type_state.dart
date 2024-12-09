import '../../../api/type_of_apartment.dart';

class TypeState {
  final List<TypeOfApartment> types; // List of cities to display in the
  // dropdown
  final TypeOfApartment? selectedType; // Currently selected city
  final bool? isLoading;

  TypeState({
    required this.types,
    this.selectedType,
    this.isLoading
  });

  TypeState copyWith({
    List<TypeOfApartment>? types,
    TypeOfApartment? selectedType,
    bool ? isLoading

  }) {
    return TypeState(
        types: types ?? this.types,
        selectedType: selectedType ?? this.selectedType,
        isLoading: isLoading ?? this.isLoading
    );
  }
}
