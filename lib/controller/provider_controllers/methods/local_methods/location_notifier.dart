
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, WidgetRef;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/localization.dart';
import '../../../../constants/strings.dart';
import '../../../../session/new_session.dart';

import '../../providers/apartment_provider.dart';
import '../../statuses/status_of_apartment/map_state.dart';

class LocationNotifier extends StateNotifier<LatLng?> {
  LocationNotifier() : super(null);

/*
async {
                LocationPermission permission =
                    await Geolocator.checkPermission();

                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                }

                if (permission == LocationPermission.denied ||
                    permission == LocationPermission.deniedForever) {
                  debugPrint('Location permissions are denied');
                  return;
                }

                LocationSettings locationSettings = LocationSettings(
                  accuracy: LocationAccuracy.high,
                  // Specify the desired accuracy here
                  distanceFilter:
                      0,
                );

                Position position = await Geolocator.getCurrentPosition(
                    locationSettings: locationSettings);
                debugPrint(
                    'Current location: Lat: ${position.latitude}, Lon: ${position.longitude}');
              }
 */

  // The state variables will be managed by MapState
  void moveToCurrentLocation(BuildContext context, WidgetRef ref) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    final currentLatLng = LatLng(position.latitude, position.longitude);

    // Save location to SharedPreferences
    await NewSession.save(PrefKeys.lastLat, currentLatLng.latitude);
    await NewSession.save(PrefKeys.lastLng, currentLatLng.longitude);

    final mapState = ref.read(mapStateProvider.notifier);
    mapState.setMapControllerAndUpdateMarkers(currentLatLng, context);

    state = currentLatLng;
  }

  void onMapTap(
      {required LatLng position,
      required BuildContext context,
      required WidgetRef ref}) {
    final mapState = ref.read(mapStateProvider.notifier);
    mapState.updateMarkersOnTap(position, context, ref);
    state = position; // Update the state directly
  }

  Future<void> loadLastLocation(BuildContext context, WidgetRef ref) async {

    double latitude = 31.904070339860116;
    double longitude = 35.203478970904236;

    double lastLat =
        NewSession.get(PrefKeys.lastLat, latitude); // Default location
    double lastLng = NewSession.get(PrefKeys.lastLng, longitude);
    if (lastLat != latitude && lastLng != longitude) {
      state = LatLng(lastLat, lastLng);
      final mapState = ref.read(mapStateProvider.notifier);
      mapState.setMapControllerAndUpdateMarkers(state!, context);
    } else {
      moveToCurrentLocation(context, ref);
    }

  }

  Future<void> loadMapStyle(
      {required BuildContext context, required WidgetRef ref}) async {

    final String style = ref.watch(themeModeNotifier.notifier).isLightMode
        ? ""
        : await DefaultAssetBundle.of(context)
            .loadString('assets/map_style.json');

    final mapState = ref.read(mapStateProvider.notifier);
    mapState.updateMapStyle(style);
  }
}

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier()
      : super(MapState(
            markers: {},
            mapController: null,
            mapStyle: "",
            loadingLocation: false,
            didServiceLocationEnabled: false));

  Future<void> getUserLocation({
    required WidgetRef ref,
  }) async {
    state = state.copyWith(loadingLocation: true);

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        state = state.copyWith(
            didServiceLocationEnabled: false, loadingLocation: false);
        debugPrint('Location permissions are denied');
      }
    } else {
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        // Specify the desired accuracy here
        distanceFilter: 0,
      );
      state = state.copyWith(
          userPosition: await Geolocator.getCurrentPosition(
              locationSettings: locationSettings));
      debugPrint('Current location: Lat: ${state.userPosition?.latitude}, Lon: '
          '${state.userPosition?.longitude}');

      // ref.read(didPositionProviderNull.notifier).state = false;
      state = state.copyWith(
          didServiceLocationEnabled: true,
          userPosition: state.userPosition,
          loadingLocation: false);
    }

    ;
    //final updatePhoneValidate = StateProvider<String?>((ref) => null);
  }

  // Update markers
  void updateMarkers(Set<Marker> markers) {
    state = state.copyWith(markers: markers);
  }

  // Set or update the map controller and animate to the location
  void setMapControllerAndUpdateMarkers(LatLng position, BuildContext context) {
    if (state.mapController != null) {
      state.mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 16),
        ),
      );
    }
    updateMarkers({
      // Add marker on the map
      Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: const MarkerId('currentLocation'),
        position: position,
        infoWindow: InfoWindow(
          title:
              "${SetLocalization.of(context)?.getTranslateValue("current_location")}",
        ),
      ),
    });
  }

  // Add a marker when a user taps on the map
  void updateMarkersOnTap(
      LatLng position, BuildContext context, WidgetRef ref) {
    Set<Marker> updatedMarkers = {...state.markers};
    updatedMarkers.clear();
    updatedMarkers.add(
      Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: const MarkerId('selectedLocation'),
        position: position,
        infoWindow: InfoWindow(
          title:
              "${SetLocalization.of(context)?.getTranslateValue("selected_location")}",
        ),
      ),
    );
    updateMarkers(updatedMarkers);
    ref.read(selectedLocationProvider.notifier).state = position;
  }

  // Update map style
  void updateMapStyle(String style) {
    state = state.copyWith(mapStyle: style);
  }

  void addMarker(Marker marker) {
    state = state.copyWith(markers: {...state.markers, marker});
  }

  // Set the map controller
  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }
}
