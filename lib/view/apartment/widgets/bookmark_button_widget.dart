import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';

class BookmarkButtonWidget extends ConsumerStatefulWidget {
  const BookmarkButtonWidget({super.key, required this.apartmentId});

  final int apartmentId;

  @override
  ConsumerState createState() => _BookmarkButtonWidgetState();
}

class _BookmarkButtonWidgetState extends ConsumerState<BookmarkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var isBookmarked =
        ref.watch(bookmarkNotifier.notifier).isBookmarked(widget.apartmentId);

    return IconButton(
      splashColor: Colors.transparent,
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked
            ? ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)
            : ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
      ),
      onPressed: () {
        setState(() {
          ref
              .watch(bookmarkNotifier.notifier)
              .toggleBookmark(widget.apartmentId);
        });
      },
    );
  }
}
