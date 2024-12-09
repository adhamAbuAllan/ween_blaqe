// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
//
// import '../../../../../constants/nums.dart';
// import '../../../../../controller/get_controllers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class BookmarkButtonWidget extends ConsumerStatefulWidget {
//   const BookmarkButtonWidget({super.key,required this.apartmentId});
//   final int apartmentId;
//
//   @override
//   ConsumerState createState() => _BookmarkButtonConsumerState();
// }
//
// class _BookmarkButtonConsumerState extends ConsumerState<BookmarkButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       splashColor: Colors.transparent,
//
//       icon: Icon(
//         ref.watch(bookmarkNotifier.notifier).isBookmarked(widget.apartmentId)
//         // bookmarkController.isBookmarked(apartmentId)
//           ? Icons.bookmark : Icons.bookmark_border,
//         color: ref.watch(bookmarkNotifier.notifier).isBookmarked(widget.apartmentId)
//             ? themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode // Use primaryColor if bookmarked
//             : (themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode
//
//         ), // Adjust colors based on theme
//
//       ),
//       onPressed: () {
// ref.read(bookmarkNotifier.notifier).toggleBookmark(widget.apartmentId);
//
//
//       },
//     );
//   }
// }

// class BookmarkButtonWidget extends StatelessWidget {
//   final int apartmentId;
//
//   const BookmarkButtonWidget({super.key, required this.apartmentId});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Obx(
//           () => IconButton(
//             splashColor: Colors.transparent,
//
//         icon: Icon(
//           bookmarkController.isBookmarked(apartmentId) ? Icons.bookmark : Icons.bookmark_border,
//           color: bookmarkController.isBookmarked(apartmentId)
//               ? themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode // Use primaryColor if bookmarked
//               : (themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode
//
//           ), // Adjust colors based on theme
//
//         ),
//         onPressed: () {
//
//           bookmarkController.toggleBookmark(apartmentId);
//
//
//         },
//       ),
//     );
//   }
// }
