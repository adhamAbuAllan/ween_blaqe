import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

class ApartmentModelController extends GetxController {
  OneApartment apartment = OneApartment();
  late String? ownerToken =
      apartmentModelController.apartment.data?[1].owner?.token;
  late String ? apartmentId = '-1';
}
