import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/status_of_apartment/image_state.dart';
import 'package:image/image.dart' as img;

// StateNotifier to manage the carousel index state for each apartment
class HybridImageNotifier extends StateNotifier<ImageState> {
  HybridImageNotifier() : super(ImageState());
  Future <void>? setImageFromApi(){
    return null;
  }
  // Future<void> setImageFromApi(
  //     {required WidgetRef ref,
  //       required DataOfOneApartment oneApartment}) async {
  //   state = state.copyWith(isLoading: true);
  //   state.imageFiles?.clear();
  //
  //   if (oneApartment.photos?.isNotEmpty ?? true) {
  //     state = state.copyWith(
  //         imageFiles:
  //         oneApartment.photos?.map((e) => XFile(e.url ?? "")).toList());
  //   }
  //   state = state.copyWith(isLoading: false);
  //
  //   debugPrint(
  //       "widget.oneApartment?.photos?.length : ${oneApartment.photos?.length}");
  //
  //   debugPrint(
  //       "ref.read(imageManagerNotifier).imageFiles?.length : ${state.imageFiles?.length}");
  // }
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


}

