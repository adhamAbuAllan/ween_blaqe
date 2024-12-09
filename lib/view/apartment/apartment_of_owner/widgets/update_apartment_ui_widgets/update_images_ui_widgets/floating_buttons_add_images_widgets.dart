
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../controller/provider_controllers/providers/image_provider.dart';

class FloatingButtonsAddImagesWidgets extends ConsumerWidget {
  const FloatingButtonsAddImagesWidgets({super.key, this.imageFileList,
  required this.picker,this.pickedFile});
  final List<XFile>? imageFileList;
  final ImagePicker picker;
final XFile? pickedFile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Semantics(
        //   label: 'image_picker_example_from_gallery',
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       _onImageButtonPressed(ImageSource.gallery, context: context);
        //     },
        //     heroTag: 'image0',
        //     tooltip: 'Pick Image from gallery',
        //     child: const Icon(Icons.photo),
        //   ),
        // ),
        FloatingButtonAddMultiImagesWidget(imageFileList:imageFileList,
          picker: picker,),
        FloatingButtonAddImageWidget(imageFileList: imageFileList,pickedFile:
        pickedFile,),
      ],
    );
  }
}


class FloatingButtonAddMultiImagesWidget<FloatingActionButtonWidget>
    extends ConsumerWidget {
  const FloatingButtonAddMultiImagesWidget({super.key,required this
      .imageFileList,required this.picker});
final List<XFile>? imageFileList;
final  ImagePicker picker;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () {

      WidgetsBinding.instance.addPostFrameCallback((_) async {
debugPrint("isLoading = ${ref.read(imageApiNotifier).isLoading}");
        await   ref.watch(imageLocalNotifier.notifier).onImageButtonPressed(
            ImageSource.gallery, ref,
            isMultiImage: true,imageFileList: imageFileList,picker:picker );
      });

        },
        heroTag: 'image0',
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        tooltip: SetLocalization.of(context)!
            .getTranslateValue("add_photos_from_gallery"),
        child: const Icon(Icons.photo_library),
      ),
    );
  }
}

class FloatingButtonAddImageWidget extends ConsumerWidget {
  const FloatingButtonAddImageWidget({super.key, required this.imageFileList,
    required this.pickedFile});
  final List<XFile>? imageFileList;
  final XFile ? pickedFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FloatingActionButton(
        onPressed: () {
      WidgetsBinding.instance.addPostFrameCallback((_) async {

        await ref
            .watch(imageLocalNotifier.notifier)
            .onImageButtonPressed(ImageSource.camera, ref,
            imageFileList:imageFileList,pickedFile:pickedFile);
      });

        },
        heroTag: 'image1',
        tooltip: SetLocalization.of(context)!.getTranslateValue("take_photo"),
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
