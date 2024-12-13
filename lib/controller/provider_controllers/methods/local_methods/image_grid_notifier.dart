import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/image_state.dart';
import 'package:flutter/material.dart';
import '../../../../api/photos.dart';
import '../../providers/auth_provider.dart';
import '../../providers/image_provider.dart';

class ImageLocalNotifier extends StateNotifier<ImageState> {
  ImageLocalNotifier() : super(ImageState());

  Future<void> pickImage(
    ImageSource source,
    WidgetRef ref, {
    XFile? pickedFile,
    List<XFile>? imageFileList,
    bool? forAuth,
  }) async {
    if (forAuth ?? false) {
      ref.watch(profileImageFile.notifier).state =
          await ref.watch(imagePicker)?.pickImage(source: source);
    }

    debugPrint("pickedFile is not null");
    if (imageFileList != null) {
      imageFileList.add(pickedFile ?? XFile("$pickedFile"));
    } else {
      imageFileList = <XFile>[pickedFile ?? XFile("$pickedFile")];
    }
  }



  void doneState(
      {required WidgetRef ref,
      required List<String> cancelImages,
      required List<Photos> apiPhotos,
      required List<XFile> images
      }) {
    debugPrint("cancelImages.isNotEmpty ${cancelImages.isNotEmpty}");
ref.read(imagesFileList.notifier).state = images;

    }


  // when click on done button

  Future<void> addImagesState({
    required WidgetRef ref,
    ImageSource? source,
    required List<XFile> images,
    required ImagePicker imagePicker,
  }) async {
    state = state.copyWith(isLoading: true);
    debugPrint("isLaoding = ${state.isLoading}");
if (source != null) {
  ref.read(permissionNotifier).cameraGranted;

  final XFile? pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        state = state.copyWith(isLoading: false);
        return;
      }
      ref.read(newImagesNotifier.notifier).state.add(pickedFile.path);

      images.add(pickedFile);

    } else {
  ref.read(permissionNotifier).photosGranted;
      final List<XFile> pickedFileList = await imagePicker.pickMultiImage();
      debugPrint("pickedFileList = $pickedFileList");
      if (pickedFileList.isEmpty) {
        state = state.copyWith(isLoading: false);
        return;
      }
      for (var image in pickedFileList) {
        images.add(image);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          ref.read(newImagesNotifier.notifier).state.add(image.path);

        });
      }
    }
 state = state.copyWith(isLoading: false);
  }






}
