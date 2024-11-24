import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/api_methods/apartment_methods/fetch_apartments.dart';

import '../../../api/apartments_api/apartments.dart';
import '../methods/api_methods/apartment_methods/insert_advantages_get_advantages.dart';
import '../methods/api_methods/apartment_methods/insert_images_in_apartment.dart';
import '../statuses/advantage_state.dart';
import '../statuses/apartment_state.dart';
import '../statuses/image_state.dart';


final fetchApartmentNotifier = StateNotifierProvider<FetchApartmentsNotifier,ApartmentState>((ref)
=>FetchApartmentsNotifier
  ());

final advantagesNotifier = StateNotifierProvider<AdvantagesNotifier,
    AdvantageState>(
      (ref) => AdvantagesNotifier(),);
  // image provider
    final imageManagerNotifier = StateNotifierProvider<ImageManager,
        ImageState>(
(ref) => ImageManager(),
);



final ownerTokenNotifier = Provider<String?>((ref) {
  final apartmentsList = ref.watch(apartmentsOfOwnerNotifier).data;
  return apartmentsList?[1].owner?.token;
});
final apartmentsListNotifier = StateProvider<Apartments>((ref) => Apartments
  ());

final apartmentsOfOwnerNotifier = StateProvider<Apartments>((ref) => Apartments
  (data: []));
final apartmentState = StateProvider<ApartmentState>((ref) => ApartmentState
  ());

final apartmentTypeNotifier = StateProvider<String>((ref) => 'طلاب'); // Default

final errorMessageNotifier = StateProvider<String>((ref) => ''); // Error

final apartmentIdNotifier = StateProvider<dynamic>((ref) => '-1');
final apartmentLengthOfOwnerProvider = StateProvider<int>((ref) => 0);
final isLoadingNotifier = StateProvider<bool>((ref) => false);
final isUpdatingNotifier = StateProvider<bool>((ref) => false);
final isDeleteModeNotifier = StateProvider<bool>((ref) => false);
final isEditModeNotifier = StateProvider<bool>((ref) => false);
final isOwnerHaveApartmentsNotifier = StateProvider<bool>((ref) => false);
final isVisibleNotifier = StateProvider<bool>((ref) => false);
final isSebhaVisibleNotifier = StateProvider<bool>((ref) => false);

// Apartment type toggles
final isGirlStudentNotifier = StateProvider<bool>((ref) => false);
final isBoyStudentNotifier = StateProvider<bool>((ref) => false);
final isFamiliesNotifier = StateProvider<bool>((ref) => false);
final isAllTypesOfApartmentNotifier = StateProvider<bool>((ref) => false);

// List visibility toggle
final isListOfTypesNotifier = StateProvider<bool>((ref) => false);

