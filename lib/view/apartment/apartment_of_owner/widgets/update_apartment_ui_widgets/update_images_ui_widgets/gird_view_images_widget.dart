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
  const GridViewImagesWidget(
      {super.key,
      required this.oneApartment,
      this.imageFileList,
      this.photosIds});

  final DataOfOneApartment oneApartment;
  final List<XFile>? imageFileList;
  final List<int>? photosIds;

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
                        imageFileList: widget.imageFileList ?? [],
                        oneApartment: widget.oneApartment,
                        index: index);
                  }),
                  ButtonDeleteImageWidget(
                      index: index,
                      oneApartment: widget.oneApartment,
                      imageFileList: widget.imageFileList,
                      photosIds: widget.photosIds,
                      onTap: () {
                        setState(() {
                          widget.oneApartment.photos?.removeWhere((photo) {
                            if (photo.url ==
                                widget.imageFileList![index].path) {
                              if (photo.id != null) {
                                widget.photosIds?.add(photo.id!);
                                debugPrint("photosIds -- ${widget.photosIds}");

                              }
                              return true;
                            }
                            return false;
                          });
                          widget.imageFileList?.removeAt(index);

                        });
                      })
                ]);
        },
        itemCount: widget.imageFileList?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
      ),
    );
  }
}
