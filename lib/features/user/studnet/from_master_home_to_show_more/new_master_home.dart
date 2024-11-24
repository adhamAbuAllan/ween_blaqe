import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/city_state.dart';
// import 'package:ween_blaqe/controller/provider_controllers/statuses/connectivity_state.dart';
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
    debugPrint("isLoading status ${apartmentState.isLoading}");

    // ref.read(connectivityNotifier).isSnackBarShown = true;

    widget.scrollController?.addListener(() {
      Future.delayed(const Duration(milliseconds: 350), () {
        if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!apartmentState.isLoading) {
            ref.watch(isSebhaVisibleNotifier.notifier).state = true;
          }
          ref.watch(isVisibleNotifier.notifier).state = true;
        } else if (widget.scrollController?.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!apartmentState.isLoading) {
            ref.watch(isSebhaVisibleNotifier.notifier).state = false;
          }
          ref.watch(isSebhaVisibleNotifier.notifier).state = false;
        }
      });
    });

    // Fetch apartments initially
    // ref.read(isAllTypesOfApartmentNotifier.notifier).state = true;

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
          isOwnerApartments: false,
          ref: ref,
          type: ref.read(apartmentTypeNotifier),
          isAll: true,
          cityId: 0);
      debugPrint("isLoading status ${apartmentState.isLoading}");
    });

    // ref.read(fetchApartmentNotifier)?.fetchApartments(
    //     isOwnerApartments: false,
    //     ref: ref,
    //     type: ref.read(apartmentTypeNotifier),
    //     isAll: true,
    //     cityId: 0);
    // debugPrint("isLoading status ${apartmentState.isLoading}");
  }

  @override
  Widget build(BuildContext context) {
    var type = ref.watch(apartmentTypeNotifier.notifier).state;
    var isAll = ref.read(isAllTypesOfApartmentNotifier);
    var cityId = cityState.cityId;
    var errorMessage = apartmentState.errorMessage;
    var apartmentList = ref.watch(apartmentsListNotifier);

    var apartmentType = ref.watch(apartmentTypeNotifier);
    // var isSnackBarShow = ref.watch(isSn);
    var isBoxVisible = ref.watch(isSebhaVisibleNotifier);
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
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        onRefresh: () async {
          ref.read(fetchApartmentNotifier.notifier).fetchApartments(
              isOwnerApartments: false,
              ref: ref,
              type: type,
              isAll: isAll,
              cityId: cityId);
        },
        child: ref.watch(fetchApartmentNotifier).isLoading
            ? Stack(
                children: [
                  GestureDetector(
                    child: HomeSkeletonWidget(
                      hasCitiesBar: true,
                      scrollController:
                          widget.scrollController ?? ScrollController(),
                    ),
                    onDoubleTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        await ref
                            .read(fetchApartmentNotifier.notifier)
                            .fetchApartments(
                                isOwnerApartments: false,
                                ref: ref,
                                type: ref.read(apartmentTypeNotifier),
                                isAll: true,
                                cityId: 0);
                        debugPrint(
                            "isLoading status ${apartmentState.isLoading}");
                      });
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
                            opacity: isBoxVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: isBoxVisible
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
              )
            : (
            apartmentList.data?.isEmpty??false ?
                TypeNotFound(type: type,)
                :
            (GestureDetector(
                onTap: () {
                  ref.read(isSebhaVisibleNotifier.notifier).state =
                      !ref.read(isSebhaVisibleNotifier);
                },
                child: FutureBuilder(
                    future: Connectivity().checkConnectivity(),
                    builder: (context, snapshot) {
                      if (ref.watch(connectivityNotifier).isSnackBarShown) {
                        ref
                            .read(connectivityNotifier.notifier)
                            .handleConnectivityChange(context, ref);
                      }
                      if (ref
                          .watch(connectivityNotifier.notifier)
                          .isConnected) {
                        return const NoInternet();
                      }

                      return Stack(
                          alignment: NewSession.get("language", "ar") ==
                                  "en"
                                      ""
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          children: [
                            // const ApartmentsListConsumer(),

                            ApartmentsList(
                              haveCitiesBar: true,
                              onClick: () async {
                                if (isAllTypesOfApartment) {
                                  ref
                                      .watch(fetchApartmentNotifier.notifier)
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
                                      .watch(fetchApartmentNotifier.notifier)
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
                              // ref.watch
                              //   (fetchApartmentNotifier).apartmentsList,
                              scrollController: widget.scrollController,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 70, right: 8, left: 8),
                                child: AnimatedOpacity(
                                  opacity: isBoxVisible ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: isBoxVisible
                                      ? ApartmentShowTypesButton(
                                          onPressed: () {
                                            ref
                                                    .read(isListOfTypesNotifier
                                                        .notifier)
                                                    .state =
                                                !ref
                                                    .read(isListOfTypesNotifier
                                                        .notifier)
                                                    .state;
                                          },
                                        )
                                      : const SizedBox(),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 70, left: 8, right: 8),
                                child: isListOfTypes
                                    ? AnimatedOpacity(
                                        opacity: isBoxVisible ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 350),
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
                          ]);
                    }))))
        // !ref.watch(fetchApartmentNotifier).isLoading
        //     ? (errorMessage?.isNotEmpty ?? true
        //         ? Text(errorMessage ?? "")
        //         : (apartmentList.data?.isEmpty ?? false)
        //             ? TypeNotFound(type: apartmentType)
        //             : FutureBuilder(
        //                 future: Connectivity().checkConnectivity(),
        //                 builder: (context, snapshot) {
        //                   if (!connectivity.isSnackBarShown) {
        //                     ref
        //                         .watch(connectivityNotifier.notifier)
        //                         .handleConnectivityChange(context, ref);
        //                   }
        //                   if (!connectivity.isResponseOk) {
        //                     return const NoInternet();
        //                   }
        //
        //                   return GestureDetector(
        //                     onTap: () {
        //                       ref.read(isSebhaVisibleNotifier.notifier).state =
        //                           !ref.read(isSebhaVisibleNotifier);
        //                     },
        //                     child: Stack(
        //                         alignment: NewSession.get("language", "ar") ==
        //                                 "en"
        //                                     ""
        //                             ? Alignment.topLeft
        //                             : Alignment.topRight,
        //                         children: [
        //                           // const ApartmentsListConsumer(),
        //
        //                           ApartmentsList(
        //                             haveCitiesBar: true,
        //                             onClick: () async {
        //                               if (isAllTypesOfApartment) {
        //                                 ref
        //                                     .watch(
        //                                         fetchApartmentNotifier.notifier)
        //                                     .fetchApartments(
        //                                       isOwnerApartments: false,
        //                                       ref: ref,
        //                                       isAll: true,
        //                                       cityId: cityId,
        //                                     );
        //                               } else {
        //                                 ref
        //                                     .read(isAllTypesOfApartmentNotifier
        //                                         .notifier)
        //                                     .state = true;
        //                                 ref
        //                                     .watch(
        //                                         fetchApartmentNotifier.notifier)
        //                                     .fetchApartments(
        //                                       isOwnerApartments: false,
        //                                       ref: ref,
        //                                       isAll: isAllTypesOfApartment,
        //                                       type: type,
        //                                       cityId: cityId,
        //                                     );
        //                               }
        //                             },
        //                             apartmentsRes: apartmentList,
        //                             // ref.watch
        //                             //   (fetchApartmentNotifier).apartmentsList,
        //                             scrollController: widget.scrollController,
        //                           ),
        //                           Padding(
        //                               padding: const EdgeInsets.only(
        //                                   top: 70, right: 8, left: 8),
        //                               child: AnimatedOpacity(
        //                                 opacity: isBoxVisible ? 1.0 : 0.0,
        //                                 duration:
        //                                     const Duration(milliseconds: 300),
        //                                 child: isBoxVisible
        //                                     ? ApartmentShowTypesButton(
        //                                         onPressed: () {
        //                                           ref
        //                                                   .watch(
        //                                                       isListOfTypesNotifier
        //                                                           .notifier)
        //                                                   .state !=
        //                                               ref.watch(
        //                                                   isListOfTypesNotifier);
        //                                         },
        //                                       )
        //                                     : const SizedBox(),
        //                               )),
        //                           Padding(
        //                               padding: const EdgeInsets.only(
        //                                   top: 70, left: 8, right: 8),
        //                               child: isListOfTypes
        //                                   ? AnimatedOpacity(
        //                                       opacity: isBoxVisible ? 1.0 : 0.0,
        //                                       duration: const Duration(
        //                                           milliseconds: 350),
        //                                       child:
        //                                           const ApartmentShowTypesContainer(
        //                                         child: Column(
        //                                           children: [
        //                                             TypeRowOfBoyStudent(),
        //                                             TypeRowOfGirlStudent(),
        //                                             TypeRowOfFamilies(),
        //                                             TypeRowOfAllTypes(),
        //                                           ],
        //                                         ),
        //                                       ))
        //                                   : const SizedBox()),
        //                         ]),
        //                   );
        //                 }))
        //     : Stack(
        //         children: [
        //           GestureDetector(
        //             child: HomeSkeletonWidget(
        //               hasCitiesBar: true,
        //               scrollController:
        //                   widget.scrollController ?? ScrollController(),
        //             ),
        //             onDoubleTap: () {
        //               WidgetsBinding.instance.addPostFrameCallback((_) async {
        //                 await ref
        //                     .read(fetchApartmentNotifier.notifier)
        //                     .fetchApartments(
        //                         isOwnerApartments: false,
        //                         ref: ref,
        //                         type: ref.read(apartmentTypeNotifier),
        //                         isAll: true,
        //                         cityId: 0);
        //                 debugPrint(
        //                     "isLoading status ${apartmentState.isLoading}");
        //               });
        //               ref.read(isSebhaVisibleNotifier.notifier).state !=
        //                   ref.read(isSebhaVisibleNotifier.notifier).state;
        //               debugPrint("");
        //             },
        //           ),
        //           apartmentList.data?.isNotEmpty ?? false
        //               ? const SizedBox()
        //               : Padding(
        //                   padding:
        //                       const EdgeInsets.only(top: 70, right: 8, left: 8),
        //                   child: AnimatedOpacity(
        //                     opacity: isBoxVisible ? 1.0 : 0.0,
        //                     duration: const Duration(milliseconds: 300),
        //                     child: isBoxVisible
        //                         ? ApartmentShowTypesButton(
        //                             onPressed: () {
        //                               myPushName(
        //                                   context, MyPagesRoutes.noInternet);
        //                             },
        //                             text: SetLocalization.of(context)!
        //                                 .getTranslateValue("tasbih"),
        //                           )
        //                         : const SizedBox(),
        //                   ),
        //                 ),
        //         ],
        //       ),
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
