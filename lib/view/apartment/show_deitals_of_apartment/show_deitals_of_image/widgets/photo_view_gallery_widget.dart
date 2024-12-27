import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';

class PhotoViewGalleryWidget extends ConsumerStatefulWidget {
  const PhotoViewGalleryWidget({super.key,
    required this.imageList,
    required this.initialIndex,
    this.onPageChanged,
  });
  final List<Photos> imageList;
  final int initialIndex;
  final ValueChanged<int>? onPageChanged;

  @override
  ConsumerState createState() => _PhotoViewGalleryWidgetState();
}

class _PhotoViewGalleryWidgetState extends ConsumerState<PhotoViewGalleryWidget> {
late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: widget.imageList.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imageList[index].url!),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },

      pageController: _pageController,
      onPageChanged: (index) {
        if (widget.onPageChanged != null) {

          widget.onPageChanged!(index);
        }
      },
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: BoxDecoration(
        color:ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref)
,
      ),
    );
  }
}
