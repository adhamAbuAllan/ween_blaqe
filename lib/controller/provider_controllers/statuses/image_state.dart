import 'package:file_selector/file_selector.dart';

class ImageState {
  final List<XFile> images;
  final List<String> newImages;//
  final List<int>? photosIds;
  final bool isLoading;

  ImageState({
    this.newImages = const [],
    this.photosIds = const [],
    this.isLoading = false,
    this.images = const [],
  });

  ImageState copyWith({
    List<String>? newImages,
    List<int>? photosIds = const [],
    bool? isLoading,
    List<XFile>? images,
  }) {
    return ImageState(
      newImages: newImages ?? this.newImages,
      photosIds: photosIds ?? this.photosIds,
      isLoading: isLoading ?? this.isLoading,
      images: images ?? this.images,
    );
  }
}
