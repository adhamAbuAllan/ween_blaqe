

import '../../../../api/apartments_api/apartments.dart';

class ApartmentState {
  final bool isLoading;
  final bool isUpdating;
  final bool isOwnerHaveApartments;
  final String? errorMessage;
  final Apartments apartmentsList;
  final Apartments apartmentsOfOwner;
  final int ?currentIndex;

  ApartmentState({
   this.currentIndex,
    this.isLoading = false,
    this.isUpdating = false,
    this.isOwnerHaveApartments = false,
    this.errorMessage,
    Apartments? apartmentsList,
    Apartments? apartmentsOfOwner,
  })  : apartmentsList = apartmentsList ?? Apartments(),
        apartmentsOfOwner = apartmentsOfOwner ?? Apartments(data: []);

  ApartmentState copyWith({
    bool? isLoading,
    bool? isUpdating,
    int? currentIndex,
    bool? isOwnerHaveApartments,
    String? errorMessage,
    Apartments? apartmentsList,
    Apartments? apartmentsOfOwner,
  }) {
    return ApartmentState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isOwnerHaveApartments: isOwnerHaveApartments ?? this.isOwnerHaveApartments,
      errorMessage: errorMessage ?? this.errorMessage,
      apartmentsList: apartmentsList ?? this.apartmentsList,
      apartmentsOfOwner: apartmentsOfOwner ?? this.apartmentsOfOwner,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

