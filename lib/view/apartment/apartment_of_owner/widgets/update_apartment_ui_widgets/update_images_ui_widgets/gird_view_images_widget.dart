import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/image_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/update_images_ui_widgets/skeleton_image_widget.dart';
import 'button_delete_image_widget.dart';
import 'image_prview_widget.dart';

class GridViewImagesWidget extends ConsumerStatefulWidget {
  const GridViewImagesWidget({
    super.key,
    required this.oneApartment,
    required this.canselImages,
    required this.images,
  });

  final DataOfOneApartment oneApartment;
  final List<String> canselImages;
  final List<XFile> images;

  @override
  ConsumerState createState() => _PrviewImagesWidgetState();
}

class _PrviewImagesWidgetState extends ConsumerState<GridViewImagesWidget> {
  @override
  Widget build(BuildContext context) {
    var isLoading = ref.watch(imageApiNotifier).isLoading;
    return Semantics(
      child: GridView.builder(
        padding: const EdgeInsets.only(right: 10),
        key: UniqueKey(),
        itemBuilder: (BuildContext context, int index) {
          return isLoading
              ? const SkeletonImageWidget()
              : Stack(children: [
                  Builder(builder: (context) {
                    return ImagePrviewWidget(
                        imageFileList: widget.images,
                        oneApartment: widget.oneApartment,
                        index: index);
                  }),
                  ButtonDeleteImageWidget(
                      oneApartment: widget.oneApartment,
                      onTap: () {
                        if (index >= 0 && index < widget.images.length) {
                          widget.images.removeAt(index);
                          setState(() {

                          });
                        }
                        widget.canselImages.add(widget.images[index].path);
                        debugPrint(
                            "widget.canselImages : ${widget.canselImages}");
                      }),
                ]);
        },
        itemCount: widget.images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
      ),
    );
  }
}
