import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/provider_controllers/providers/image_provider.dart';

class FloatingButtonsAddImagesWidgets extends ConsumerWidget {
  const FloatingButtonsAddImagesWidgets(
      {super.key,
      required this.images,
      required this.imagePicker,
});

  final ImagePicker imagePicker;
  final List<XFile> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingButtonAddMultiImagesWidget(
          imagePicker: imagePicker,
          images: images,
          // newImages: newImages,
        ),
        FloatingButtonAddImageWidget(
          imagePicker: imagePicker,
          images: images,
          // newImages: newImages,
        ),
      ],
    );
  }
}

class FloatingButtonAddMultiImagesWidget<FloatingActionButtonWidget>
    extends ConsumerWidget {
  const FloatingButtonAddMultiImagesWidget(
      {super.key,
      required this.imagePicker,
      required this.images,
      // required this.newImages
      });

  final ImagePicker imagePicker;
  final List<XFile> images;
  // final List<String> newImages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {

            await ref.watch(imageLocalNotifier.notifier).addImagesState(
                imagePicker: imagePicker,
                ref: ref,
                images: images,
                // newImages: newImages
            );
          });
        },
        heroTag: 'image0',
        backgroundColor:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        tooltip: SetLocalization.of(context)!
            .getTranslateValue("add_photos_from_gallery"),
        child: const Icon(Icons.photo_library),
      ),
    );
  }
}

class FloatingButtonAddImageWidget extends ConsumerWidget {
  const FloatingButtonAddImageWidget(
      {super.key,
      required this.imagePicker,
      required this.images,
      // required this.newImages
      });

  final List<XFile> images;
  final ImagePicker imagePicker;
  // final List<String> newImages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await ref.watch(imageLocalNotifier.notifier).addImagesState(
                ref: ref,
                source: ImageSource.camera,
                imagePicker: imagePicker,
                // newImages: newImages,
                images: images);
          });

        },
        heroTag: 'image1',
        tooltip: SetLocalization.of(context)!.getTranslateValue("take_photo"),
        backgroundColor:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
