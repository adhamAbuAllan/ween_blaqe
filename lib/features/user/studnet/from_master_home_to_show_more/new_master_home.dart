import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/models_controller/apartment_model_controller.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/city_state.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/connectivity_state.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/container_types.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/show_list_button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/features/error_widgets/search_not_found.dart';
import 'package:ween_blaqe/session/new_session.dart';

import '../../../../constants/localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/provider_controllers/statuses/apartment_state.dart';

class NewMasterHome extends ConsumerStatefulWidget {
  const NewMasterHome({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState createState() => _NewMasterHomeConsumerState();
}

class _NewMasterHomeConsumerState extends ConsumerState<NewMasterHome> {
  ApartmentState apartmentState = ApartmentState();
  CityState cityState = CityState();

  @override
  void initState() {
    super.initState();
    // ref.read(connectivityNotifier).isSnackBarShown = true;

    widget.scrollController?.addListener(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!apartmentState.isLoading) {
            ref.read(isSebhaVisibleNotifier.notifier).state = true;
          }
          ref.read(isVisibleNotifier.notifier).state = true;
        } else if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!apartmentState.isLoading) {
            ref.read(isSebhaVisibleNotifier.notifier).state = false;
          }
          ref.read(isSebhaVisibleNotifier.notifier).state = false;
        }
      });
    });

    // Fetch apartments initially
    ref.read(isAllTypesOfApartmentNotifier.notifier).state = true;
    ref.read(fetchApartmentNotifier).fetchApartments(
        isOwnerApartments: false,
        ref: ref,
        type: ref.read(apartmentTypeNotifier),
        isAll: true,
        cityId: 0);

    cityState.copyWith(cityId: 0);
  }

  @override
  Widget build(BuildContext context) {
    var type = ref.read(apartmentTypeNotifier);
    var isAll = ref.read(isAllTypesOfApartmentNotifier);
    var cityId = cityState.cityId;
    var cities = cityState.cities;
    var apartmentIsloading = apartmentState.isLoading;
    var errorMessage = apartmentState.errorMessage;
    var apartmentList = apartmentState.apartmentsList;
    var apartmentType = ref.watch(apartmentTypeNotifier);
    // var isSnackBarShow = ref.watch(isSn);
    var isSebhaVisible = ref.watch(isSebhaVisibleNotifier);
    var connectivity = ref.watch(connectivityNotifier);
    var isAllTypesOfApartment = ref.watch(isAllTypesOfApartmentNotifier);
    var isListOfTypes = ref.watch(isListOfTypesNotifier);
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      backgroundColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      displacement: 100 * 3,
      semanticsValue: const Text("refresh").toString(),
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      onRefresh: () async {
        apartmentState.copyWith(isLoading: true);
        ref.read(fetchApartmentNotifier).fetchApartments(
            isOwnerApartments: false,
            ref: ref,
            type: type,
            isAll: isAll,
            cityId: cityId);
      },
      child: apartmentIsloading
          ? errorMessage?.isNotEmpty ?? false
              ? Text(errorMessage ?? "")
              : (apartmentList.data?.isEmpty ?? false)
                  ? TypeNotFound(type: apartmentType)
                  : FutureBuilder(
                      future: Connectivity().checkConnectivity(),
                      builder: (context, snapshot) {
                        if (!connectivity.isSnackBarShown) {
                          ref
                              .watch(connectivityNotifier.notifier)
                              .handleConnectivityChange(context, ref);
                        }
                        if (!connectivity.isResponseOk) {
                          return const NoInternet();
                        }

                        return GestureDetector(
                          onTap: () {
                            ref.read(isSebhaVisibleNotifier.notifier).state =
                                !ref.read(isSebhaVisibleNotifier);
                          },
                          child: Stack(
                              alignment: NewSession.get("language", "ar") ==
                                      "en"
                                          ""
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              children: [
                                ApartmentsList(
                                  haveCitiesBar: true,
                                  onClick: () async {
                                    if (isAllTypesOfApartment) {
                                      ref
                                          .watch(fetchApartmentNotifier)
                                          .fetchApartments(
                                            isOwnerApartments: false,
                                            ref: ref,
                                            isAll: true,
                                            cityId: cityId,
                                          );
                                    } else {
                                      ref
                                          .read(isAllTypesOfApartmentNotifier
                                              .notifier)
                                          .state = true;
                                      ref
                                          .watch(fetchApartmentNotifier)
                                          .fetchApartments(
                                            isOwnerApartments: false,
                                            ref: ref,
                                            isAll: isAllTypesOfApartment,
                                            type: type,
                                            cityId: cityId,
                                          );
                                    }
                                  },
                                  apartmentsRes: apartmentList,
                                  scrollController: widget.scrollController,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, right: 8, left: 8),
                                    child: AnimatedOpacity(
                                      opacity: isSebhaVisible ? 1.0 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: isSebhaVisible
                                          ? ApartmentShowTypesButton(
                                              onPressed: () {
                                                ref
                                                        .watch(
                                                            isListOfTypesNotifier
                                                                .notifier)
                                                        .state !=
                                                    ref.watch(
                                                        isListOfTypesNotifier);
                                              },
                                            )
                                          : const SizedBox(),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 8, right: 8),
                                    child: isListOfTypes
                                        ? AnimatedOpacity(
                                            opacity: isSebhaVisible ? 1.0 : 0.0,
                                            duration: const Duration(
                                                milliseconds: 350),
                                            child:
                                                const ApartmentShowTypesContainer(
                                              child: Column(
                                                children: [
                                                  TypeRowOfBoyStudent(),
                                                  TypeRowOfGirlStudent(),
                                                  TypeRowOfFamilies(),
                                                  TypeRowOfAllTypes(),
                                                ],
                                              ),
                                            ))
                                        : const SizedBox()),
                              ]),
                        );
                      })
          : Stack(
              children: [
                GestureDetector(
                  child: HomeSkeletonWidget(
                    hasCitiesBar: true,
                    scrollController:
                        widget.scrollController ?? ScrollController(),
                  ),
                  onDoubleTap: () {
                    debugPrint("isSebhaVisible");
                    ref.read(isSebhaVisibleNotifier.notifier).state !=
                        ref.read(isSebhaVisibleNotifier.notifier).state;
                    debugPrint("");
                  },
                ),
                apartmentList.data?.isNotEmpty ?? false
                    ? const SizedBox()
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 70, right: 8, left: 8),
                        child: AnimatedOpacity(
                          opacity: isSebhaVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: isSebhaVisible
                              ? ApartmentShowTypesButton(
                                  onPressed: () {
                                    myPushName(
                                        context, MyPagesRoutes.noInternet);
                                  },
                                  text: SetLocalization.of(context)!
                                      .getTranslateValue("tasbih"),
                                )
                              : const SizedBox(),
                        ),
                      ),
              ],
            ),
    );
  }
}
//
// ///
// class NewMasterHome extends StatefulWidget {
//   const NewMasterHome({super.key, this.scrollController});
//
//   final ScrollController? scrollController;
//
//   @override
//   State<NewMasterHome> createState() => _NewMasterHomeState();
// }
//
// class _NewMasterHomeState extends State<NewMasterHome> {
//   ApartmentModelController apartmentModelController = Get.find();
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     connectivityController.isSnackBarShow.value = true;
//     debugPrint("initState in NewMasterHome class ");
//
//     widget.scrollController?.addListener(() {
//       Future.delayed(const Duration(milliseconds: 350), () {
//         if (widget.scrollController?.position.userScrollDirection ==
//             ScrollDirection.forward) {
//           if (!apartmentModelController.isLoading.value) {
//             apartmentModelController.isSebhaVisible.value = true;
//           }
//           apartmentModelController.isVisible.value = true;
//         } else if (widget.scrollController?.position.userScrollDirection ==
//             ScrollDirection.reverse) {
//           if (!apartmentModelController.isLoading.value) {
//             apartmentModelController.isSebhaVisible.value = false;
//           }
//           apartmentModelController.isSebhaVisible.value = false;
//         }
//       });
//     });
//
//     // Fetch apartments initially
//     apartmentModelController.isAllTypesOfApartment.value = true;
//     apartmentModelController.fetchApartments(
//         isOwnerApartments: false,
//         type: apartmentModelController.apartmentType.value,
//         isAll: true,
//         cityId: 0);
//     cityModelController.cityId.value = 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       triggerMode: RefreshIndicatorTriggerMode.anywhere,
//       backgroundColor: themeMode.isLight
//           ? kContainerColorLightMode
//           : kContainerColorDarkMode,
//       displacement: 100 * 3,
//       semanticsValue: const Text("refresh").toString(),
//       color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
//       onRefresh: () async {
//         apartmentModelController.isLoading.value = false;
//         apartmentModelController.fetchApartments(
//             isOwnerApartments: false,
//             isAll: apartmentModelController.isAllTypesOfApartment.value,
//             type: apartmentModelController.apartmentType.value,
//             cityId: cityModelController.cityId.value);
//       },
//       child: Obx(() => !apartmentModelController.isLoading.value
//           ? errorMessage.isNotEmpty
//               ? Text(errorMessage)
//               : (apartmentModelController.apartmentsList.data?.isEmpty ?? false)
//                   ? TypeNotFound(
//                       type: apartmentModelController.apartmentType.value)
//                   : FutureBuilder(
//                       future: Connectivity().checkConnectivity(),
//                       builder: (context, snapshot) {
//                         if (!connectivityController.isSnackBarShow.value) {
//                           connectivityController.handleConnectivityChange(
//                               context, snapshot.data);
//                         }
//                         if (!connectivityController.isConnection()) {
//                           return const NoInternet();
//                         }
//
//                         return GestureDetector(
//                           onTap: () {
//                             apartmentModelController.isSebhaVisible.value =
//                                 !apartmentModelController.isSebhaVisible.value;
//                           },
//                           child: Stack(
//                               alignment: NewSession.get("language", "ar") ==
//                                       "en"
//                                           ""
//                                   ? Alignment.topLeft
//                                   : Alignment.topRight,
//                               children: [
//                                 ApartmentsList(
//                                   haveCitiesBar: true,
//                                   onClick: () async {
//                                     if (apartmentModelController
//                                         .isAllTypesOfApartment.value) {
//                                       apartmentModelController.fetchApartments(
//                                           isOwnerApartments: false,
//                                           isAll: true,
//                                           cityId:
//                                               cityModelController.cityId.value);
//                                     } else {
//                                       apartmentModelController
//                                           .isAllTypesOfApartment.value = false;
//                                       apartmentModelController.fetchApartments(
//                                           isOwnerApartments: false,
//                                           isAll: apartmentModelController
//                                               .isAllTypesOfApartment.value,
//                                           cityId:
//                                               cityModelController.cityId.value,
//                                           type: apartmentModelController
//                                               .apartmentType.value);
//                                     }
//                                   },
//                                   apartmentsRes:
//                                       apartmentModelController.apartmentsList,
//                                   scrollController: widget.scrollController,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 70, right: 8, left: 8),
//                                   child: Obx(() => AnimatedOpacity(
//                                         opacity: apartmentModelController
//                                                 .isSebhaVisible.value
//                                             ? 1.0
//                                             : 0.0,
//                                         duration:
//                                             const Duration(milliseconds: 300),
//                                         child: apartmentModelController
//                                                 .isSebhaVisible.value
//                                             ? ApartmentShowTypesButton(
//                                                 onPressed: () {
//                                                   apartmentModelController
//                                                           .isListOfTypes.value =
//                                                       !apartmentModelController
//                                                           .isListOfTypes.value;
//                                                 },
//                                               )
//                                             : const SizedBox(),
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 70, left: 8, right: 8),
//                                   child: Obx(() => apartmentModelController
//                                           .isListOfTypes.value
//                                       ? AnimatedOpacity(
//                                           opacity: apartmentModelController
//                                                   .isSebhaVisible.value
//                                               ? 1.0
//                                               : 0.0,
//                                           duration:
//                                               const Duration(milliseconds: 350),
//                                           child: Obx(() {
//                                             apartmentModelController
//                                                 .isAllTypesOfApartment.value;
//                                             return const ApartmentShowTypesContainer(
//                                               child: Column(
//                                                 children: [
//                                                   TypeRowOfBoyStudent(),
//                                                   TypeRowOfGirlStudent(),
//                                                   TypeRowOfFamilies(),
//                                                   TypeRowOfAllTypes(),
//                                                 ],
//                                               ),
//                                             );
//                                           }),
//                                         )
//                                       : const SizedBox()),
//                                 ),
//                               ]),
//                         );
//                       })
//           : Stack(
//               children: [
//                 GestureDetector(
//                   child: HomeSkeletonWidget(
//                     hasCitiesBar: true,
//                     scrollController:
//                         widget.scrollController ?? ScrollController(),
//                   ),
//                   onDoubleTap: () {
//                     apartmentModelController.isSebhaVisible.value =
//                         !apartmentModelController.isSebhaVisible.value;
//                   },
//                 ),
//                 apartmentModelController.apartmentsList.data?.isNotEmpty ??
//                         false
//                     ? const SizedBox()
//                     : Padding(
//                         padding:
//                             const EdgeInsets.only(top: 70, right: 8, left: 8),
//                         child: Obx(() => AnimatedOpacity(
//                               opacity:
//                                   apartmentModelController.isSebhaVisible.value
//                                       ? 1.0
//                                       : 0.0,
//                               duration: const Duration(milliseconds: 300),
//                               child: apartmentModelController
//                                       .isSebhaVisible.value
//                                   ? ApartmentShowTypesButton(
//                                       onPressed: () {
//                                         myPushName(
//                                             context, MyPagesRoutes.noInternet);
//                                       },
//                                       text: SetLocalization.of(context)!
//                                           .getTranslateValue("tasbih"),
//                                     )
//                                   : const SizedBox(),
//                             )),
//                       ),
//               ],
//             )),
//     );
//   }
// }
