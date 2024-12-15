import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../methods/api_methods/apartment_methods/images_of_apartment_notifier.dart';
import '../methods/hybrid_methods/hybrid_image_notifier.dart';
import '../methods/local_methods/image_grid_notifier.dart';
import '../methods/local_methods/permission_notifier.dart';
import '../statuses/image_state.dart';
import '../statuses/permission_state.dart';
final imageHybridNotifer =
StateNotifierProvider<HybridImageNotifier,ImageState>((ref) {
  return HybridImageNotifier();
});
final imageApiNotifier = StateNotifierProvider<ImageApiNotifier, ImageState>(
      (ref) => ImageApiNotifier(),
);

final imageLocalNotifier = StateNotifierProvider<ImageLocalNotifier,
    ImageState>(
      (ref) => ImageLocalNotifier(),
);

final imagePicker = StateProvider<ImagePicker?>((ref) => ImagePicker());
final imagesFileList = StateProvider<List<XFile>>((ref) => []);
final newImagesNotifier = StateProvider<List<String>>((ref) => []);
final cancelImagesNotifier = StateProvider<List<String>>((ref) => []);
final permissionNotifier = StateNotifierProvider<PermissionNotifier,
    PermissionState>((ref) {
  return PermissionNotifier();
});
final isApartmentImagesUpdated = StateProvider<bool>((ref) => false);
