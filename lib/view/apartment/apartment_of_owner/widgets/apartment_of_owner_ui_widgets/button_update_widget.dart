import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../../../../api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../update_apartment_ui.dart';

class ButtonUpdateClassWdiget extends ConsumerStatefulWidget {
  const ButtonUpdateClassWdiget({
    super.key,
    required this.apartmentsRes,
    required this.apartmentId,
  });

  final Apartments apartmentsRes;
  final int apartmentId;

  @override
  ConsumerState createState() => _UpdateButtonClassWidgetConsumerState();
}

class _UpdateButtonClassWidgetConsumerState
    extends ConsumerState<ButtonUpdateClassWdiget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,

      icon: Icon(Icons.edit,
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)), // Adjust colors based on theme
      onPressed: () {
        // imagesModelController.imageFiles?.clear();

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => UpdateApartmentUi(
                  oneApartment: widget.apartmentsRes.data?[widget.apartmentId],
                )));
        debugPrint("apartment id is : --$widget.apartmentId");
      },
    );
  }
}
