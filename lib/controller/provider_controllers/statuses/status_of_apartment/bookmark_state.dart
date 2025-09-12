class BookmarkState {
  final List<int> bookmarkIds;
  final String bookmarkKey;


  BookmarkState({
    required this.bookmarkIds,
    required this.bookmarkKey,
  });

  BookmarkState copyWith({
    List<int>? bookmarkIds,
    String? bookmarkKey,
  }) {
    return BookmarkState(
      bookmarkIds: bookmarkIds ?? this.bookmarkIds,
      bookmarkKey: bookmarkKey ?? this.bookmarkKey,
    );
  }
}
