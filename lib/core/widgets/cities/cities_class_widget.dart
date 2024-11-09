import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/localization.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';

import '../../../api/cities.dart';
import '../../../constants/get_it_controller.dart';

Widget cityButton(
  City city,
  Function onClick, {
  ButtonStyle? style,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: getIt<AppDimension>().isSmallScreen(context) ? 75 : 80,
      height: getIt<AppDimension>().isSmallScreen(context)? 35 : 40,
      child: OutlinedButton(
          onPressed: () {
            onClick.call();
          },
          style: style,
          child: Text(city.name ??
              SetLocalization.of(context)!.getTranslateValue("loading..."))),
    ),
  );
}
