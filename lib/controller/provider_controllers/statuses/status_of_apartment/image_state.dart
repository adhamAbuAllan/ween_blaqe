
class ImageState {
  final bool isLoading;

  ImageState({
    this.isLoading = false,
  });

  ImageState copyWith({
    bool? isLoading,
  }) {
    return ImageState(

      isLoading: isLoading ?? this.isLoading,
    );
  }
}
