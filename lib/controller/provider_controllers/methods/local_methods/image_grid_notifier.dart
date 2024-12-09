import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/image_state.dart';
import 'package:flutter/material.dart';

import '../../../../api/photos.dart';
import '../../providers/auth_provider.dart';
import '../../providers/image_provider.dart';
class ImageLocalNotifier extends StateNotifier<ImageState> {
  ImageLocalNotifier() : super(ImageState());
  Future<void> pickImage(ImageSource source,WidgetRef ref,{XFile? pickedFile,
    List<XFile> ? imageFileList,bool ?forAuth}) async {
    if(forAuth??false){
      ref.watch(profileImageFile.notifier).state = await ref.watch(imagePicker)
          ?.pickImage(source:
      source);
    }

    debugPrint("pickedFile is not null");
    if(imageFileList!=null){

      imageFileList.add(pickedFile ?? XFile("$pickedFile"));



    }else{
      imageFileList = <XFile>[pickedFile ?? XFile("$pickedFile")];

    }
  }

  void initializeImageFileList(
      {required WidgetRef ref,

        required List<Photos>? photosOfCurrentApartment}) async {
    debugPrint("isSavedImages = ${ref.read(isSavedImages.notifier).state}");
    debugPrint("photosOfCurrentApartment = $photosOfCurrentApartment");
    if (ref.read(isSavedImages.notifier).state == false) {
      state = state.copyWith(isLoading: true);
      debugPrint("isSavedImages = ${ref.read(isSavedImages.notifier).state}");
      state = state.copyWith(
          imageFiles: photosOfCurrentApartment
              ?.map((e) => XFile(e.url ?? ""))
              .toList());
      debugPrint("imageFiles length = ${state.imageFiles?.length}");

    } else {
      if (state.newImages.isNotEmpty) {
        state = state.copyWith(imageFiles: state.newImages);
        debugPrint("_imageFileList = newImagesNotifer");
        debugPrint("newImageNotiferLength = ${state.newImages.length}");
      }
    }

    state = state.copyWith(isLoading: false);
  }
  Future<void> retrieveLostData(
      {required ImagePicker picker, List<XFile>? imageFileList}) async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.files != null) {
      if (response.files == null) {
        setImageFileListFromFile(value: response.file);
      } else {
        imageFileList = response.files;
      }
    } else {
      debugPrint("error ${response.exception!.code}");
    }

  }
  bool isImageUrl(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }
  checkArray(
      {required List<XFile>? imageFileList,
        required List<int>? imagesIds,
        required BuildContext context,
        required WidgetRef ref}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isSavedImages.notifier).state = true;
      if (imageFileList != null) {
        for (var image in imageFileList) {
          // Check if the image is not from API
          if (!isImageUrl(image.path)) {
            state = state.copyWith(imagesIds: imagesIds);
            state = state.copyWith(
                newImagesString: imageFileList.map((e) => e.path).toList());
          }
        }
      }
      Navigator.pop(context);
    });
  }
  Future<void> onImageButtonPressed(
      ImageSource source,
      WidgetRef ref, {
        required List<XFile>? imageFileList,
        XFile? pickedFile,
        ImagePicker? picker,
        bool isMultiImage = false,
      }) async {
    if (isMultiImage) {
      /// for multiple images
      final List<XFile>? pickedFileList =
      await ref.watch(imagePicker)?.pickMultiImage();
      state = state.copyWith(isLoading: true);

      if (imageFileList != null) {
        for (var image in pickedFileList ?? []) {
          imageFileList.add(image);

        }
      } else {
        imageFileList = pickedFileList;
      }
    } else {
      /// for single image
      final XFile? pickedFile =
      await ref.watch(imagePicker)?.pickImage(source: source);
      state = state.copyWith(isLoading: true);

      await pickImage(
          ImageSource.camera, ref,
          pickedFile: pickedFile, imageFileList: imageFileList);
    }
    state = state.copyWith(newImages: imageFileList);
    state = state.copyWith(isLoading: false);
  }

  Future<void> requestPhotoPermission() async {
    final status = await Permission.photos.request();
    final cameraStatus = await Permission.camera.request();

    if (status.isGranted) {
      debugPrint("Permission granted.");
    } else if (status.isDenied) {
      debugPrint("Permission denied.");
    } else if (status.isPermanentlyDenied || cameraStatus.isPermanentlyDenied) {
      debugPrint("Permission permanently denied. Redirecting to settings...");
      openAppSettings();
    }
  }
  void setImageFileListFromFile({XFile? value, List<XFile>? imageFileList}) {
    if (imageFileList != null) {
      for (var item in imageFileList) {
        imageFileList.add(value ?? XFile("$value"));
        debugPrint("item path : ${item.path}");
      }
    } else {
      imageFileList = <XFile>[value ?? XFile("$value")];
    }
  }

}
