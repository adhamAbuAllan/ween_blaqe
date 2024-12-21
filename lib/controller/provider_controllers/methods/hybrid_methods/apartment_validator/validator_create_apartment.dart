import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/pop_routes.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../providers/apartment_provider.dart';
import '../../../statuses/apartment_state.dart';

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
    String? addressShouldBeTrue = SetLocalization.of(context)
        ?.getTranslateValue("the_address_should_be_true");
    if (addressControllerValue == "") {
      debugPrint("addresssController is empty");
      formAddressKey.currentState?.validate();
      ref.watch(addressValidate.notifier).state = fillField;
      return;
    } else {
      ref.watch(addressValidate.notifier).state = "";
      formAddressKey.currentState?.reset();
    }
    if (addressControllerValue.length < 10 && addressControllerValue != "") {
      debugPrint("addressControllerValue ->$addressControllerValue");
      formAddressKey.currentState?.validate();
      ref.watch(addressValidate.notifier).state = addressShouldBeTrue;
      debugPrint("addressValidateText -> addressShouldBeTrue");
    } else {
      ref.watch(addressValidate.notifier).state = "";
      formAddressKey.currentState?.reset();
    }
    if (countOfRoomsControllerValue == "") {
      formRoomsCountValidateKey.currentState?.validate();
      ref.watch(roomsCountValidate.notifier).state = fillField;
      return;
    } else {
      formRoomsCountValidateKey.currentState?.reset();
    }
    if (countOfBathRoomsControllerValue == "") {
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
        .read(advantagesNotifer.notifier)
        .fetchAdvantages(chosen: ref.watch(advantagesNotifer).chosen);
  }

  void validateThirdStep(WidgetRef ref, BuildContext context) async {
    var priceControllerValue = ref.watch(priceController.notifier).state.text;
    var countOfStudentControllerValue =
        ref.watch(countOfStudentController.notifier).state.text;
    var squareMetreControllerValue =
        ref.watch(squareMetersController.notifier).state.text;
    String? fillField =
        SetLocalization.of(context)?.getTranslateValue("fill_field");
    if (priceControllerValue == "") {
      formPriceValidateKey.currentState?.validate();
      ref.watch(priceValidate.notifier).state = fillField;
      debugPrint("price validate -> ${ref.read(priceValidate)}");
      return;
    } else {
      ref.watch(priceValidate.notifier).state = "";
      formPriceValidateKey.currentState?.reset();
    }
    if (countOfStudentControllerValue == "") {
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
myPopUntilRouteName(context, MyPagesRoutes.step1);
  }
}
