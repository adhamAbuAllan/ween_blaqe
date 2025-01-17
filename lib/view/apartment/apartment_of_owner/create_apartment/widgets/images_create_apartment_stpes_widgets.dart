import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';

class ImageCreateApartmentStepsWidget extends ConsumerWidget {
  const ImageCreateApartmentStepsWidget(
      {super.key, required this.lightModeImage, required this.darkModeImage});

  final String lightModeImage;
  final String darkModeImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height =
        getIt<AppDimension>().isSmallScreen(context) ? 65 / 1.1 : 65;
    double width = getIt<AppDimension>().isSmallScreen(context) ? 65 / 1.1 : 65;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
      child: ref.read(themeModeNotifier.notifier).isLightMode
          ? Image.asset(
              lightModeImage,
              width:
                  width,
              height:
                  height,
              fit: BoxFit.fill,
            )
          : Image.asset(
              darkModeImage,
              width:
                  width,
              height:
                  height,
              fit: BoxFit.fill,
            ),
    );
  }
}

class FirstStepImageWidget extends ConsumerWidget {
  const FirstStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStepsWidget(
      lightModeImage:
          'assets/images/apartments_images/images_to_create_apartment/step_one.png',
      darkModeImage:
          'assets/images/apartments_images/images_to_create_apartment/first_setp_dark_mode.png',
    );
  }
}

class SecondStepImageWidget extends ConsumerWidget {
  const SecondStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStepsWidget(
      lightModeImage:
          'assets/images/apartments_images/images_to_create_apartment/second_step.png',
      darkModeImage:
          'assets/images/apartments_images/images_to_create_apartment/second_step_dark_mode.png',
    );
  }
}

class ThirdStepImageWidget extends ConsumerWidget {
  const ThirdStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStepsWidget(
      lightModeImage:
          'assets/images/apartments_images/images_to_create_apartment/step_three.png',
      darkModeImage:
          'assets/images/apartments_images/images_to_create_apartment/thrid_setp_dark_mode.png',
    );
  }
}

class FourthStepImageWidget extends ConsumerWidget {
  const FourthStepImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageCreateApartmentStepsWidget(
        lightModeImage:
            'assets/images/apartments_images/images_to_create_apartment/step_four.png',
        darkModeImage:
            'assets/images/apartments_images/images_to_create_apartment/fourth_step_dark_mode.png');
  }
}
