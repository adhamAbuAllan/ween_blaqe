import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/api_methods/apartment_methods/fetch_apartments_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/api_methods/apartment_methods/cities_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/api_methods/apartment_methods/type_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/local_methods/check_update_apartment_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/city_state.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/type_state.dart';
import '../../../api/apartments_api/apartments.dart';
import '../../../api/cities.dart';
import '../methods/api_methods/apartment_methods/create_apartment_notifier.dart';
import '../methods/api_methods/apartment_methods/delete_apartment_notifier.dart';
import '../methods/api_methods/apartment_methods/advantages_notifier.dart';
import '../methods/api_methods/apartment_methods/update_apartment_notifier.dart';
import '../methods/hybrid_methods/apartment_validator/validator_create_apartment.dart';
import '../methods/hybrid_methods/bookmarker.dart';
import '../methods/local_methods/image_slider_notifier.dart';
import '../methods/local_methods/toggle_owner_buttons_notifier.dart';
import '../statuses/advantage_state.dart';
import '../statuses/apartment_state.dart';
import '../statuses/bookmark_state.dart';
import '../statuses/update_apartment_state.dart';

/// Extension for [firstWhereOrNull] usage in [getApartmentsFromBookmarks] method in [bookmaker.dart]
extension FirstWhereOrNull<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

final fetchApartmentNotifier =
    StateNotifierProvider<FetchApartmentsNotifier, ApartmentState>(
        (ref) => FetchApartmentsNotifier());
final deleteApartmentNotifier =
    StateNotifierProvider<DeleteApartmentNotifier, ApartmentState>(
        (ref) => DeleteApartmentNotifier());
final toggleOwnerButtonsNotifier =
    StateNotifierProvider<ToggleOwnerButtonsNotifier, UpdateApartmentState>(
        (ref) => ToggleOwnerButtonsNotifier());
final advantagesNotifier =
    StateNotifierProvider<AdvantagesNotifier, AdvantageState>(
  (ref) => AdvantagesNotifier(),
);

final cityNotifier = StateNotifierProvider<CityNotifier, CityState>(
  (ref) => CityNotifier(),
);
final typesNotifier =
    StateNotifierProvider<TypeNotifier, TypeState>((ref) => TypeNotifier());

final bookmarkNotifier =
    StateNotifierProvider<BookmarkNotifier, BookmarkState>((ref) {
  return BookmarkNotifier();
});
final isApartmentDataChangedNotifier =
    StateNotifierProvider<ApartmentDataChangedCheckerNotifier, bool>(
        (ref) => ApartmentDataChangedCheckerNotifier());
// Provider for the ApartmentStateNotifier
final imageSliderNotifier =
    StateNotifierProvider<ImageSliderNotifier, Map<int, ApartmentState>>(
  (ref) => ImageSliderNotifier(),
);
final updateApartmentNotifier =
    StateNotifierProvider<UpdateApartmentNotifier, ApartmentState>(
  (ref) => UpdateApartmentNotifier(),
);
final createApartmentNotifier = StateNotifierProvider<CreateApartmentNotifier
, ApartmentState>((ref)
=>CreateApartmentNotifier());
final validatorCreateApartmentNotifier =
    StateNotifierProvider<ValidatorCreateApartmentNotifier,ApartmentState>((ref)
=>ValidatorCreateApartmentNotifier());
// CarouselSliderController
final carouselSliderControllerNotifier =
    Provider<CarouselSliderController>((ref) {
  return CarouselSliderController();
});
final pageControllerNotifier = Provider<PageController>((ref) {
  return PageController();
});

final ownerTokenNotifier = Provider<String?>((ref) {
  final apartmentsList = ref.watch(apartmentsOfOwnerNotifier).data;
  return apartmentsList?[1].owner?.token;
});
final addressController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final countOfRoomsController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final countOfBathRoomsController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final priceController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final countOfStudentController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final squareMetersController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final titleController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final descriptionController = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(
      () => controller.dispose()); // Dispose when the provider is disposed
  return controller;
});
final apartmentsListNotifier = StateProvider<Apartments>((ref) => Apartments());
var apartmentBookmarkedNotifier =
    StateProvider<Apartments>((ref) => Apartments(data: []));
final apartmentsOfOwnerNotifier =
    StateProvider<Apartments>((ref) => Apartments(data: []));

final apartmentTypeNotifier = StateProvider<String>((ref) => 'طلاب');
final errorMessageNotifier = StateProvider<String>((ref) => '');
final apartmentIdNotifier = StateProvider<dynamic>((ref) => '-1');

final apartmentLengthOfOwnerProvider = StateProvider<int>((ref) => 0);
final currentPhotoIndex = StateProvider<int>((ref) => 0);
final selectedCityId = StateProvider<int>((ref) => 1);
final selectedCityIdToFilter = StateProvider<int>((ref) => 0);
final selectedTypeId = StateProvider<int>((ref) => 1);

final cityList = StateProvider<List<City>>((ref) => []);
final photoWillDeleteIds = StateProvider<List<int>>((ref) => []);
final advantagesApi = StateProvider<List<int>>((ref) => []);

final isLoadingNotifier = StateProvider<bool>((ref) => false);
final isUpdatingNotifier = StateProvider<bool>((ref) => false);
final isEditModeNotifier = StateProvider<bool>((ref) => false);
final isVisibleNotifier = StateProvider<bool>((ref) => false);
final isSebhaVisibleNotifier = StateProvider<bool>((ref) => false);
final isGirlStudentNotifier = StateProvider<bool>((ref) => false);
final isBoyStudentNotifier = StateProvider<bool>((ref) => false);
final isFamiliesNotifier = StateProvider<bool>((ref) => false);
final isListOfTypesNotifier = StateProvider<bool>((ref) => false);
final roomSizeChangeProvider = StateProvider<bool>((ref) => false);
final bathSizeChangeProvider = StateProvider<bool>((ref) => false);
final areaSizeChangeProvider = StateProvider<bool>((ref) => false);
final isApartmentsListEmpty = StateProvider<bool>((ref) => false);
final hasChanged = StateProvider<bool>((ref) => false);
final isApartmentUpdatedNotifier = StateProvider<bool>((ref) => false);
final badResponse = StateProvider<bool>((ref) => false);
final isAllTypesOfApartmentNotifier = StateProvider<bool>((ref) => false);

final currentPhotoIndexNotifier =
    StateProvider.family<int, int>((ref, apartmentId) {
  return 0; // Default value
});
final addressValidate = StateProvider<String?>((ref) => null);
final roomsCountValidate = StateProvider<String?>((ref) => null);
final bathRoomsCountValidate = StateProvider<String?>((ref) => null);
final priceValidate = StateProvider<String?>((ref) => null);
final studentCountValidate = StateProvider<String?>((ref) => null);
final apartmentSquareMeterValidate = StateProvider<String?>((ref) => null);
final titleValidate = StateProvider<String?>((ref) => null);
final apartmentDescriptionValidate = StateProvider<String?>((ref) => null);

final formAddressKey = GlobalKey<FormState>();
final formRoomsCountValidateKey = GlobalKey<FormState>();
final formBathRoomsCountValidateKey = GlobalKey<FormState>();
final formPriceValidateKey = GlobalKey<FormState>();
final formStudentCountValidateKey = GlobalKey<FormState>();
final formApartmentSquareMeterValidateKey = GlobalKey<FormState>();
final formTitleValidateKey = GlobalKey<FormState>();
final formApartmentDescriptionValidateKey = GlobalKey<FormState>();
