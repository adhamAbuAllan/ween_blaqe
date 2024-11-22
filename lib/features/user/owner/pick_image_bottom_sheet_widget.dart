import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import '../provider/auth_provider.dart';

class PickImageBottomSheetWidget extends ConsumerWidget {
  const PickImageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
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
  const _PickFromGalleryWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        Icons.photo_library,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      ),
      title: Text(
          SetLocalization.of(context)!.getTranslateValue("from_gallery"),
          style: TextStyle(
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
              fontFamily: "IBM")),
      onTap: () {
        Navigator.pop(context); // Close bottom sheet
        ref
            .watch(imageProfilePickerNotifier.notifier)
            .pickImage(ImageSource.gallery, ref);
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
          color: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode),
      title: Text(
        SetLocalization.of(context)!.getTranslateValue("from_camera"),
        style: TextStyle(
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            fontFamily: "IBM"),
      ),
      onTap: () {
        Navigator.pop(context); // Close bottom sheet
        // _pickProfileImage(ImageSource.camera);
        ref
            .watch(imageProfilePickerNotifier.notifier)
            .pickImage(ImageSource.camera, ref);
      },
    );
  }
}
