import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/images_grid_widgets/floating_buttons_add_images_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/images_grid_widgets/gird_view_images_widget.dart';

import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/image_provider.dart';
import '../widgets/images_grid_widgets/grid_images_appbar_widget.dart';

class AddImageUi extends ConsumerStatefulWidget {
  const AddImageUi({super.key});

  @override
  ConsumerState createState() => _AddImageUiState();
}

class _AddImageUiState extends ConsumerState<AddImageUi> {
  late List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      ref.read(newImagesNotifier.notifier).state = [];
      if (ref.read(imagesFileList.notifier).state.isNotEmpty) {
        images = ref.watch(imagesFileList.notifier).state;
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
        newImages: ref.watch(newImagesNotifier.notifier).state,
        images: images,
        cancelImages: cancelImages,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              ref.watch(imageLocalNotifier).isLoading
                  ?  Center(
                      child: CircularProgressIndicator(color: themeMode
                          .isLight ? kPrimaryColorLightMode :  kPrimaryColorDarkMode,),
                    )
                  : const SizedBox(),
              GridViewImagesWidget(
                images: images,
                canselImages: cancelImages,
              )
            ],
          )),
      floatingActionButton: FloatingButtonsAddImagesWidgets(
        imagePicker: imagePicker,
        images: images,
      ),
    );
  }
}
