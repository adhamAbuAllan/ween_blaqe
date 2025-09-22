// State class
import '../../methods/hybrid_methods/type_of_apartment_notifier.dart';

class ApartmentTypeState {
  final ApartmentType selectedType;

  ApartmentTypeState({
    required this.selectedType,
  });

  ApartmentTypeState copyWith({
    ApartmentType? selectedType,
  }) {
    return ApartmentTypeState(
      selectedType: selectedType ?? this.selectedType,
    );
  }
}
