import 'package:image_picker/image_picker.dart';

/// that we have 2 Lists of XFile and 1 String list.
/// first , [imageFileList] that is the main list , it show the items in UI.
/// second , [newImages] that is the images from Gallery that if
/// [newImages] is not empty , automatically add it to [imageFileList].
/// thrid, [newImagesString] , that when click on save button to update
/// apartment UI , that when run update apartment images method api the
/// list of images should be a String list , the [newImagesString] is
/// automatically save the [imageFileList] items paths to could api to
/// update the images of apartment.

/// that the [pickedFile] is only from Camera and the same [newImage] it add to
/// [imageFileList] automatically.

/// the [imagesIds] list to saved the ids of images to delete
/// them by api method.

/// the [isLoading] to update the UI.

class ImageState {
  final List<XFile> newImages;
  final List<XFile>? imageFiles;
  final List<String> newImagesString;
  final List<int>  ?imagesIds;
  final XFile? pickedFile;
  final bool isLoading;


  ImageState({
    this.newImages = const [],
    this.imageFiles,
    this.newImagesString = const [],
    this.imagesIds = const [],
    this.pickedFile,
    this.isLoading = false,

  });

  ImageState copyWith({
    List<XFile>? newImages,
    List<XFile>? imageFiles,
    List<String>? newImagesString,
    List<int>? imagesIds = const [],
    XFile? pickedFile,
    bool? isLoading,

  }) {
    return ImageState(
      newImages: newImages ?? this.newImages,
      imageFiles: imageFiles ?? this.imageFiles,
      newImagesString: newImagesString ?? this.newImagesString,
      imagesIds: imagesIds ?? this.imagesIds,
      pickedFile: pickedFile ?? this.pickedFile,
      isLoading: isLoading ?? this.isLoading,

    );
  }
}
