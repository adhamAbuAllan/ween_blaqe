import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../../api/apartments_api/apartments.dart';
import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../session/new_session.dart';

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
    return Positioned(
        left: ( //check if the language is english
            NewSession.get("language", "ar") == "en"
                ? null // is not english give me default value
                : ( // is english , check if the screen is small

                    getIt<AppDimension>().isSmallScreen(context)
                        ? // if screen is small give me 5 only
                        5
                        : ( // if screen is not small check if screen is medium

                            MediaQuery.sizeOf(context).width <= 413 &&
                                    MediaQuery.sizeOf(context).width >= 390
                                ? // if screen is medium give me 10 only
                                10.0
                                : // then screen is not medium give me 20 only
                                20.0))),
        right: ( // is the same of left position but the difference
            // check is
            // not english language

            NewSession.get("language", "ar") != "en"
                ? null
                : (getIt<AppDimension>().isSmallScreen(context)
                    ? 5
                    : (MediaQuery.sizeOf(context).width <= 413 &&
                            MediaQuery.sizeOf(context).width >= 390
                        ? 10.0
                        : 30.0))),
        top: 2,
        child: GestureDetector(
            onTap: widget.onTap,
            child: const Icon(
              Icons.cancel,
              color: Color(0xf0e09000),
            )));
  }
}
