import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final Set<Marker> markers;
  final GoogleMapController? mapController;
  final String mapStyle;

  MapState({
    required this.markers,
    required this.mapController,
    required this.mapStyle,
  });

  MapState copyWith({
    Set<Marker>? markers,
    GoogleMapController? mapController,
    String? mapStyle,
  }) {
    return MapState(
      markers: markers ?? this.markers,
      mapController: mapController ?? this.mapController,
      mapStyle: mapStyle ?? this.mapStyle,
    );
  }
}