import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:image_picker/image_picker.dart';



class ImageState {
  final List<String> images;
  final List<XFile>? imageFiles;
  final bool isImagesUploaded;
  final bool isLoading;

  ImageState({
    this.images = const [],
    this.imageFiles,
    this.isImagesUploaded = false,
    this.isLoading = false,
  });

  ImageState copyWith({
    List<String>? images,
    List<XFile>? imageFiles,
    bool? isImagesUploaded,
    bool? isLoading,
  }) {
    return ImageState(
      images: images ?? this.images,
      imageFiles: imageFiles ?? this.imageFiles,
      isImagesUploaded: isImagesUploaded ?? this.isImagesUploaded,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
