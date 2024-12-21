import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'button_delete_image_widget.dart';
import 'image_prview_widget.dart';

class GridViewImagesWidget extends ConsumerStatefulWidget {
  const GridViewImagesWidget({
    super.key,
     this.oneApartment,
     this.canselImages,
    required this.images,
  });

  final DataOfOneApartment? oneApartment;
  final List<String>? canselImages;
  final List<XFile> images;

  @override
  ConsumerState createState() => _PreviewImagesWidgetState();
}

class _PreviewImagesWidgetState extends ConsumerState<GridViewImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Semantics(

      child: GridView.builder(
        key: UniqueKey(),
        itemBuilder: (BuildContext context, int index) {
          // Calculate the reversed index
          final reversedIndex = widget.images.length - 1 - index;

          return Stack(
            alignment:Alignment.center,
            children: [
              Builder(
                builder: (context) {
                  return ImagePreviewWidget(
                    imageFileList: widget.images,
                    oneApartment: widget.oneApartment,
                    index: reversedIndex,
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: ButtonDeleteImageWidget(
                  oneApartment: widget.oneApartment,
                  onTap: () {
                    if (reversedIndex >= 0 && reversedIndex < widget.images.length) {
                      widget.oneApartment?.photos?.removeWhere((photo) {
                        return photo.url == widget.images[reversedIndex].path;
                      });
                      final removedPath = widget.images[reversedIndex].path;
                      widget.images.removeAt(reversedIndex);

                      setState(() {
                        widget.canselImages?.add(removedPath);
                      });
                    }

                  },
                ),
              ),
            ],
          );
        },
        itemCount: widget.images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
      )
      ,
    );
  }
}
