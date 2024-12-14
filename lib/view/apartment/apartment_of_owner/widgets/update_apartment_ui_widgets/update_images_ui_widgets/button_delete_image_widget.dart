import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../../../api/apartments_api/apartments.dart';
import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';

class ButtonDeleteImageWidget extends ConsumerStatefulWidget {
  const ButtonDeleteImageWidget(
      {super.key,
      required this.oneApartment,
        this.onTap
      });

  final DataOfOneApartment oneApartment;
 final void Function()? onTap;

  @override
  ConsumerState createState() => _ButtonCanselImageWidgetState();
}

class _ButtonCanselImageWidgetState
    extends ConsumerState<ButtonDeleteImageWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(13),
      child: GestureDetector(

          onTap: widget.onTap,
          child: const Icon(
            Icons.cancel,
            color: kTextColorDarkMode,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0), // Slightly offset the shadow for a 3D effect
                blurRadius: 4.0,          // Blur the shadow for smoothness
                color: Color.fromARGB(128, 0, 0, 0), // Semi-transparent black
              ),
              Shadow(
                offset: Offset(-1.0, -1.0), // A subtle secondary shadow for depth
                blurRadius: 2.0,
                color: Color.fromARGB(64, 0, 0, 0), // Fainter black shadow
              ),
            ],
          )),
    );


  }
}
