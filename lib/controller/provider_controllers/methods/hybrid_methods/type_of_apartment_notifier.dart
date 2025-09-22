import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../statuses/status_of_apartment/apartment_type_state.dart';

// Define the apartment types
enum ApartmentType {
  all(0),
  families(1),
  boyStudents(2),
  girlStudents(3);

  final int value;
  const ApartmentType(this.value);
}


// Notifier class
class ApartmentTypeNotifier extends StateNotifier<ApartmentTypeState> {
  final Ref ref;

  ApartmentTypeNotifier(this.ref) : super(ApartmentTypeState(selectedType: ApartmentType.all)) {
    // Initialize with default values
    _updateState(state.selectedType);
  }

  // Method to update the apartment type
  Future<void> selectApartmentType(ApartmentType type, {required WidgetRef ref}) async {
    if (state.selectedType == type) return;



      // Update the state
      _updateState(type);

      // Fetch apartments based on the selected type
      await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
        ref: ref,
        isOwnerApartments: false,
        studentReminding: type == ApartmentType.boyStudents || type == ApartmentType
            .girlStudents
            ? ref.read(selectedStudentReminding)
            : null,
      );
  }

  // Helper method to update all related states
  void _updateState(ApartmentType type) {
    // Update the apartment type
    ref.read(apartmentTypeNotifier.notifier).state = type.value;

    // Update all the boolean flags
    ref.read(isBoyStudentNotifier.notifier).state = type == ApartmentType.boyStudents;
    ref.read(isGirlStudentNotifier.notifier).state = type == ApartmentType.girlStudents;
    ref.read(isFamiliesNotifier.notifier).state = type == ApartmentType.families;
    ref.read(isAllTypesOfApartmentNotifier.notifier).state = type == ApartmentType.all;

    // Update the state
    state = state.copyWith(selectedType: type);
  }
}

