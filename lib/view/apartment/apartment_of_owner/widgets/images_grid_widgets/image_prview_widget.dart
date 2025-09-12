import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/images_grid_widgets/skeleton_image_widget.dart';

import '../../../../../api/apartments_api/apartments.dart';

class ImagePreviewWidget extends ConsumerStatefulWidget {
  const ImagePreviewWidget(
      {super.key,
      this.oneApartment,
      required this.index,
      required this.imageFileList});

  final DataOfOneApartment? oneApartment;
  final int index;
  final List<XFile> imageFileList;

  @override
  ConsumerState createState() => _ImagePreviewWidgetState();
}

class _ImagePreviewWidgetState extends ConsumerState<ImagePreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: widget.imageFileList[widget.index].path.contains('http') ||
            widget.imageFileList[widget.index].path.contains('https')
            ? Image.network(
                key: ValueKey(widget.imageFileList[widget.index].path),
                widget.imageFileList[widget.index].path,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const SkeletonImageWidget();
                },
              )
            : Image.file(
                File(
                  widget.imageFileList[widget.index].path,
                ),
                height: 110,
                width: 110,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const SkeletonImageWidget();
                },
              ));
  }
}
