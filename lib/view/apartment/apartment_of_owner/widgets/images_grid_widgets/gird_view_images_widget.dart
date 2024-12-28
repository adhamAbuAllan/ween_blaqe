import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../controller/provider_controllers/providers/image_provider.dart';
import 'button_delete_image_widget.dart';
import 'image_prview_widget.dart';

class GridViewImagesWidget extends ConsumerStatefulWidget {
  const GridViewImagesWidget({
    super.key,
    this.oneApartment,
    required this.canselImages,
    required this.images,
  });

  final DataOfOneApartment? oneApartment;
  final List<String> canselImages;
  final List<XFile> images;

  @override
  ConsumerState createState() => _PreviewImagesWidgetState();
}

class _PreviewImagesWidgetState extends ConsumerState<GridViewImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty &&  ref.watch(imageLocalNotifier).isLoading
        == false
        ? const DefultEmptyGridWidget()
        : Semantics(
            child: GridView.builder(
              key: UniqueKey(),
              itemBuilder: (BuildContext context, int index) {
                // Calculate the reversed index
                final reversedIndex = widget.images.length - 1 - index;

                return Stack(
                  alignment: Alignment.center,
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
                          if (reversedIndex >= 0 &&
                              reversedIndex < widget.images.length) {
                            widget.oneApartment?.photos?.removeWhere((photo) {
                              return photo.url ==
                                  widget.images[reversedIndex].path;
                            });
                            final removedPath =
                                widget.images[reversedIndex].path;
                            widget.images.removeAt(reversedIndex);

                            setState(() {
                              widget.canselImages.add(removedPath);

                              debugPrint(
                                  "widget.cansleImages is ${widget.canselImages}");
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
            ),
          );
  }
}

class DefultEmptyGridWidget extends ConsumerWidget {
  const DefultEmptyGridWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.grid_view_rounded,
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            size: getIt<AppDimension>().isSmallScreen(context) ?120 :150,
          ),
          Text(
            "${SetLocalization.of(context)?.getTranslateValue("selected_images_displayed_here")}",
            style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),fontSize:
            //check screen size
            getIt<AppDimension>().isSmallScreen(context) ? 16 :
            18),
          ),
        ],
      ),
    );
  }
}
