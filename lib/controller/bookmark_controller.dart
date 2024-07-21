import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  final RxList<int> bookmarks = <int>[].obs;
  final String _bookmarksKey = 'bookmarks';
  @override
  void onInit() {
    super.onInit();
    _loadBookmarks();
  }
  void toggleBookmark(int apartmentId) {
    if (bookmarks.contains(apartmentId)) {
      bookmarks.remove(apartmentId);
      // update();
    } else {
      bookmarks.add(apartmentId);
      // update();
    }
    _saveBookmarks();
  }

  bool isBookmarked(int apartmentId) {
    return bookmarks.contains(apartmentId);
  }
  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBookmarks = prefs.getStringList(_bookmarksKey) ?? [];
    bookmarks.assignAll(savedBookmarks.map((e) => int.parse(e)).toList());
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_bookmarksKey, bookmarks.map((e) => e.toString()).toList());
  }
}
