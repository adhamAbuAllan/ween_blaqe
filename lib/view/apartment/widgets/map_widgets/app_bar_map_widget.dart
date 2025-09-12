import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/button_widgets/elevated_button_widget.dart';
import '../../../common_widgets/button_widgets/outline_button_widget.dart';

class AppBarMapWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppBarMapWidget({
    super.key,
    this.selectedLocation,
    // required this.cancelImages,
    // required this.newImages,
    // required this.images,
    // this.oneApartment,
  });

  // final List<String> cancelImages;
  // final List<String> newImages;
  // final List<XFile> images;
  // final DataOfOneApartment? oneApartment;
  final LatLng? selectedLocation;

  @override
  ConsumerState createState() => _AppBarMapWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarMapWidgetState extends ConsumerState<AppBarMapWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
              horizontal:
                  getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
          child: OutlinedButtonWidget(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child:
                Text(SetLocalization.of(context)!.getTranslateValue("cancel")),
          ),
        ),
        const Expanded(child: Text("")),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
              horizontal:
                  getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
          child: ElevatedButtonWidget(
            onPressed: () {
              _submitApartment();
            },
            context: context,
            child: Text(SetLocalization.of(context)!.getTranslateValue("done")),
          ),
        ),
      ],
    );
  }

  void _submitApartment() {
    if (widget.selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pleas e select a location.')),
      );
      return;
    } else {
      // longitude: 44.38281062990427
      // latitude: 33.322856322122796
      debugPrint("longitude: ${widget.selectedLocation!.longitude}");
      debugPrint("latitude: ${widget.selectedLocation!.latitude}");
      Navigator.pop(context);
    }
    // Build your JSON payload including the selected coordinates.
    // var body = {
    //   "location": "Your address text here", // Or any address data
    //   "title": "Apartment Title",
    //   // ... other apartment details,
    //   "latitude": widget.selectedLocation!.latitude,
    //   "longitude": widget.selectedLocation!.longitude,
    // };

    // Call your API method to create the apartment
    // print("Payload: $body");
  }
}
