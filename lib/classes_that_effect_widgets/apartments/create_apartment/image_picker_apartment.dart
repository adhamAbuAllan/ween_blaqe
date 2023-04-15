// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';
// import 'package:video_player/video_player.dart';

class AddImages extends StatefulWidget {
  const AddImages({super.key, this.title});

  final String? title;

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
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
            _imageFileList = pickedFileList;
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
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    // _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
        // label: 'image_picker_example_picked_images',
        child: GridView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            // Why network for web?
            // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
            return Stack(children: [
              Image.file(
                File(
                  _imageFileList![index].path,
                ),
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 15.0,
                  top: 2,
                  child: GestureDetector(
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white70,
                    ),
                    onTap: (){
                      setState(() {
                        _imageFileList!.removeAt(index);

                      });
                    },
                  ))
            ]);
          },
          itemCount: _imageFileList!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // childAspectRatio: 0,
            // mainAxisExtent: 5
          ),
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'تُعرض الصور المختارة هنا',
        style: TextStyle(fontFamily: 'IBM'),
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }

  Widget? checkArray() {
    if (_imageFileList != null) {
      Get.to(FourthStep());
    } else {
      toast("أضف صورة واحدة على الاقل");
    }
    return null;
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: outlineButton,
              child: const Text(" رجوع "),
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
                        return const Text(
                          '',
                          style: TextStyle(
                            fontFamily: 'IBM',
                          ),
                          textAlign: TextAlign.center,
                        );
                      case ConnectionState.done:
                        return _handlePreview();
                      case ConnectionState.active:
                        if (snapshot.hasError) {
                          return Text(
                            ': خطأ ${snapshot.error}}',
                            textAlign: TextAlign.center,
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
                _onImageButtonPressed(ImageSource.camera, context: context);
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

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

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
            // content: Column(
            //   children: <Widget>[
            //     TextField(
            //       controller: maxWidthController,
            //       keyboardType:
            //       const TextInputType.numberWithOptions(decimal: true),
            //       decoration: const InputDecoration(
            //           hintText: 'Enter maxWidth if desired'),
            //     ),
            //     TextField(
            //       controller: maxHeightController,
            //       keyboardType:
            //       const TextInputType.numberWithOptions(decimal: true),
            //       decoration: const InputDecoration(
            //           hintText: 'Enter maxHeight if desired'),
            //     ),
            //     TextField(
            //       controller: qualityController,
            //       keyboardType: TextInputType.number,
            //       decoration: const InputDecoration(
            //           hintText: 'Enter quality if desired'),
            //     ),
            //   ],
            // ),
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
                  child: const Text(
                    'رجوع',
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: outlineButton,
                ),
              ),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
