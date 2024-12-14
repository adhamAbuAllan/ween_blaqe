import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/image_provider.dart';
import '../../../statuses/image_state.dart';
import 'package:http/http.dart' as http;

class ImageApiNotifier extends StateNotifier<ImageState> {
  ImageApiNotifier() : super(ImageState());

  Future<List<String>> fetchApartmentImages(String apartmentId) async {
    String apiUrl = ServerWeenBalaqee.showApartmentImages;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'apartment_id': apartmentId},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['success']) {
        return List<String>.from(data['image_urls']);
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to fetch images');
    }
  }

  Future<void> compressAndUploadImages(
      {required WidgetRef ref,
      int apartmentIdToUpdate = -1,
      List<XFile>? newImages}) async {
    if (newImages?.isEmpty ?? true) {
      debugPrint("No images selected.");
      return;
    }

    state = state.copyWith(isLoading: true);
    final url = Uri.parse(ServerWeenBalaqee.uploadImages);
    final request = http.MultipartRequest('POST', url);
    request.fields['apartment_id'] = "$apartmentIdToUpdate";

    for (XFile imageFile in newImages!) {
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
      debugPrint('Upload successful');
    } else {
      debugPrint('Upload failed');
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> deleteImages(
      {required int apartmentId, required List<int> photoIds}) async {
    state = state.copyWith(isLoading: true);

    for (int photoId in photoIds) {
      final url = Uri.parse(ServerWeenBalaqee.deleteImage);
      final token = (await sp).get("token");

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
        debugPrint('Image deleted successfully');
      } else {
        debugPrint('Failed to delete image: ${response.body}');
      }
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> updateImages(
      {required int apartmentId,
      required WidgetRef ref,
      List<Photos>? imagesApi}) async {
    List<int> photosWillDelteIds = [];
    List<XFile> newImages = [];

    /// get the ids of the images that will be deleted
    (imagesApi ?? [])
        .where((photo) => !ref
            .read(imagesFileList.notifier)
            .state
            .any((image) => image.path == photo.url))
        .forEach((photo) {
      photosWillDelteIds.add(photo.id ?? -1);
    });

    /// get the images that will be added
    ref
        .read(imagesFileList.notifier)
        .state
        .where((image) =>
            !(imagesApi ?? []).any((photo) => photo.url == image.path))
        .forEach((image) {
      newImages.add(image);
    });
    debugPrint("new images : $newImages");
    debugPrint("images will deleted : $photosWillDelteIds");
    if (ref.read(imagesFileList.notifier).state.isEmpty) {
      null;
    } else {
      debugPrint(
          "ref.read(imagesFileList.notifier).state.length = ${ref.read(imagesFileList.notifier).state.length}");
      debugPrint("photosWillDelteIds.length = ${photosWillDelteIds.length}");
      deleteImages(apartmentId: apartmentId, photoIds: photosWillDelteIds);
      debugPrint("photos deleted");
    }

    if (newImages.isNotEmpty) {
      compressAndUploadImages(
          apartmentIdToUpdate: apartmentId, ref: ref, newImages: newImages);
    }
  }
}
