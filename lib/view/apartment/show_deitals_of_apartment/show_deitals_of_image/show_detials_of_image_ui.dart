import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment'
    '/show_deitals_of_image/widgets/photo_view_gallery_widget.dart';

import '../../../../api/apartments_api/apartments.dart';
import '../../../../api/photos.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import 'widgets/back_button_widget.dart';

class ShowDetialsOfImageUi extends ConsumerStatefulWidget {
  const ShowDetialsOfImageUi({
    super.key,
     this.imageList,
     this.context,
    this.initialIndex,
     this.oneApartment,
  });

  final List<Photos>? imageList;
  final BuildContext ?context;
  final int ?initialIndex;
  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _ShowDetialsOfImageUiState();
}

class _ShowDetialsOfImageUiState extends ConsumerState<ShowDetialsOfImageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Stack(
        children: [
          PhotoViewGalleryWidget(
            imageList: widget.imageList??[],
            initialIndex: widget.initialIndex??0,
            onPageChanged: (index) {
              ref.read(currentPhotoIndex.notifier).state = index;
              ref.read(carouselSliderControllerNotifier).animateToPage(index);
              ref
                  .watch(imageSliderNotifier.notifier)
                  .updateIndex(widget.oneApartment?.id ?? -1, index);
            },
          ),
          const ImageDetialsBackButtonWidget(),
        ],
      ),
    );
  }
}
