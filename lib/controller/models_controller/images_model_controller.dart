import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_common/get_reset.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

import 'package:image/image.dart' as img;

import 'package:path_provider/path_provider.dart';
import 'dart:io';

// import '../../api/photos.dart';
import '../../main.dart';

class ImagesModelController extends GetxController {
  List<String> images = [];
  List<XFile>? imageFiles;
  bool isImagesUploaded = false;
  RxBool isLoading = false.obs;
  List<int> photoWillDeleteIds = [];

  Future<void> deleteImages(int apartmentId, List<int> photoIds) async {
    isLoading.value = true;

    for (int photoId in photoIds) {
      final url = Uri.parse(ServerWeenBalaqee.deleteImage);
      var token = (await sp).get("token");
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        'apartment_id': apartmentId,
        'photo_id': photoId,
      });

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          debugPrint('Image deleted successfully');
        } else {
          debugPrint('Failed to delete image: ${response.body}');
        }
      } catch (e) {
        debugPrint('Error deleting image: $e');
      }
    }

    isLoading.value = false;
  }

  Future<void> compressAndUploadImages(
      {bool? isForUpdate, int apartmentIdToUpdate = -1}) async {
    Uri url = Uri.parse(ServerWeenBalaqee.uploadImages);
    var request = http.MultipartRequest('POST', url);
    request.fields['apartment_id'] = isForUpdate ?? false
        ? apartmentIdToUpdate.toString()
        : "${AddAdDataContainer.id}";
    if (isForUpdate ?? false) {
      if (images.isNotEmpty) {
        for (String imagePath in images) {
          var mimeType = lookupMimeType(imagePath);
          File imageFile =
              File(imagePath); // Create a File object from the path
          int imageSize = await imageFile.length();
          var imageBytes = await imageFile.readAsBytes();
          var image = img.decodeImage(imageBytes);
          int quality = (imageSize > 1000000) ? 50 : 75;

          var compressedImage = img.encodeJpg(image!, quality: quality);
          Directory tempDir = await getTemporaryDirectory();
          File tempFile =
              File('${tempDir.path}/${imageFile.path.split('/').last}');
          await tempFile.writeAsBytes(compressedImage);
          request.files.add(
            await http.MultipartFile.fromPath(
              'images[]',
              tempFile.path,
              contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
            ),
          );
        }
      }
      var response = await request.send();
      if (response.statusCode == 200) {
        isImagesUploaded = true;
        debugPrint('Upload successful');
      } else {
        debugPrint('Upload failed');
      }
    }
    if (imageFiles == null ||
        imageFiles!.isEmpty && apartmentModelController.apartmentId == null ||
        apartmentModelController.apartmentId!.isEmpty) {
      return;
    }
    for (XFile imageFile in imageFiles!) {
      var mimeType = lookupMimeType(imageFile.path);
      int imageSize = await imageFile.length();
      var imageBytes = await imageFile.readAsBytes();
      var image = img.decodeImage(imageBytes);
      int quality = (imageSize > 1000000) ? 50 : 75; // Example: Use quality
      // 50 if image size > 1MB

      var compressedImage = img.encodeJpg(image!, quality: quality);
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${imageFile.name}');
      await tempFile.writeAsBytes(compressedImage);
      request.files.add(
        await http.MultipartFile.fromPath(
          'images[]',
          tempFile.path,
          contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
        ),
      );
      var response = await request.send();
      if (response.statusCode == 200) {
        isImagesUploaded = true;
        debugPrint('Upload successful');
      } else {
        debugPrint('Upload failed');
      }
    }

  }

//////////////////// for testing /////////////////////
// Future<void> uploadImages() async {
//   if (imageFiles == null ||
//       imageFiles!.isEmpty && apartmentModelController.apartmentId == null ||
//       apartmentModelController.apartmentId!.isEmpty) {
//     debugPrint("No images selected. Or , the apartment id is not selected "
//         "${apartmentModelController.apartmentId}");
//
//     return;
//   }
//
//   // Replace
//   // with actual
//   // apartment ID
//   Uri url =
//       Uri.parse(ServerWeenBalaqee.uploadImages); // Replace with your API
//   // endpoint
//
//   var request = http.MultipartRequest('POST', url);
//   request.fields['apartment_id'] = "${AddAdDataContainer.id}";
//   debugPrint("the apartment_id :${request.fields['apartment_id']} , and the"
//       "apartmentId : ${apartmentModelController.apartmentId}");
//
//   for (XFile imageFile in imageFiles!) {
//     var mimeType = lookupMimeType(imageFile.path);
//
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'images[]',
//         imageFile.path,
//         contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
//       ),
//     );
//   }
//
//   try {
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       debugPrint("Images uploaded successfully.");
//       isImagesUploaded = true;
//
//       // Handle success response
//     } else {
//       debugPrint(
//           "Failed to upload images. Status code: ${response.statusCode}");
//       if (response.statusCode == 404) {
//         debugPrint("and You got 404 , because one of those is null value "
//             "imageFiles List:$imageFiles , apartmentId : "
//             "${apartmentModelController.apartmentId} ");
//       }
//       // Handle failure response
//     }
//   } catch (e) {
//     debugPrint("Error uploading images: $e");
//     // Handle error
//   }
// }
}
