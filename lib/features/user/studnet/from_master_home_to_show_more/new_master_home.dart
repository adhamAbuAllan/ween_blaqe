import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/models_controller/apartment_model_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/container_types.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/show_list_button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/features/error_widgets/search_not_found.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';

import '../../../../constants/localization.dart';

// }

class NewMasterHome extends StatefulWidget {
  const NewMasterHome({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  State<NewMasterHome> createState() => _NewMasterHomeState();
}

class _NewMasterHomeState extends State<NewMasterHome> {
  ApartmentModelController apartmentModelController = Get.find();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    connectivityController.isSnackBarShow.value = true;
    debugPrint("initState in NewMasterHome class ");

    widget.scrollController?.addListener(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!apartmentModelController.isLoading.value) {
            apartmentModelController.isSebhaVisible.value = true;
          }
          apartmentModelController.isVisible.value = true;
        } else if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!apartmentModelController.isLoading.value) {
            apartmentModelController.isSebhaVisible.value = false;
          }
          apartmentModelController.isSebhaVisible.value = false;
        }
      });
    });

    // Fetch apartments initially
    apartmentModelController.isAllTypesOfApartment.value = true;
    apartmentModelController.fetchApartments(
        isOwnerApartments: false,
        type: apartmentModelController.apartmentType.value,
        isAll: true,
        cityId: 0);
    cityModelController.cityId.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      backgroundColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      displacement: 100 * 3,
      semanticsValue: const Text("refresh").toString(),
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      onRefresh: () async {
        apartmentModelController.isLoading.value = false;
        apartmentModelController.fetchApartments(
            isOwnerApartments: false,
            isAll: apartmentModelController.isAllTypesOfApartment.value,
            type: apartmentModelController.apartmentType.value,
            cityId: cityModelController.cityId.value);
      },
      child: Obx(() => !apartmentModelController.isLoading.value
          ? errorMessage.isNotEmpty
          ? Text(errorMessage)
          : (apartmentModelController.apartmentsList.data?.isEmpty ?? false)
          ? TypeNotFound(type: apartmentModelController.apartmentType.value)
          : FutureBuilder(
          future: Connectivity().checkConnectivity(),
          builder: (context, snapshot) {
            if (!connectivityController.isSnackBarShow.value) {
              connectivityController.handleConnectivityChange(
                  context, snapshot.data);
            }
            if (!connectivityController.isConnection()) {
              return const NoInternet();
            }

            return GestureDetector(
              onTap: () {
                apartmentModelController.isSebhaVisible.value =
                !apartmentModelController.isSebhaVisible.value;
              },
              child: Stack(alignment: NewSession.get("language", "ar") == "en"
                  ""  ? Alignment.topLeft:
                  Alignment.topRight,
                  children: [
                ApartmentsList(
                  haveCitiesBar: true,
                  onClick: () async {
                    if (apartmentModelController
                        .isAllTypesOfApartment.value) {
                      apartmentModelController.fetchApartments(
                          isOwnerApartments: false,
                          isAll: true,
                          cityId: cityModelController.cityId.value);
                    } else {
                      apartmentModelController.isAllTypesOfApartment.value = false;
                      apartmentModelController.fetchApartments(
                          isOwnerApartments: false,
                          isAll: apartmentModelController.isAllTypesOfApartment.value,
                          cityId: cityModelController.cityId.value,
                          type: apartmentModelController.apartmentType.value);
                    }
                  },
                  apartmentsRes: apartmentModelController.apartmentsList,
                  scrollController: widget.scrollController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, right: 8, left: 8),
                  child: Obx(() => AnimatedOpacity(
                    opacity: apartmentModelController.isSebhaVisible.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: apartmentModelController.isSebhaVisible.value
                        ? ApartmentShowTypesButton(
                      onPressed: () {
                        apartmentModelController.isListOfTypes.value =
                        !apartmentModelController.isListOfTypes.value;
                      },
                    )
                        : const SizedBox(),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 8, right: 8),
                  child: Obx(() => apartmentModelController.isListOfTypes.value
                      ? AnimatedOpacity(
                    opacity: apartmentModelController.isSebhaVisible.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 350),
                    child: Obx(() {
                      apartmentModelController.isAllTypesOfApartment.value;
                      return  const ApartmentShowTypesContainer(
                        child: Column(
                          children: [
                            TypeRowOfBoyStudent(),
                            TypeRowOfGirlStudent(),
                            TypeRowOfFamilies(),
                            TypeRowOfAllTypes(),
                          ],
                        ),
                      );
                    }),
                  )
                      : const SizedBox()),
                ),
              ]),
            );
          })
          : Stack(
        children: [
          GestureDetector(
            child: HomeSkeletonWidget(
              hasCitiesBar: true,
              scrollController: widget.scrollController ?? ScrollController(),
            ),
            onDoubleTap: () {
              apartmentModelController.isSebhaVisible.value =
              !apartmentModelController.isSebhaVisible.value;
            },
          ),
          apartmentModelController.apartmentsList.data?.isNotEmpty??false ?
          const SizedBox
            (): Padding(
            padding: const EdgeInsets.only(top: 70, right: 8, left: 8),
            child: Obx(() => AnimatedOpacity(
              opacity: apartmentModelController.isSebhaVisible.value ? 1.0 :
              0.0,
              duration: const Duration(milliseconds: 300),
              child:  apartmentModelController.isSebhaVisible.value
                  ? ApartmentShowTypesButton(
                onPressed: () {
                  myPushName(context, MyPagesRoutes.noInternet);
                },
                text: SetLocalization.of(context)!.getTranslateValue("tasbih"),
              )
                  : const SizedBox(),
            )),
          ),
        ],
      )),
    );
  }
}
