import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/apartments_api/apartments.dart';
import 'package:get/get.dart';
import '../../providers/apartment_provider.dart';
import '../../statuses/bookmark_state.dart';

class BookmarkNotifier extends StateNotifier<BookmarkState> {
  BookmarkNotifier() : super(BookmarkState(bookmarkIds: [], bookmarkKey: 'bookmarks')) {
    _loadBookmarks();
  }

 Future<void>  _loadBookmarks() async {
    final keyBookmark = state.bookmarkKey;
final prefs = await SharedPreferences.getInstance();
final savedBookmarks = prefs.getStringList(keyBookmark) ?? [];
final bookmarkIds =savedBookmarks.map((element) => int.parse(element)).toList();
state = state.copyWith(bookmarkIds: bookmarkIds);
  }

  Future<void> _saveBookmarks() async {

final prefs = await SharedPreferences.getInstance();
await prefs.setStringList(state.bookmarkKey , state.bookmarkIds.map((id) => id.toString()).toList());
  }

  void toggleBookmark(int apartmentId) {
    final currentIds = List<int>.from(state.bookmarkIds);

    if (currentIds.contains(apartmentId)) {
      currentIds.remove(apartmentId);
    } else {
      currentIds.add(apartmentId);
    }

    state = state.copyWith(bookmarkIds: currentIds);
    _saveBookmarks();
  }

  bool isBookmarked(int apartmentId) {
    return state.bookmarkIds.contains(apartmentId);
  }

  Apartments getApartmentsFromBookmarks({
    required WidgetRef ref,}) {

    final apartmentsList = ref.read(fetchApartmentNotifier).apartmentsList;
    final bookmarkedApartments = Apartments(data: []);

    for (int apartmentId in state.bookmarkIds) {
      final apartment = apartmentsList.data?.firstWhereOrNull((a) => a.id == apartmentId);
      if (apartment != null) {
        bookmarkedApartments.data?.add(apartment);
      }
    }

    return bookmarkedApartments;
  }
  Future<void> fetchBookmarkedApartment({
    required WidgetRef ref,
  }) async {
    final bookmarkedApartments = ref.watch(bookmarkNotifier.notifier)
        .getApartmentsFromBookmarks(ref: ref,);
    ref.watch(apartmentBookmarkedNotifier.notifier).state = bookmarkedApartments;
  }

}

/*
so , are you forget this :
fetchBookmarkedApartment({ required WidgetRef ref,required Apartments
apartments,required List<int>  apartmentsbookmarkedId }) {
    var apartmentsBookmarked = ref.watch(bookmarkNotifier.notifier)
        .getApartmentsFromBookmarks(apartmentsbookmarkedId, ref);
apartments = apartmentsBookmarked;
}

  Apartments getApartmentsFromBookmarks(List<int> bookmarks, WidgetRef ref) {
    var bookmarked = ref.read(apartmentBookmarkedNotifier.notifier).state;
    var apartmentsList = ref.watch(fetchApartmentNotifier).apartmentsList;
    bookmarked = apartmentsList;
    for (int apartmentId in bookmarks) {
      final apartment =
          apartmentsList.data?.firstWhereOrNull((a) => a.id == apartmentId);
      if(apartment != null){
        bookmarked.data?.add(apartment);
      }
    }
    return bookmarked;
  }
*/
