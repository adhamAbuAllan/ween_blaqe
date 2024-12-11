import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/update_images_ui_widgets'
    '/floating_buttons_add_images_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/update_apartment_ui_widgets/update_images_ui_widgets/gird_view_images_widget.dart';

import '../../../api/apartments_api/apartments.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';
import '../../../core/utils/styles/button.dart';

class UpdateImagesUi extends ConsumerStatefulWidget {
  const UpdateImagesUi({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _UpdateImagesUiState();
}

class _UpdateImagesUiState extends ConsumerState<UpdateImagesUi> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      ref.read(fetchApartmentNotifier.notifier).fetchApartments(
        isOwnerApartments: false,
      );

      var apartmentsOfOwnerNotifer = ref
          .read(fetchApartmentNotifier)
          .apartmentsList
          .data
          ?.where((e) => e.id == widget.oneApartment?.id);
      var imagesApi = apartmentsOfOwnerNotifer?.first.photos;



      ref
          .read(imageLocalNotifier.notifier)
          .initState(ref: ref, apiPhotos: imagesApi);
    });
  }

  // late final List<XFile> _apiList;

  // final ImagePicker _picker = ImagePicker();

  // final List<String> apiImagesList = [];

  @override
  Widget build(BuildContext context) {
    final List<String> cancelImages = [];
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        title: Text(
          "Testing Code",
          style: TextStyle(
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              fontSize: 18),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
                horizontal:
                    getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);

                ref.read(photosIds.notifier).state.clear();
                debugPrint('photosIds = ${ref.read(photosIds)}');
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
              onPressed: cancelImages.isNotEmpty ||
                      ref.watch(imageLocalNotifier).newImages.isNotEmpty
                  ? () {
                      if (ref.watch(imageLocalNotifier).images.length < 3) {
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
                            cancelImages: cancelImages);
                      });
                      debugPrint("cancelImages = $cancelImages");
                      debugPrint("photosIds prodiver = ${ref.read(photosIds)}");
                      debugPrint("newImages provider = ${ref.read(newImages)}");
                      debugPrint("newImages Notifier = ${ref.read
                        (imageLocalNotifier).newImages}");
                      debugPrint("photosIds notifier = ${ref.read
                        (imageLocalNotifier).photosIds}");


                      Navigator.pop(context);
                    }
                  : () {


                debugPrint("cancelImages = $cancelImages");
                debugPrint("photosIds prodiver = ${ref.read(photosIds)}");
                debugPrint("newImages provider = ${ref.read(newImages)}");
                debugPrint("newImages Notifier = ${ref.read
                  (imageLocalNotifier).newImages}");
                debugPrint("photosIds notifier = ${ref.read
                  (imageLocalNotifier).photosIds}");


                ref
                          .read(showSnackBarNotifier.notifier)
                          .showNormalSnackBar(
                              context: context,
                              message: SetLocalization.of(context)!
                                  .getTranslateValue("no_changes_made_yet"));
                      return;
                    },
              style: fullButton(),
              child:
                  Text(SetLocalization.of(context)!.getTranslateValue("done")),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              ref.read(imageLocalNotifier).isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
              GridViewImagesWidget(
                oneApartment: widget.oneApartment ?? DataOfOneApartment(),
                canselImages: cancelImages,
                images: ref.watch(imageLocalNotifier).images
              )
            ],
          )),
      floatingActionButton: const FloatingButtonsAddImagesWidgets(),
    );
  }
}
