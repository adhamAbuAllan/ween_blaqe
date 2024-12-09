import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/update_images_ui'
    '.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class FloatingButtonAddDeleteImageWidget<FloatingActionButtonWidget> extends ConsumerWidget {
  const FloatingButtonAddDeleteImageWidget({super.key,required this.oneApartment});
final DataOfOneApartment ? oneApartment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
      WidgetsBinding.instance.addPostFrameCallback((_) async {

        // if(ref.watch(isSavedImages.notifier).state == false &&
        // ref.watch(imageManagerNotifier).imagesDeleted.isNotEmpty
        // ){
        //
        //   for(var item in ref.watch(imageManagerNotifier).imagesDeleted){
        //     ref.watch(imageManagerNotifier).imageFiles?.add(item);
        //   }
        //  // ref.read(imageManagerNotifier).imagesDeleted.clear();
        // }

      });
        // Get.to(ImagePickerTesting);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateImagesUi(
            oneApartment: oneApartment,
          ),
        ));
      },
      label: Text(
        SetLocalization.of(context)!
            .getTranslateValue("add_or_remove_images"),
        style: TextStyle(
            fontSize: getIt<AppDimension>().isSmallScreen(context)
                ? 13
                : null),
      ),
      icon: const Icon(Icons.photo),
      backgroundColor: themeMode.isLight
          ? kPrimaryColorLightMode
          : kPrimaryColorDarkMode,
    );
  }
}
