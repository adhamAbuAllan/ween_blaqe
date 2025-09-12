import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/status_of_apartment/image_state.dart';
import 'package:flutter/material.dart';
import '../../../../api/photos.dart';
import '../../providers/auth_provider.dart';
import '../../providers/image_provider.dart';

class ImageLocalNotifier extends StateNotifier<ImageState> {
  ImageLocalNotifier() : super(ImageState());
/// a [pickImage] method that take a one image, even for profile of owner , or
/// for apartment.
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
/// a [doneState] check where the images that user canceled or added.
  void doneState(
      {required WidgetRef ref,
     required  List<String> cancelImages,
       List<Photos> ?apiPhotos,
      required List<XFile> images}) {
ref.read(cancelImagesNotifier.notifier).state = cancelImages;
    ref.read(imagesFileList.notifier).state = images;
  }

/// a [addImagesState] that check if user chose a multi images 'pickedFileList'
///  or one image 'imagePicker'.
/// and check if a list of 'images' has images before that if true, that make an add 
/// method, else 'that-mean-is-null' make list of 'images' 
///  = a new images or image 'imagePicker' , 'pickedFileList'.
/// after that, when user add new images will add a path of images in a 
/// 'newImagesNotifier' list than to send a response to api to upload new images.
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
