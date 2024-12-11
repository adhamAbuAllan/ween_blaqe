
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../controller/provider_controllers/providers/image_provider.dart';

class FloatingButtonsAddImagesWidgets extends ConsumerWidget {
  const FloatingButtonsAddImagesWidgets({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingButtonAddMultiImagesWidget(),
        FloatingButtonAddImageWidget(),
      ],
    );
  }
}


class FloatingButtonAddMultiImagesWidget<FloatingActionButtonWidget>
    extends ConsumerWidget {
  const FloatingButtonAddMultiImagesWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () {

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await   ref.watch(imageLocalNotifier.notifier).addImagesState(
          ref: ref );
      });

        },
        heroTag: 'image0',
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        tooltip: SetLocalization.of(context)!
            .getTranslateValue("add_photos_from_gallery"),
        child: const Icon(Icons.photo_library),
      ),
    );
  }
}

class FloatingButtonAddImageWidget extends ConsumerWidget {
  const FloatingButtonAddImageWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref
            .watch(imageLocalNotifier.notifier)
          .addImagesState(ref: ref, source: ImageSource.camera);
      });

        },
        heroTag: 'image1',
        tooltip: SetLocalization.of(context)!.getTranslateValue("take_photo"),
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
