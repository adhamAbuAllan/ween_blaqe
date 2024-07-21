import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../controller/get_controllers.dart';
class BookmarkButton extends StatelessWidget {
  final int apartmentIndex;

  const BookmarkButton({Key? key, required this.apartmentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(
          () => IconButton(
        icon: Icon(
          bookmarkController.isBookmarked(apartmentIndex) ? Icons.bookmark :
          Icons.bookmark_border,
          color: bookmarkController.isBookmarked(apartmentIndex) ? Colors.red : null,
        ),
        onPressed: () {
          bookmarkController.toggleBookmark(apartmentIndex);
        },
      ),
    );
  }
}
