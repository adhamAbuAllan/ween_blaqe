import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/models_controller/apartment_model_controller.dart';
import '../../core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import '../../core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';

class NewMasterHomeTest extends StatefulWidget {
  const NewMasterHomeTest({super.key});

  @override
  State<NewMasterHomeTest> createState() => _NewMasterHomeTestState();
}

class _NewMasterHomeTestState extends State<NewMasterHomeTest> {
  ApartmentModelController apartmentModelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return apartmentModelController.isLoading.value
          ? const HomeSkeletonWidget()
          : ApartmentsList(
              apartmentsRes: apartmentModelController.apartments.value,
              scrollController: ScrollController());
    });
  }
}
