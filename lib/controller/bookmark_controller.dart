import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BookmarkController extends GetxController {
  final RxList<int> bookmarks = <int>[].obs;

  void toggleBookmark(int apartmentIndex) {
    if (bookmarks.contains(apartmentIndex)) {
      bookmarks.remove(apartmentIndex);
    } else {
      bookmarks.add(apartmentIndex);
    }
  }

  bool isBookmarked(int apartmentIndex) {
    return bookmarks.contains(apartmentIndex);
  }
}
