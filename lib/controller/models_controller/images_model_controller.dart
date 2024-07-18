import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

class ImagesModelController extends GetxController {
  List<String> images = [];
  List<XFile>? imageFiles;
  bool isImagesUploaded = false;
  Future<void> uploadImages() async {
    if (imageFiles == null ||
        imageFiles!.isEmpty && apartmentModelController.apartmentId == null ||
        apartmentModelController.apartmentId!.isEmpty) {
      debugPrint("No images selected. Or , the apartment id is not selected "
          "${apartmentModelController.apartmentId}");

      return;
    }

    // Replace
    // with actual
    // apartment ID
    Uri url =
        Uri.parse(ServerWeenBalaqee.uploadImages); // Replace with your API
    // endpoint

    var request = http.MultipartRequest('POST', url);
    request.fields['apartment_id'] = "${AddAdDataContainer.id}";
    debugPrint("the apartment_id :${request.fields['apartment_id']} , and the"
        "apartmentId : ${apartmentModelController.apartmentId}");

    for (XFile imageFile in imageFiles!) {
      var mimeType = lookupMimeType(imageFile.path);

      request.files.add(
        await http.MultipartFile.fromPath(
          'images[]',
          imageFile.path,
          contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
        ),
      );
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Images uploaded successfully.");
        isImagesUploaded = true;

        // Handle success response
      } else {
        debugPrint(
            "Failed to upload images. Status code: ${response.statusCode}");
        if (response.statusCode == 404) {
          debugPrint("and You got 404 , because one of those is null value "
              "imageFiles List:$imageFiles , apartmentId : "
              "${apartmentModelController.apartmentId} ");
        }
        // Handle failure response
      }
    } catch (e) {
      debugPrint("Error uploading images: $e");
      // Handle error
    }
  }
}