import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../constants/strings.dart';
import '../../../../../data_containers/add_ad_data_container.dart';
import '../../../../../main.dart';
import '../../../statuses/image_state.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class ImageManager extends StateNotifier<ImageState> {
  ImageManager() : super(ImageState());

  Future<void> deleteImages(int apartmentId, List<int> photoIds) async {
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
  Future<void> compressAndUploadImages() async {
    if (state.imageFiles == null || state.imageFiles!.isEmpty) {
      debugPrint("No images selected.");
      return;
    }

    state = state.copyWith(isLoading: true);
    final url = Uri.parse(ServerWeenBalaqee.uploadImages);
    final request = http.MultipartRequest('POST', url);
    request.fields['apartment_id'] = "${AddApartmentData.apartmentId}";

    for (XFile imageFile in state.imageFiles!) {
      final compressedFile = await compressImage(imageFile);
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
      state = state.copyWith(isImagesUploaded: true);
      debugPrint('Upload successful');
    } else {
      debugPrint('Upload failed');
    }

    state = state.copyWith(isLoading: false);
  }
  Future<File> compressImage(XFile imageFile) async {
    final imageBytes = await imageFile.readAsBytes();
    final image = img.decodeImage(imageBytes);
    if (image == null) throw Exception("Invalid image data");

    final quality = (await imageFile.length() > 1000000) ? 50 : 75;
    final compressedImage = img.encodeJpg(image, quality: quality);

    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/${imageFile.name}');
    await tempFile.writeAsBytes(compressedImage);

    return tempFile;
  }

  Future<void> requestPhotoPermission() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      debugPrint("Permission granted.");
    } else if (status.isDenied) {
      debugPrint("Permission denied.");
    } else if (status.isPermanentlyDenied) {
      debugPrint("Permission permanently denied. Redirecting to settings...");
      openAppSettings();
    }
  }

}
