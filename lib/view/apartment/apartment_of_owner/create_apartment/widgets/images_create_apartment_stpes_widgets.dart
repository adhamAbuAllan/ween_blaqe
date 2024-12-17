import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/nums.dart';

class ImageCreateApartmentStpesWidget extends ConsumerWidget {
  const ImageCreateApartmentStpesWidget(
      {super.key, required this.lightModeImage, required this.darkModeImage});

  final String lightModeImage;
  final String darkModeImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
      child: themeMode.isLight
          ? Image.asset(lightModeImage)
          : Image.asset(
              darkModeImage,
              width:
                  getIt<AppDimension>().isSmallScreen(context) ? 65 / 1.1 : 65,
              height:
                  getIt<AppDimension>().isSmallScreen(context) ? 65 / 1.1 : 65,
              fit: BoxFit.fill,
            ),
    );
  }
}

class FirstStepImageWidget extends ConsumerWidget {
  const FirstStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStpesWidget(
      lightModeImage:'assets/images/apartments_images/images_to_create_apartment/step_one.png' ,
      darkModeImage: 'assets/images/apartments_images/images_to_create_apartment/first_setp_dark_mode.png',
    );
  }
}

class SecondStepImageWidget extends ConsumerWidget {
  const SecondStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStpesWidget(
      lightModeImage:'assets/images/apartments_images/images_to_create_apartment/second_step.png' ,
      darkModeImage: 'assets/images/apartments_images/images_to_create_apartment/second_step_dark_mode.png',
    );
  }
}
