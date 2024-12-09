import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../api/apartments_api/apartments.dart';

class ImagePrviewWidget extends ConsumerStatefulWidget {
  const ImagePrviewWidget(
      {super.key,
      required this.oneApartment,
      required this.index,
      required this.imageFileList});

  final DataOfOneApartment oneApartment;
  final int index;
  final List<XFile> imageFileList;

  @override
  ConsumerState createState() => _ImagePrviewWidgetState();
}

class _ImagePrviewWidgetState extends ConsumerState<ImagePrviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child:
      widget.oneApartment.photos != null &&
              widget.imageFileList != null &&
              widget.oneApartment.photos!.length > widget.index &&
              widget.imageFileList.length > widget.index
          ?
      Image.network(
              key: ValueKey(widget.imageFileList[widget.index].path),
              widget.imageFileList[widget.index].path,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            )
          :
      Image.file(
              File(
                widget.imageFileList[widget.index].path,
              ),
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
    );
  }
}
//
// class _ImagePrviewWidgetState extends ConsumerState<ImagePrviewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     var images = ref.watch(imageManagerNotifier).imageFiles;
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(7),
//       child: widget.oneApartment.photos != null &&
//           images != null &&
//           widget.oneApartment.photos!.length > widget.index &&
//           images.length > widget.index
//           ? Image.network(
//         key: ValueKey(images[widget.index].path),
//         images[widget.index].path,
//         height: 110,
//         width: 110,
//         fit: BoxFit.cover,
//       )
//           : Image.file(
//         File(
//           images?[widget.index].path ?? "",
//         ),
//         height: 110,
//         width: 110,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }