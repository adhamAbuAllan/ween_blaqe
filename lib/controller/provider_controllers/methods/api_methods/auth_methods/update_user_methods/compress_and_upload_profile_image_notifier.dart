import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/auth_state.dart';
import 'package:ween_blaqe/main.dart';

import '../../../../../../constants/strings.dart';

class CompressAndUploadProfileImageNotifier extends StateNotifier<AuthState> {
  CompressAndUploadProfileImageNotifier() : super(AuthState());
/// a [compressAndUploadProfileImage] method usage to set or update image of 
/// user with compress it.
  Future<void> compressAndUploadProfileImage(
      XFile imageFile, WidgetRef ref, BuildContext context) async {
    Uri url = Uri.parse(
        ServerWeenBalaqee.createProfileImage); // Your profile image endpoint
    state = state.copyWith(isLoading: true);

    var request = http.MultipartRequest('POST', url);

    request.fields['id'] = (await sp).get(PrefKeys.id).toString(); // User ID

    var mimeType = lookupMimeType(imageFile.path);
    int imageSize = await imageFile.length();
    var imageBytes = await imageFile.readAsBytes();
    var image = img.decodeImage(imageBytes);
    int quality =
        (imageSize > 1000000) ? 50 : 75; // Adjust quality based on size

    var compressedImage = img.encodeJpg(image!, quality: quality);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/${imageFile.name}');
    await tempFile.writeAsBytes(compressedImage);

    request.files.add(
      await http.MultipartFile.fromPath(
        'profile', // Field name for profile image
        tempFile.path,
        contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
      ),
    );
    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      state = state.copyWith(isLoading: false);
      // ref.read(loadProfileImageNotifier.notifier).loadProfileImage(ref);
      debugPrint('Profile image uploaded successfully');
      // Handle success
    } else {
      state = state.copyWith(isLoading: false);
      debugPrint('Profile image upload failed');
      // Handle failure
    }
  }
}
