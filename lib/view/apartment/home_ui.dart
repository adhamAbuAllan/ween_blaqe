import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';

// import 'package:ween_blaqe/controller/provider_controllers/statuses/connectivity_state.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/view/apartment/type_not_found_ui.dart';
import 'package:ween_blaqe/view/apartment/widgets/sebha_button_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/types_of_apartments_widgets'
    '/show_types_button_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/types_of_apartments_widgets'
    '/types_of_apartment_box_widget.dart';
import 'package:ween_blaqe/session/new_session.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/common_widgets/skeleton_widgets/apartment_skeleton_widgets/skeleton_home_ui.dart';

import '../../../../controller/provider_controllers/statuses/apartment_state.dart';
import 'list_of_apartments.dart';

class HomeUi extends ConsumerStatefulWidget {
  const HomeUi({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState createState() => _HomeUiState();
}

class _HomeUiState extends ConsumerState<HomeUi> {
  ApartmentState apartmentState = ApartmentState();

  @override
  void initState() {
    super.initState();
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //that should make update when fetchApartment of owner is run from api
      // you should to handel that from api
      ref.read(isAllTypesOfApartmentNotifier.notifier).state = true;
      await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
            isOwnerApartments: false,
            isAll: true,
            cityId: 0,
          );
      ref.read(cityNotifier.notifier).getCity();
    });
  }

  @override
  Widget build(BuildContext context) {
    var type = ref.watch(apartmentTypeNotifier.notifier).state;
    // var isAll = ref.read(isAllTypesOfApartmentNotifier);
    var cityId = ref.read(selectedCityIdToFilter.notifier)
        .state;
    final apartmentsState = ref.watch(fetchApartmentNotifier);

    final apartmentsList = apartmentsState.apartmentsList;
    var isAllTypesOfApartment = ref.watch(isAllTypesOfApartmentNotifier);
    return FutureBuilder(
        future: Connectivity().checkConnectivity(),
        builder: (context, snapshot) {
          if (ref.watch(connectivityNotifier).isSnackBarShown) {
            ref
                .watch(connectivityNotifier.notifier)
                .handleConnectivityChange(context, ref);
          }
// make a scetion , that to check if list of apartment is null and the
// intrent is not connection
          return ref.watch(fetchApartmentNotifier).isLoading
              ? Stack(
                  children: [
                    GestureDetector(
                      child: SkeletonHomeUi(
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
                    apartmentsList.data?.isEmpty ?? false
                        ? const SizedBox()
                        : const SebhaButtonWidget(),
                  ],
                )
              : (apartmentsList.data?.isEmpty ?? false
                  ? TypeNotFoundUi(
                      type: type,
                    )
                  : RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      backgroundColor: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
                      displacement: 100 * 3,
                      semanticsValue: const Text("refresh").toString(),
                      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
                      onRefresh: () async {

                        ref.read(isAllTypesOfApartmentNotifier.notifier).state =
                            true;
                        ref.read(selectedCityIdToFilter.notifier)
                            .state = 0;
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await ref
                              .read(fetchApartmentNotifier.notifier)
                              .fetchApartments(
                                  isOwnerApartments: false,
                                  isAll: true,
                                  cityId: 0);
                        });
                        ref.read(isBoyStudentNotifier.notifier).state = false;
                        ref.read(isGirlStudentNotifier.notifier).state = false;
                        ref.read(isFamiliesNotifier.notifier).state = false;
                      },
                      child: GestureDetector(
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
                                // const ApartmentsListConsumer(),

                                ApartmentsListWidget(
                                  haveCitiesBar: true,
                                  onClick: () async {

                                    if (isAllTypesOfApartment) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) async {
                                        await ref
                                            .watch(
                                                fetchApartmentNotifier.notifier)
                                            .fetchApartments(
                                              isOwnerApartments: false,
                                              isAll: true,
                                              cityId: cityId,
                                            );
                                      });
                                    } else {
                                      ref
                                          .read(isAllTypesOfApartmentNotifier
                                              .notifier)
                                          .state = true;
                                      ref
                                          .watch(
                                              fetchApartmentNotifier.notifier)
                                          .fetchApartments(
                                            isOwnerApartments: false,
                                            isAll: isAllTypesOfApartment,
                                            type: type,
                                            cityId: cityId,
                                          );
                                    }
                                  },
                                  apartmentsRes: apartmentsList,
                                  // ref.watch
                                  //   (fetchApartmentNotifier).apartmentsList,
                                  scrollController: widget.scrollController,
                                ), // list of apartments
                                if (!ref
                                    .watch(connectivityNotifier.notifier)
                                    .isConnected)
                                  const SebhaButtonWidget()
                                else
                                  const ShowTypesButtonWidget(),
                                const ShowApartmentTypesBoxWidget() // list of types
                              ]))));
        });
  }
}
