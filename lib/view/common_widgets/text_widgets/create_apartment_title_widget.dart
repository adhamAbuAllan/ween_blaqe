import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/nums.dart';

class CreateApartmentTitleWidget extends ConsumerWidget {
  const CreateApartmentTitleWidget({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
       title ,
        style: TextStyle(
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
