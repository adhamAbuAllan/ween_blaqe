import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final Set<Marker> markers;
  final GoogleMapController? mapController;
  final String mapStyle;
  final bool loadingLocation;
  final bool didServiceLocationEnabled;

  final Position? userPosition;

  MapState(
      {required this.markers,
      required this.mapController,
      required this.mapStyle,
      required this.loadingLocation,
      required this.didServiceLocationEnabled,
      this.userPosition});

  MapState copyWith(
      {Set<Marker>? markers,
      GoogleMapController? mapController,
      String? mapStyle,
      bool? loadingLocation,
      bool? didServiceLocationEnabled,
      Position? userPosition}) {
    return MapState(
        markers: markers ?? this.markers,
        mapController: mapController ?? this.mapController,
        mapStyle: mapStyle ?? this.mapStyle,
        loadingLocation: loadingLocation ?? this.loadingLocation,
        didServiceLocationEnabled:
            didServiceLocationEnabled ?? this.didServiceLocationEnabled,
        userPosition: userPosition ?? this.userPosition);
  }
}
