import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/update_images_ui_widgets'
    '/floating_buttons_add_images_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/update_apartment_ui_widgets/update_images_ui_widgets/gird_view_images_widget.dart';

import '../../../api/apartments_api/apartments.dart';

import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';
import 'widgets/update_apartment_ui_widgets/update_images_ui_widgets/appbar_widget.dart';

class UpdateImagesUi extends ConsumerStatefulWidget {
  const UpdateImagesUi({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _UpdateImagesUiState();
}

class _UpdateImagesUiState extends ConsumerState<UpdateImagesUi> {
  late List<XFile> images;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //you should to know taht if you that to make the images as a list that
      // after save or after click on ok button that you should to check the
      //ids of cansel images and then you should to make the images , add the
      // images from api that is not in the list of ids Or cansel images !

      setState(() {});
      // ref.read(imageLocalNotifier.notifier).initState(
      //       ref: ref,
      //     );
      // if(ref.read(imageLocalNotifier).images.isNotEmpty){
      //   images = ref.watch(imageLocalNotifier).images;
      //
      // }

      var imagesApi = widget.oneApartment?.photos;
      // if(ref.read(imageLocalNotifier).images.isNotEmpty){
      //   images = ref.watch(imageLocalNotifier).images;
      //   debugPrint("images = $images");
      // }
      debugPrint("images notfier = ${ref.watch(imageLocalNotifier).images}");
      if(ref.read(imagesFileList.notifier).state.isNotEmpty){
        images = ref.watch(imagesFileList.notifier).state;
      }else{
        images = imagesApi?.map((e) => XFile(e.url ?? "")).toList() ?? [];

      }
      // if(ref.read(newImagesNotifier.notifier).state.isNotEmpty){
      //   for(var image in ref.read(newImagesNotifier.notifier).state){
      //    newImagesLocal.add(image);
      //   }
      //
      //   // images = ref.read(newImagesNotifier.notifier).state;
      //
      // }

      // if (ref.watch(newImagesNotifier.notifier).state.isEmpty) {
      //   debugPrint("true");
      //   images = imagesApi?.map((e) => XFile(e.url ?? "")).toList() ?? [];
      // } else {
      //   for (var image in ref.read(imageLocalNotifier).images) {
      //     debugPrint("false");
      //     // images.add(image);
      //     images = imagesApi?.map((e) => XFile(e.url ?? "")).toList() ?? [];
      //
      //     // images = ref.watch(imageLocalNotifier).images;
      //
      //
      //     // debugPrint("imagesNotifier ${ref.read(images)}");
      //   }
      // }
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
