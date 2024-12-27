import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';

class PickImageBottomSheetWidget extends ConsumerWidget {
  const PickImageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
        child: const Wrap(
          children: [
            _PickFromGalleryWidget(),
            _PickFromCameraWidget(),
          ],
        ),
      ),
    );
  }
}

class _PickFromGalleryWidget extends ConsumerWidget {
  const   _PickFromGalleryWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        Icons.photo_library,
        color:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      ),
      title: Text(
          SetLocalization.of(context)!.getTranslateValue("from_gallery"),
          style: TextStyle(
              color:
                  ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              fontFamily: "IBM")),
      onTap: () {
        Navigator.pop(context); // Close bottom sheet
        ref
            .watch(imageLocalNotifier.notifier)
            .pickImage(ImageSource.gallery, ref,forAuth: true);
      },
    );
  }
}

class _PickFromCameraWidget extends ConsumerWidget {
  const _PickFromCameraWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(Icons.camera_alt,
          color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)),
      title: Text(
        SetLocalization.of(context)!.getTranslateValue("from_camera"),
        style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref) ,
            fontFamily: "IBM"),
      ),
      onTap: () {
        Navigator.pop(context); // Close bottom sheet
        // _pickProfileImage(ImageSource.camera);
        ref
            .watch(imageLocalNotifier.notifier)
            .pickImage(ImageSource.camera, ref,forAuth: true);
      },
    );
  }
}
