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

  List<XFile> initState(
      {required WidgetRef ref,
      List<Photos>? apiPhotos,
      required List<XFile> images,
      required List<String> newImages}) {
    state = state.copyWith(isLoading: true);
    ref.read(photosIds.notifier).state = [];
    ref.read(newImagesNotifier.notifier).state = [];
    ref.read(newImagesCanceled.notifier).state = [];

    if (state.newImages.isEmpty) {
      // state.images = apiPhotos?.map((e) => XFile(e.url ?? ""))?.toList();
      // ref.read(images.notifier).state =
      //apiPhotos!.map((e) => XFile(e.url ?? "")).toList();
      state = state.copyWith(
          images: apiPhotos?.map((e) => XFile(e.url ?? "")).toList());
      images = state.images;
      debugPrint("images = $images");

      debugPrint("state images = ${state.images}");
    } else {
      for (var image in state.newImages) {
        state.images.add(XFile(image));
        images.add(XFile(image));
        // ref.read(images.notifier).state.add(XFile(image));
      }
    }
    state = state.copyWith(isLoading: false);

    return images;
  }

  void doneState(
      {required WidgetRef ref,
      required List<String> cancelImages,
      required List<Photos> apiPhotos}) {
    if (cancelImages.isNotEmpty) {
      for (var cancelImage in cancelImages) {
        for (var newImage in state.newImages) {
          if (newImage == cancelImage) {
            state.newImages.remove(newImage);
          }
        }

        for (var apiUrl in apiPhotos) {
          if (apiUrl.url == cancelImage) {
            ref.read(photosIds.notifier).state.add(apiUrl.id ?? -1);
          }
        }
      }
    }
    for (var newImage in ref.read(newImagesNotifier.notifier).state) {
      state.newImages.add(newImage);
    }
  } // when click on done button

  Future<void> addImagesState({
    required WidgetRef ref,
    ImageSource? source,
    required List<XFile> images,
    required ImagePicker imagePicker,
  }) async {
    state = state.copyWith(isLoading: true);
    debugPrint("isLaoding = ${state.isLoading}");

    if (source != null) {
      final XFile? pickedFile = await imagePicker.pickImage(source: source);
      images.add(pickedFile ?? XFile(""));
      if (pickedFile == null) {
        return;
      }
      state.newImages.add(pickedFile.path);
    } else {
      final List<XFile> pickedFileList = await imagePicker.pickMultiImage();
      debugPrint("pickedFileList = $pickedFileList");
      if (pickedFileList.isEmpty) {
        return;
      }
      for (var image in pickedFileList) {
        images.add(image);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          ref.read(newImagesNotifier.notifier).state.add(image.path);

        });
      }
    }

    debugPrint(
        "ref.read(newImagesNotifier.notifier).state; = ${ref.read(newImagesNotifier.notifier).state}");
    state = state.copyWith(isLoading: false);
  }

//   void initializeImageFileList(
//       {required WidgetRef ref,
//       required List<Photos>? photosOfCurrentApartment,required
//       List<XFile>imageFileList,})
//   async {
//     state = state.copyWith(isLoading: true);
//     debugPrint("photosOfCurrentApartment = $photosOfCurrentApartment");
//
// //     for(var photo in photosOfCurrentApartment!){
// //   if(ref.read(photosIdsDeleted).isNotEmpty){
// //     for(var photoId in ref.read(photosIdsDeleted)){
// //       if (photo.id != photoId) {
// // //add the image that is not in photosIdsWillDelete list
// //         imageFileList.add(XFile(photo.url ?? ""));
// //         debugPrint("imageFiles length = ${state.imageFiles?.length}");
// //       }
// //     }
// // ref.read(photosIdsDeleted.notifier).state.clear();
// //   }else{
// //     state = state.copyWith(
// //         imageFiles: photosOfCurrentApartment
// //             ?.map((e) => XFile(e.url ?? ""))
// //             .toList());
// //   }
// //
// // }
//
//
//     // list photosIds  = [];
//
//
//
//
//
//     if (state.newImages.isNotEmpty) {
//       state = state.copyWith(imageFiles: state.newImages);
//       debugPrint("_imageFileList = newImagesNotifer");
//       debugPrint("newImageNotiferLength = ${state.newImages.length}");
//     }
//     state = state.copyWith(isLoading: false);
//   }

  // Future<void> retrieveLostData(
  //     {required ImagePicker picker, List<XFile>? imageFileList}) async {
  //   final LostDataResponse response = await picker.retrieveLostData();
  //   if (response.files != null) {
  //     if (response.files == null) {
  //       setImageFileListFromFile(value: response.file);
  //     } else {
  //       imageFileList = response.files;
  //     }
  //   } else {
  //     debugPrint("error ${response.exception!.code}");
  //   }
  // }

  bool isImageUrl(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

// checkArray(
//     {required List<XFile>? imageFileList,
//     required BuildContext context,
//     required WidgetRef ref}) {
//   WidgetsBinding.instance.addPostFrameCallback((_) async {
//     // ref.read(isSavedImages.notifier).state = true;
//     if (imageFileList != null) {
//       for (var image in imageFileList) {
//         // Check if the image is not from API
//         if (!isImageUrl(image.path)) {
//           state = state.copyWith(
//               newImagesString: imageFileList.map((e) => e.path).toList());
//         }
//       }
//     }
//     if (ref.read(photosIds).isNotEmpty) {
//       for (var photoId in ref.read(photosIds).toList()) {
//         WidgetsBinding.instance.addPostFrameCallback((_) async {
//           ref.read(photosIdsWillDelete.notifier).state.add(photoId);
//           ref.read(photosIdsDeleted.notifier).state.add(photoId);
//         });
//
//
//       }        debugPrint("state photosIdsWillDelete = ${ref.read(photosIdsWillDelete)}");
//
//       ref.read(photosIds.notifier).state.clear();
//     }
//
//
//     Navigator.pop(context);
//   });
// }

// Future<void> onImageButtonPressed(
//   ImageSource source,
//   WidgetRef ref, {
//   required List<XFile>? imageFileList,
//   XFile? pickedFile,
//   ImagePicker? picker,
//   bool isMultiImage = false,
// }) async {
//   if (isMultiImage) {
//     /// for multiple images
//     final List<XFile>? pickedFileList =
//         await ref.watch(imagePicker)?.pickMultiImage();
//     state = state.copyWith(isLoading: true);
//
//     if (imageFileList != null) {
//       for (var image in pickedFileList ?? []) {
//         imageFileList.add(image);
//       }
//     } else {
//       imageFileList = pickedFileList;
//     }
//   } else {
//     /// for single image
//     final XFile? pickedFile =
//         await ref.watch(imagePicker)?.pickImage(source: source);
//     state = state.copyWith(isLoading: true);
//
//     await pickImage(ImageSource.camera, ref,
//         pickedFile: pickedFile, imageFileList: imageFileList);
//   }
//   state = state.copyWith(newImages: imageFileList);
//   state = state.copyWith(isLoading: false);
// }

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
