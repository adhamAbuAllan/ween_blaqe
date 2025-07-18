import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/update_images_ui.dart';


import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class ImageGridFloatingButtonWidget<FloatingActionButtonWidget> extends ConsumerWidget {
  const ImageGridFloatingButtonWidget({
    super.key,
     this.oneApartment, this.onPressed,
     this.title});
final DataOfOneApartment ? oneApartment;
final void Function()? onPressed;
final String ? title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: onPressed?? () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateImagesUi(
            oneApartment: oneApartment,
          ),
        ));
      },
      label: Text(
      title??  SetLocalization.of(context)!
            .getTranslateValue("add_or_remove_images"),
        style: TextStyle(
            fontSize: getIt<AppDimension>().isSmallScreen(context)
                ? 13
                : null),
      ),
      icon: const Icon(Icons.photo),
      backgroundColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

    );
  }
}

SpeedDialChild imageGridFloatingButtonWidget({
  required BuildContext context,
  required WidgetRef ref,
  DataOfOneApartment? oneApartment,
  String? title,
  void Function()? onPressed,
}) {
  return SpeedDialChild(
    child: const Icon(Icons.photo, color: Colors.white),
    backgroundColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
    // label: title ??
    //     SetLocalization.of(context)!.getTranslateValue("add_or_remove_images"),
    onTap: onPressed ??
            () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UpdateImagesUi(
              oneApartment: oneApartment,
            ),
          ));
        },
  );
}