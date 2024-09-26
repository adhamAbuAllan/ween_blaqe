// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
// import 'package:ween_blaqe/features/user/owner/steps_to_create_apartment/fourth_step.dart';

// import 'package:video_player/video_player.dart';
class UpdateImages extends StatefulWidget {
  const UpdateImages(
      {super.key, this.title, required this.oneApartmentId, this.oneApartment});

  final String? title;
  final int oneApartmentId;
  final DataOfOneApartment? oneApartment;

  @override
  State<UpdateImages> createState() => _UpdateImagesState();
}

class _UpdateImagesState extends State<UpdateImages> {
  @override
  void initState() {
    super.initState();
    if (widget.oneApartment?.photos != null) {
      _imageFileList = widget.oneApartment?.photos
          ?.map((photo) => XFile(photo.url ?? ""))
          .toList();
    }
    if (imagesModelController.images.isNotEmpty) {
      imagesModelController.images =
          imagesModelController.images.toSet().toList();
      for (var photo in imagesModelController.images) {
        _imageFileList?.add(XFile(photo));
      }
    }
    // if (imagesModelController.imageFiles != null) {
    //   for (var photo in imagesModelController.imageFiles ?? []) {
    //     _imageFileList?.add(photo);
    //   }
    // }
  }

  List<XFile>? _imageFileList;

  dynamic _pickImageError;
  String? _retrieveDataError;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  // the user should delete an images that is same ting ,
//in a another way , you should could make user couldn't add an image 2 times ,
//that mean if an image is added , that programmatically make image is selected

  @override
  void dispose() {
    // _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  List<int> photosWillDeleteIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isDark
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeMode.isDark
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        title: Text(
          "Testing Code",
          style: TextStyle(
              color: themeMode.isDark
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                // imagesModelController.photoWillDeleteIds.clear();
                Navigator.pop(context);
              },
              style: outlineButton,
              child: const Text(" إلغاء "),
            ),
          ),
          const Expanded(child: Text("")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: checkArray,
              style: fullButton,
              child: const Text("تم"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Center(
          child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
              ? FutureBuilder<void>(
                  future: retrieveLostData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: const SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: 100,
                                width: 100,
                              ),
                            ));
                      case ConnectionState.done:
                        return _handlePreview();
                      case ConnectionState.active:
                        if (snapshot.hasError) {
                          return Text(
                            ': خطأ ${snapshot.error}}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'IBM',
                            ),
                          );
                        } else {
                          return const Text(
                            '',
                            textAlign: TextAlign.center,
                          );
                        }
                    }
                  },
                )
              : _handlePreview(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Semantics(
          //   label: 'image_picker_example_from_gallery',
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       _onImageButtonPressed(ImageSource.gallery, context: context);
          //     },
          //     heroTag: 'image0',
          //     tooltip: 'Pick Image from gallery',
          //     child: const Icon(Icons.photo),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                  isMultiImage: true,
                );
              },
              heroTag: 'image0',
              backgroundColor: Colors.orange,
              tooltip: 'أضف صور من المعرض',
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(
                  ImageSource.camera,
                  context: context,
                );
              },
              heroTag: 'image1',
              tooltip: 'إلتقط صورة',
              backgroundColor: Colors.orange,
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }

// a widget that display the preview of images
  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
        // label: 'image_picker_example_picked_images',
        child: GridView.builder(
          padding: const EdgeInsets.only(right: 10),
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
            return Obx(() {
              return imagesModelController.isLoading.value
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          height: 110,
                          width: 110,
                        ),
                      ))
                  : Stack(children: [
                      Builder(builder: (context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: widget.oneApartment?.photos != null &&
                                  _imageFileList != null &&
                                  widget.oneApartment!.photos!.length > index &&
                                  _imageFileList!.length > index
                              ? Image.network(
                                  key: ValueKey(_imageFileList?[index].path),
                                  _imageFileList?[index].path ?? "null",
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(
                                    _imageFileList?[index].path ?? "",
                                  ),
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                        );
                      }),
                      Positioned(
                          left: 20.0,
                          top: 2,
                          child: GestureDetector(
                            child: const Icon(
                              Icons.cancel,
                              color: Color(0xf0e09000),
                            ),
                            onTap: () {
                              setState(() {
                                widget.oneApartment?.photos?.removeWhere((p) {
                                  if (p.url == _imageFileList![index].path) {
                                    if (p.id != null) {
                                      photosWillDeleteIds.add(p.id!);
                                    }
                                    return true; // Remove the photo from widget.oneApartment?.photos
                                  }
                                  return false;
                                  // Keep the photo in widget.oneApartment?.photos
                                });
                                // for (var controllerPhoto in imagesModelController.images) {
                                //   if (controllerPhoto == _imageFileList![index]
                                //       .path ) {
                                //     debugPrint("controller photo is : $controllerPhoto");
                                //
                                //   }}
                                _imageFileList?.removeAt(index);
                              });

                            },
                          )),
                    ]);
            });
          },
          itemCount: _imageFileList?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // childAspectRatio: 0,
            // mainAxisExtent: 5
          ),
        ),
      );
    }
    else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    }
    else if (_imageFileList == null) {
      return Text(
        'تُعرض الصور المختارة هنا',
        style: TextStyle(
          fontFamily: 'IBM',
          color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
        ),
        textAlign: TextAlign.center,
      );
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            height: 100,
            width: 100,
          ),
        ));
  }

//floating button method display dialog
  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'إضافة صور للشقة',
              style: TextStyle(
                fontFamily: 'IBM',
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  style: fullButton,
                  child: const Text('إضافة'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: outlineButton,
                  child: const Text(
                    'رجوع',
                  ),
                ),
              ),
            ],
          );
        });
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  //floating button : to add image in _imageFileList if user and to add more
  // images from gallery
  void _setImageFileListFromFile(XFile? value) {
    if (_imageFileList != null) {
      debugPrint("_image file list not null ${_imageFileList?.length}");
      for (var item in _imageFileList ?? []) {
        _imageFileList?.add(value ?? XFile("$value"));
        debugPrint("item path : ${item.path}");
      }
    }else{
      _imageFileList = <XFile>[value ?? XFile("$value")];
      // _imageFileList = value == null ? null : <XFile>[value];
    }

  }

  //floating button: to check if user want to add more images from gallery
  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    requestPhotoPermission();

    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            if (_imageFileList != null) {
              for (var images in pickedFileList) {
                setState(() {
                  _imageFileList?.add(images);
                  debugPrint("the pickedFileList is : $images");
                });
              }
            } else {
              setState(() {
                _imageFileList = pickedFileList;
              });
            }
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _setImageFileListFromFile(pickedFile);
            if (pickedFile != null) {
              debugPrint("the pickedFile is : $pickedFile");
            }
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }

// a method run when click ok button fullButton
  checkArray() {
    if (_imageFileList != null) {
      for (var image in _imageFileList ?? []) {
        if (!isImageUrl(image.path)) {
          // Check if the image is not from API
          debugPrint("the image is not from api");
          setState(() {
            imagesModelController.images.add(image.path);
            debugPrint(
                "images in image controller is : ${imagesModelController.images}");
          });
        }
      }
      //that to delete images for api after click ok button
      imagesModelController.photoWillDeleteIds = photosWillDeleteIds;
      debugPrint(
          "the photos id that will deleted is : ${imagesModelController.photoWillDeleteIds}");
      // setState(() {
      //   imagesModelController.imageFiles = _imageFileList;
      // });
      // if (_imageFileList?.isNotEmpty ??
      //     true && imagesModelController.photoWillDeleteIds.isEmpty) {
      //   return;
      // }
      Navigator.pop(context);
    } else {}
    return null;
  }

// Helper function to check if a path is an imageURL
  bool isImageUrl(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    // if (response.isEmpty) {
    //   return;
    // }
    if (response.file != null) {
      setState(() {
        if (response.files == null) {
          _setImageFileListFromFile(response.file);
        } else {
          _imageFileList = response.files;
        }
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Future<void> requestPhotoPermission() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      // Permission granted, proceed with image picking
    } else if (status.isDenied) {
      // Permission denied, handle accordingly (e.g., show a dialog)
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, guide the user to app settings
      // openAppSettings();
    }
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

/*
for ask
Select a suggested title that best summarizes your question, or write your own title.

How to Upload Multiple Images with Flutter and Laravel using HTTP and JSON?

What's the Best Way to Send HTTP Requests from Flutter to a Laravel API for Uploading Multiple Images?

Uploading Multiple Images from Flutter to Laravel API Using HTTP and JSON: Best Practices

Write your own title.

 */
