import 'package:get/get.dart';
import 'package:ween_blaqe/controller/function_controller/api_functions_controller/get_advatages_api.dart';
import 'package:ween_blaqe/controller/function_controller/api_functions_controller/apartment_api_methods_controller.dart';
import 'package:ween_blaqe/controller/models_controller/advantages_model_controller.dart';

import 'bookmark_controller.dart';
import 'function_controller/api_functions_controller/get_city_and_insert_it_in_a_list.dart';
import 'models_controller/apartment_model_controller.dart';
import 'models_controller/images_model_controller.dart';
import 'models_controller/type_of_apartment_models_controller.dart';
GetAdvantages getAdvantages = Get.find();
AdvantagesModelController advantagesModelController = Get.find();
ReadyCityAndApartmentTypeApi readyCityAndTypeOfApartmentApi = Get.find();
TypeOfApartmentModelsController typeOfApartmentModelsController = Get.find();
ApartmentModelController apartmentModelController = Get.find();
MethodsApiApartmentController apiApartmentController = Get.find();
ImagesModelController imagesModelController = Get.find();
 BookmarkController bookmarkController = Get.find();
