import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/apartment_provider.dart';

class BookmarkButtonWidget extends ConsumerStatefulWidget {
  const BookmarkButtonWidget({super.key,required this.apartmentId});
final int apartmentId;

  @override
  ConsumerState createState() => _BookmarkButtonWidgetState();
}

class _BookmarkButtonWidgetState extends ConsumerState<BookmarkButtonWidget> {
  @override

  Widget build(BuildContext context) {
    var isBookmarked = ref.watch(bookmarkNotifier.notifier).isBookmarked
      (widget.apartmentId);

    return IconButton(
      splashColor: Colors.transparent,
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color:  isBookmarked
            ? themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode
            : themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
      ),
      onPressed: (){
setState(() {
  ref.watch(bookmarkNotifier.notifier).toggleBookmark(widget.apartmentId);

});

      },

    );
  }
}

// class BookmarkButtonWidget extends ConsumerWidget {
//   const BookmarkButtonWidget({super.key, required this.apartmentId});
//   final int apartmentId;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//
//
//     final isBookmarked = ref.watch(bookmarkNotifier.notifier).isBookmarked(apartmentId);
//
//
//     return IconButton(
//       splashColor: Colors.transparent,
//       icon: Icon(
//         isBookmarked ? Icons.bookmark : Icons.bookmark_border,
//         color:  isBookmarked
//             ? themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode
//             : themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
//       ),
//       onPressed: (){
//
//         ref.watch(bookmarkNotifier.notifier).toggleBookmark(apartmentId);
//
//       },
//
//     );
//   }
// }
// var isBookmarked = ref.read(bookmarkNotifier);
//ref.read(bookmarkNotifier.notifier).toggleBookmark(apartmentId);
