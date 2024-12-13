import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../controller/provider_controllers/providers/image_provider.dart';
import '../../../../../../controller/provider_controllers/providers/snack_bar_provider.dart';
import '../../../../../../core/utils/styles/button.dart';
class AppBarGridWidget extends ConsumerStatefulWidget implements
    PreferredSizeWidget {
  const AppBarGridWidget({super.key,
    required this.cancelImages,
    required this.newImages,
  required  this.images,

     this.oneApartment,});
final List<String> cancelImages;
final List<String> newImages;
final List<XFile> images;
final DataOfOneApartment? oneApartment;
  @override
  ConsumerState createState() => _AppBarGridWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
class _AppBarGridWidgetState extends ConsumerState<AppBarGridWidget>   {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,

      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
              horizontal:
              getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
              });
              Navigator.pop(context);


            },
            style: outlinedButton(themeMode: themeMode, context: context),
            child: Text(
                SetLocalization.of(context)!.getTranslateValue("cancel")),
          ),
        ),
        const Expanded(child: Text("")),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
              horizontal:
              getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
          child: ElevatedButton(
            onPressed: (){
              if( widget.cancelImages.isNotEmpty ||
                  widget.newImages.isNotEmpty){
                if (widget.images.length < 3) {
                  ref
                      .read(showSnackBarNotifier.notifier)
                      .showNormalSnackBar(
                      context: context,
                      message: SetLocalization.of(context)!
                          .getTranslateValue(
                          "should_be_at_least_three_photos"));
                  return;
                }
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  ref.read(imageLocalNotifier.notifier).doneState(
                    ref: ref,
                    apiPhotos: widget.oneApartment?.photos ?? [],
                    cancelImages: widget.cancelImages,
                    images: widget.images,
                  );

                });
                Navigator.pop(context);
              }else{
                ref
                    .read(showSnackBarNotifier.notifier)
                    .showNormalSnackBar(
                    context: context,
                    message: SetLocalization.of(context)!
                        .getTranslateValue("no_changes_made_yet"));
                setState(() {

                });
                return;
              }

            },
            style: fullButton(),
            child:
            Text(SetLocalization.of(context)!.getTranslateValue("done")),
          ),
        ),
      ],
    );
  }
}
