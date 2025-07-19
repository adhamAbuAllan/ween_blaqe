import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/image_provider.dart';
import '../../../statuses/status_of_apartment/image_state.dart';
import 'package:http/http.dart' as http;

class ImageApiNotifier extends StateNotifier<ImageState> {
  ImageApiNotifier() : super(ImageState());
/// a [compressAndUploadImages] method usage to compress an images and add an
/// images for apartment according id of apartment.
  Future<void> compressAndUploadImages(
      {required WidgetRef ref,
      int apartmentIdToUpdate = -1,
      List<XFile>? newImages,
      required BuildContext context}) async {
    if (newImages?.isEmpty ?? true) {
      debugPrint("No images selected.");
      return;
    }

    state = state.copyWith(isLoading: true);
    final url = Uri.parse(ServerWeenBalaqee.uploadImages);
    final request = http.MultipartRequest('POST', url);
    request.fields['apartment_id'] = "$apartmentIdToUpdate";

    for (XFile imageFile in newImages!) {
      debugPrint("newImages : $newImages");
      final compressedFile =
          await ref.read(imageHybridNotifer.notifier).compressImage(imageFile);
      request.files.add(
        await http.MultipartFile.fromPath(
          'images[]',
          compressedFile.path,
          contentType: MediaType.parse(
              lookupMimeType(compressedFile.path) ?? 'image/jpeg'),
        ),
      );
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(isApartmentUpdatedNotifier.notifier).state = true;
      });
      ref.read(badResponse.notifier).state = false;
      debugPrint('Upload successful');
      Navigator.pop(context);
    } else {
      ref.read(badResponse.notifier).state = true;
      debugPrint('Upload failed');
    }

    state = state.copyWith(isLoading: false);
  }
/// [deleteImages] method to delete specific images according apartment id.
  Future<void> deleteImages(
      {required int apartmentId,
      required List<int> photoIds,
      required WidgetRef ref}) async {
    state = state.copyWith(isLoading: true);

    for (int photoId in photoIds) {
      final url = Uri.parse(ServerWeenBalaqee.deleteImage);
      final token = (await sp).get(PrefKeys.token);

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        'apartment_id': apartmentId,
        'photo_id': photoId,
      });

      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          ref.read(isApartmentUpdatedNotifier.notifier).state = true;
        });
      } else {
        debugPrint('Failed to delete image: ${response.body}');
      }
    }

    state = state.copyWith(isLoading: false);
  }
/// a [updateImages] to update images of apartment according apartment id.
  Future<void> updateImages(
      {required int apartmentId,
      required WidgetRef ref,
      List<Photos>? imagesApi,
      required BuildContext context}) async {
    List<int> photosWillDelteIds = [];
    List<XFile> newImages = [];
    var cancelImages = ref.read(cancelImagesNotifier.notifier).state;
    debugPrint(
        "images will deleted notifier ${ref.read(cancelImagesNotifier.notifier).state}");
    debugPrint(" the canelImages is $cancelImages");

    /// get the ids of the images that will be deleted
    debugPrint("imageApi : $imagesApi");
    if (imagesApi?.isNotEmpty ?? false) {
      for(Photos photo in imagesApi!){
        if(cancelImages.contains(photo.url)){
          photosWillDelteIds.add(photo.id!);
        }
      }
    }

    /// get the images that will be added
    ref.read(imagesFileList.notifier).state.where((image) {
      return !(imagesApi ?? []).any((photo) => photo.url == image.path);
    }).forEach((image) {
      newImages.add(image);
    });
    if (ref.read(imagesFileList.notifier).state.isEmpty) {
      null;
    } else {
      if (photosWillDelteIds.isNotEmpty) {
        deleteImages(
            apartmentId: apartmentId, photoIds: photosWillDelteIds, ref: ref);
      }
      debugPrint("photos will be deleted : $photosWillDelteIds");
      debugPrint("photos deleted");
    }

    if (newImages.isNotEmpty) {
      compressAndUploadImages(
          apartmentIdToUpdate: apartmentId,
          ref: ref,
          newImages: newImages,
          context: context);
    }
    ref.read(isApartmentImagesUpdated.notifier).state = false;
  }
}
