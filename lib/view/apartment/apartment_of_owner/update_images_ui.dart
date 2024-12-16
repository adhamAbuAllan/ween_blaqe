import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/images_grid_widgets/floating_buttons_add_images_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/images_grid_widgets/gird_view_images_widget.dart';

import '../../../api/apartments_api/apartments.dart';

import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';
import 'widgets/images_grid_widgets/appbar_widget.dart';

class UpdateImagesUi extends ConsumerStatefulWidget {
  const UpdateImagesUi({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _UpdateImagesUiState();
}

class _UpdateImagesUiState extends ConsumerState<UpdateImagesUi> {
  late List<XFile> images = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      ref.read(newImagesNotifier.notifier).state = [];
      var imagesApi = widget.oneApartment?.photos;
      if(ref.read(imagesFileList.notifier).state.isNotEmpty){
        images = ref.watch(imagesFileList.notifier).state;
      }else{
        images = imagesApi?.map((e) => XFile(e.url ?? "")).toList() ?? [];

      }
    });
  }

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    final List<String> cancelImages = [];

    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBarGridWidget(
        oneApartment: widget.oneApartment,
        cancelImages: cancelImages,
        newImages: ref.watch(newImagesNotifier.notifier).state,
        images: images,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              ref.watch(imageLocalNotifier).isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
              GridViewImagesWidget(
                  oneApartment: widget.oneApartment ?? DataOfOneApartment(),
                  canselImages: cancelImages,
                  images: images)
            ],
          )),
      floatingActionButton: FloatingButtonsAddImagesWidgets(
        imagePicker: imagePicker,
        images: images,
      ),
    );
  }
}
