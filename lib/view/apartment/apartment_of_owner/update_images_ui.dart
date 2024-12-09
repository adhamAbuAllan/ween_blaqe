import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/update_images_ui_widgets'
    '/floating_buttons_add_images_widgets.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/update_images_ui_widgets'
    '/skeleton_image_widget'
    '.dart';

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
    var apartmentsOfOwnerNotifer = ref
        .read(fetchApartmentNotifier)
        .apartmentsList
        .data
        ?.where((e) => e.id == widget.oneApartment?.id);
    var imagesApi = apartmentsOfOwnerNotifer?.first.photos;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(imageLocalNotifier.notifier).initializeImageFileList(
          ref: ref, photosOfCurrentApartment: imagesApi);

     debugPrint("imageFiles = ${ref.read(imageApiNotifier).imageFiles}");
      debugPrint("new images = ${ref.read(imageLocalNotifier).newImages}");
      debugPrint("ids photos will delted = $_photoWillDeleteIds");
    });
  }
 // late final List<XFile> _apiList;
  final List<int> _photoWillDeleteIds = [];
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var imageFileList = ref.watch(imageApiNotifier).imageFiles;
    var pickedFile = ref.watch(imageLocalNotifier).pickedFile;
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
              onPressed:
              ref.watch(imageLocalNotifier).imagesIds?.isNotEmpty??false
                  ? () {
                if(   ref.watch(imageLocalNotifier).newImages.isNotEmpty){
                  ref
                      .read(showSnackBarNotifier.notifier)
                      .showNormalSnackBar(
                      context: context,
                      message: SetLocalization.of(context)!
                          .getTranslateValue("no_changes_made_yet"));
                  return;
                }
                      if (imageFileList?.isEmpty ?? false) {
                        ref
                            .read(showSnackBarNotifier.notifier)
                            .showNormalSnackBar(
                                context: context,
                                message: "a list should not be empty");

                        return;
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        ref.read(imageLocalNotifier.notifier).checkArray(
                            imageFileList: imageFileList,
                            context: context,
                            imagesIds: _photoWillDeleteIds,
                            ref: ref);
                      });
                    }
                  : () {
                      debugPrint("photoWillDeleteIds = $_photoWillDeleteIds");
                      debugPrint(
                          "newImages = ${ref.read(imageLocalNotifier).newImages}");
                      ref
                          .read(showSnackBarNotifier.notifier)
                          .showNormalSnackBar(
                              context: context,
                              message: SetLocalization.of(context)!
                                  .getTranslateValue("no_changes_made_yet"));
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
          child: ref.watch(imageHybridNotifer).isLoading
              ? const SkeletonImageWidget()
              : Center(
                child: Text("[${imageFileList}]",style: TextStyle(color: Colors
                .white,fontSize: 28),),
              )),

          // GridViewImagesWidget(
          //         oneApartment: widget.oneApartment ?? DataOfOneApartment(),
          //         imageFileList: imageFileList,
          //         photosIds: _photoWillDeleteIds,
          //       )),
      floatingActionButton: FloatingButtonsAddImagesWidgets(
        imageFileList: imageFileList,
        picker: _picker,
        pickedFile: pickedFile,
      ),
    );
  }
}
