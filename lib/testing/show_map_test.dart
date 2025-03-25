// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
// class ShowMapTest extends ConsumerStatefulWidget {
//   const ShowMapTest({super.key});
//
//   @override
//   ConsumerState createState() => _ShowMapTestState();
// }
//
// class _ShowMapTestState extends ConsumerState<ShowMapTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const CreateApartmentScreen(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  String mapStyle = "";
  Set<Marker> _markers = {};
  StreamSubscription<Position>? _positionStream;
  bool _isPermissionGranted = false;
  LatLng? _currentLocation;
  bool _isShow = false;

  @override
  void initState() {
    _loadMapStyle();
    _checkPermissionRequest();
    super.initState();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CupertinoSwitch(
                  value: _isShow,
                  onChanged: (value) {
                    setState(() {
                      _isShow = value;
                    });
                  }),
            ),
            Text("is map for show: $_isShow")
          ],
        ),
      ),
      body:

      _isShow ?
      GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: _isPermissionGranted,
        style: mapStyle,
        initialCameraPosition: const CameraPosition(
          target: LatLng(33.3152, 44.3661),
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          _addHotelMarker();
        },
        markers: _markers,
      ):SelectLocationMap(),
    );
  }
/// a method *
  Future<void> _loadMapStyle() async {
    final String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    setState(() {
      mapStyle = style;
    });
  }

  /// a method *
  Future<void> _checkPermissionRequest() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
      _getUserLocation();
    }
  }
  /// a method *
  void _getUserLocation() async {
    if (!_isPermissionGranted) return;

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    final GoogleMapController controller = await _controller.future;

    // Move to current location
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentLocation!, zoom: 14),
      ),
    );

    _startTracking();

    // Delay and then move to the hotel location
    Future.delayed(const Duration(seconds: 3), _moveToHotel);
  }
  /// a method *
  void _startTracking() {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position position) {
      LatLng newLocation = LatLng(position.latitude, position.longitude);

      if (_currentLocation == null ||
          Geolocator.distanceBetween(
                _currentLocation!.latitude,
                _currentLocation!.longitude,
                newLocation.latitude,
                newLocation.longitude,
              ) >
              10) {
        setState(() {
          _currentLocation = newLocation;
        });

        _controller.future.then((controller) {
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: newLocation, zoom: 14),
            ),
          );
        });
      }
    });
  }
/// a method *
  void _addHotelMarker() async {
    const LatLng hotelLocation = LatLng(31.2304, 29.9553);

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("Hotel"),
          position: hotelLocation,
          infoWindow: const InfoWindow(
              title: "Luxury Hotel", snippet: "Best place to stay!"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          // onTap: () {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text("Welcome to the Luxury Hotel!")));
          // },
        ),
      );
    });
  }
  /// a method *
  void _moveToHotel() async {
    const LatLng hotelLocation = LatLng(31.2304, 29.9553);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: hotelLocation, zoom: 16),
      ),
    );
  }

//////////////

// Add marker with custom icon
}
//////////////////////////////////////////////////////////////////////

class SelectLocationMap extends StatefulWidget {
  @override
  _SelectLocationMapState createState() => _SelectLocationMapState();
}

class _SelectLocationMapState extends State<SelectLocationMap> {
  LatLng? _selectedPosition;
  final Set<Marker> _markers = {};

  // Set an initial camera position
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedPosition = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('selectedLocation'),
          position: position,
          infoWindow: InfoWindow(title: 'Selected Location'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Apartment Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onTap: _onMapTap,
      ),
      floatingActionButton: _selectedPosition != null
          ? FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          // Return the selected coordinates to the previous screen
          Navigator.pop(context, _selectedPosition);
        },
      )
          : null,
    );
  }
}
//////////////////////

class CreateApartmentScreen extends StatefulWidget {
  const CreateApartmentScreen({super.key});

  @override
  _CreateApartmentScreenState createState() => _CreateApartmentScreenState();
}

class _CreateApartmentScreenState extends State<CreateApartmentScreen> {
  LatLng? selectedLocation;

  Future<void> _openMap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectLocationMap()),
    );
    if (result != null && result is LatLng) {
      setState(() {
        selectedLocation = result;
      });
    }
  }

  void _submitApartment() {
      if (selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a location.')),
      );
      return;
    }
    // Build your JSON payload including the selected coordinates.
    // var body = {
    //   "location": "Your address text here", // Or any address data
    //   "title": "Apartment Title",
    //   // ... other apartment details,
    //   "latitude": selectedLocation!.latitude,
    //   "longitude": selectedLocation!.longitude,
    // };

    // Call your API method to create the apartment
    // print("Payload: $body");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Apartment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ... Your other form fields,
            ElevatedButton(
              onPressed: _openMap,
              child: Text(selectedLocation == null
                  ? "Select Location on Map"
                  : "Location Selected: (${selectedLocation!.latitude}, ${selectedLocation!.longitude})"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitApartment,
              child: Text("Submit Apartment"),
            ),
          ],
        ),
      ),
    );
  }
}
