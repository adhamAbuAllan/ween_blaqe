import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/local_methods/location_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/map_state.dart';
import 'package:ween_blaqe/view/apartment/widgets/map_widgets/app_bar_map_widget.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets/container_widget.dart';

import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/containers_widgets/container_load_widget.dart';

class MapUi extends ConsumerStatefulWidget {
  const   MapUi({
    super.key,
    this.oneApartment,
  });

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _MapUiState();
}

class _MapUiState extends ConsumerState<MapUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final mapStateNotifier = ref.read(mapStateProvider.notifier);
      await ref
          .read(locationNotifier.notifier)
          .loadMapStyle(context: context, ref: ref);
      mapStateNotifier.updateMapStyle(ref.read(mapStateProvider).mapStyle);

      mapStateNotifier.updateMapStyle(ref.read(mapStateProvider).mapStyle);
      if (widget.oneApartment != null) {
        debugPrint("latitude : ${widget.oneApartment?.latitude ?? 0.0}");
        debugPrint("longitude : ${widget.oneApartment?.longitude ?? 0.0}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapStateProvider);
    final locationNoti = ref.read(locationNotifier.notifier);
    final streamController = ref.watch(streamMapPositionController);
    final selectedLocation = ref.read(selectedLocationProvider.notifier).state;

    return widget.oneApartment != null
        ? MapShowModeWidget(
            oneApartment: widget.oneApartment!,
          )
        : MapSelectModeUi(
            selectedLocation: selectedLocation,
            ref: ref,
            mapState: mapState,
            locationNoti: locationNoti,
            streamController: streamController);
  }
}

class MapSelectModeUi extends StatelessWidget {
  const MapSelectModeUi({
    super.key,
    required this.selectedLocation,
    required this.ref,
    required this.mapState,
    required this.locationNoti,
    required this.streamController,
  });

  final LatLng? selectedLocation;
  final WidgetRef ref;
  final MapState mapState;
  final LocationNotifier locationNoti;
  final StreamController<String> streamController;
  final double latitude = 31.904070339860116;
  final double longitude = 35.203478970904236;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMapWidget(selectedLocation: selectedLocation),
      body: Stack(
        children: [
          GoogleMap(
            style: ref.watch(mapStateProvider).mapStyle,
            onMapCreated: (controller) {
              ref.read(mapStateProvider.notifier).setMapController(controller);
            },
            markers: mapState.markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 14,
            ),
            mapType: MapType.normal,
            onTap: (position) {
              locationNoti.onMapTap(
                  position: position, context: context, ref: ref);

              // Update the stream with the selected location
              streamController.add('Location has been selected');
            },
          ),

          // Floating box with StreamBuilder
          StreamBuilder<String>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 70),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: selectedLocation == null ? 1.0 : 0.0,
                      duration: const Duration(seconds: 5),
                      child: ContainerWidget(
                        horizontalPadding: 10,
                        child: Text(
                          " ${selectedLocation == null ? snapshot.data ?? "${SetLocalization.of(context)!.getTranslateValue("select_the_location_on_the_map")} " : SetLocalization.of(context)!.getTranslateValue("the_location_has_been_selected")}",
                          style: TextStyle(
                            fontSize: 15,
                            color: ref
                                .read(themeModeNotifier.notifier)
                                .textTheme(ref: ref),
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MapShowModeWidget extends ConsumerStatefulWidget {
  const MapShowModeWidget({
    super.key,
    required this.oneApartment,
  });

  final DataOfOneApartment oneApartment;

  @override
  ConsumerState createState() => _MapShowModeWidgetState();
}

class _MapShowModeWidgetState extends ConsumerState<MapShowModeWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerLoadWidget(
      textStyle: TextStyle(
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
        fontWeight: FontWeight.w600,
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
      ),
      title: SetLocalization.of(context)!.getTranslateValue("the_map"),
      isLoading: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.0)),
        child: SizedBox(
          height: 360,
          child: GoogleMap(
            onMapCreated: (controller) async {
              ref.read(mapStateProvider.notifier).setMapController(controller);
            },
            style: ref.watch(mapStateProvider).mapStyle,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.oneApartment.latitude?.toDouble() ?? 0.0,
                  widget.oneApartment.longitude?.toDouble() ?? 0.0),
              zoom: 14,
            ),
            markers: apartmentLocationMark(),
          ),
        ),
      ),
    );
  }

  Set<Marker> apartmentLocationMark() {
    return {
      Marker(
        markerId: const MarkerId("fixed_marker"),
        position: LatLng(widget.oneApartment.latitude?.toDouble() ?? 0.0,
            widget.oneApartment.longitude?.toDouble() ?? 0.0),
        infoWindow: InfoWindow(
            title: ""
                "${widget.oneApartment.city?.name!} - "
                "${widget.oneApartment.location!}"),
        draggable: false, // This makes the marker non-draggable
      )
    };
  }
}
