import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/image_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/pop_routes.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../providers/apartment_provider.dart';
import '../../../providers/color_provider.dart';
import '../../../statuses/status_of_apartment/apartment_state.dart';

/// a [ValidatorCreateApartmentNotifier] class has four methods in every method for
/// specific UI, that four methods for every step, that usage to check the fields
/// in every UI, that could not to naviage to another UI until check that fields
/// is true state. that check them if not empty Or check the length is not
/// short in second UI and check the images length is not under of three
///  images and so on so far.
class ValidatorCreateApartmentNotifier extends StateNotifier<ApartmentState> {
  ValidatorCreateApartmentNotifier() : super(ApartmentState());

  void validateFirstStep(WidgetRef ref, BuildContext context) async {
    var addressControllerValue =
        ref.watch(addressController.notifier).state.text;
    var countOfRoomsControllerValue =
        ref.watch(countOfRoomsController.notifier).state.text;
    var countOfBathRoomsControllerValue =
        ref.watch(countOfBathRoomsController.notifier).state.text;

    String? fillField =
        SetLocalization.of(context)?.getTranslateValue("fill_field");
  //  String? addressShouldBeTrue = SetLocalization.of(context)
   //     ?.getTranslateValue("the_address_should_be_true");
    if (addressControllerValue == "") {
      debugPrint("addresssController is empty");
      formAddressKey.currentState?.validate();
      ref.watch(addressValidate.notifier).state = fillField;
      return;
    } else {
      ref.watch(addressValidate.notifier).state = "";
      formAddressKey.currentState?.reset();
    }
    // if (addressControllerValue.length < 10 && addressControllerValue != "") {
    //   debugPrint("addressControllerValue ->$addressControllerValue");
    //   formAddressKey.currentState?.validate();
    //   ref.watch(addressValidate.notifier).state = addressShouldBeTrue;
    //   return;
    // } else {
    //   ref.watch(addressValidate.notifier).state = "";
    //   formAddressKey.currentState?.reset();
    // }
    if (countOfRoomsControllerValue == "" ||
        countOfRoomsControllerValue == "0") {
      formRoomsCountValidateKey.currentState?.validate();
      ref.watch(roomsCountValidate.notifier).state = fillField;
      return;
    } else {
      formRoomsCountValidateKey.currentState?.reset();
    }
    if (countOfBathRoomsControllerValue == "" ||
        countOfBathRoomsControllerValue == "0") {
      formBathRoomsCountValidateKey.currentState?.validate();
      ref.watch(bathRoomsCountValidate.notifier).state = fillField;
      return;
    } else {
      formBathRoomsCountValidateKey.currentState?.reset();
    }
    myPushName(context, MyPagesRoutes.step2);
  }

  void validateSecondStep(WidgetRef ref, BuildContext context) {
    ref
        .read(advantagesNotifier.notifier)
        .fetchAdvantages(chosen: ref.watch(advantagesNotifier).chosen);
  }

  void validateThirdStep(WidgetRef ref, BuildContext context) async {
    var priceControllerValue = ref.watch(priceController.notifier).state.text;
    var countOfStudentControllerValue =
        ref.watch(countOfStudentController.notifier).state.text;
    var squareMetreControllerValue =
        ref.watch(squareMetersController.notifier).state.text;
    String? fillField =
        SetLocalization.of(context)?.getTranslateValue("fill_field");
    if (priceControllerValue == "" || priceControllerValue == "0") {
      formPriceValidateKey.currentState?.validate();
      ref.watch(priceValidate.notifier).state = fillField;
      debugPrint("price validate -> ${ref.read(priceValidate)}");
      return;
    } else {
      ref.watch(priceValidate.notifier).state = "";
      formPriceValidateKey.currentState?.reset();
    }
    if (countOfStudentControllerValue == "" ||
        countOfStudentControllerValue == "0") {
      formStudentCountValidateKey.currentState?.validate();
      ref.watch(studentCountValidate.notifier).state = fillField;
      debugPrint("count student validate -> ${ref.read(studentCountValidate)}");

      return;
    } else {
      formStudentCountValidateKey.currentState?.reset();
    }
    if (squareMetreControllerValue == "") {
      formApartmentSquareMeterValidateKey.currentState?.validate();
      ref.watch(apartmentSquareMeterValidate.notifier).state = fillField;
      debugPrint(
          "square meter validate -> ${ref.read(apartmentSquareMeterValidate)}");
      return;
    } else {
      formBathRoomsCountValidateKey.currentState?.reset();
    }
    myPushName(context, MyPagesRoutes.step4);
  }

  void validateFourthStep(WidgetRef ref, BuildContext context) async {
    var titleControllerValue = ref.watch(titleController.notifier).state.text;
    var descriptionControllerValue =
        ref.watch(descriptionController.notifier).state.text;
    String? fillField =
        SetLocalization.of(context)?.getTranslateValue("fill_field");
    debugPrint(
        "images length -> ${ref.read(imagesFileList.notifier).state.length}");
    if (ref.read(selectedLocationProvider.notifier).state == null) {
      if (ref.read(isDialOpen).value == false) {
        ref.read(isDialOpen.notifier).state.value = true;
      }
      ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
          textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          context: context,
          message: SetLocalization.of(context)!
              .getTranslateValue("please_select_the_location"));

      return;
    }
    if (ref.read(imagesFileList.notifier).state.length < 3) {
      if (ref.read(isDialOpen).value == false) {
        ref.read(isDialOpen.notifier).state.value = true;
      }

      ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
          textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          context: context,
          message: SetLocalization.of(context)!
              .getTranslateValue("should_be_at_least_three_photos"));
      return;
    }
    if (titleControllerValue == "") {
      formTitleValidateKey.currentState?.validate();
      ref.watch(titleValidate.notifier).state = fillField;
      return;
    } else {
      ref.watch(titleValidate.notifier).state = "";
      formTitleValidateKey.currentState?.reset();
    }
    if (descriptionControllerValue == "") {
      formApartmentDescriptionValidateKey.currentState?.validate();
      ref.watch(apartmentDescriptionValidate.notifier).state = fillField;
      return;
    } else {
      formApartmentDescriptionValidateKey.currentState?.reset();
    }
    debugPrint("city -> ${ref.read(cityNotifier).selectedCity}");
    debugPrint("type -> ${ref.read(typesNotifier).selectedType}");
    await ref.read(createApartmentNotifier.notifier).createApartment(
          ref: ref,
          context: context,
        );
    myPopUntilRouteName(context, MyPagesRoutes.main);
  }
}
