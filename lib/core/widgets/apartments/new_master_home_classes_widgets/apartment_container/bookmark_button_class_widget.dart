import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../constants/nums.dart';
import '../../../../../controller/get_controllers.dart';
class BookmarkButton extends StatelessWidget {
  final int apartmentId;

  const BookmarkButton({super.key, required this.apartmentId});

  @override
  Widget build(BuildContext context) {

    return Obx(
          () => IconButton(
            splashColor: Colors.transparent,

        icon: Icon(
          bookmarkController.isBookmarked(apartmentId) ? Icons.bookmark : Icons.bookmark_border,
          color: bookmarkController.isBookmarked(apartmentId)
              ? themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode // Use primaryColor if bookmarked
              : (themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode

          ), // Adjust colors based on theme

        ),
        onPressed: () {

          bookmarkController.toggleBookmark(apartmentId);


        },
      ),
    );
  }
}
