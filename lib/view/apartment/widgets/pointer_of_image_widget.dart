import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../api/photos.dart';
import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/apartment_provider.dart';

class PointerOfImageWidget extends ConsumerWidget {
  const PointerOfImageWidget({
    super.key,
    required this.imageList,
    required this.apartmentId,
  });

  final List<Photos> imageList;
  final int apartmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex =
        ref.watch(imageSliderNotifier)[apartmentId]?.currentIndex ?? 0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageList.asMap().entries.map((entry) {
          final isActive = entry.key == currentIndex;
          return GestureDetector(
            onTap: (){
              ref
                  .watch(imageSliderNotifier.notifier)
                  .updateIndex(apartmentId, entry.key);
              debugPrint("current index is $currentIndex");
              debugPrint("you click on ${entry.key}");
              ref.read(carouselSliderControllerNotifier).animateToPage
                (entry.key);
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 12,
              height: 12,
              duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1.5),
                color: Theme.of(context).brightness == Brightness.dark
                    ? (
                    isActive
                    ? kPrimaryColor300LightMode
                    : kPrimaryColor300DarkMode)
                    .withOpacity(
                    isActive
                        ? 0.9 : 0.4)
                    : (
                    isActive
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode)
                    .withOpacity(
                   isActive
                        ? 0.9 : 0.4),
                // Adjust opacity based on active state
                boxShadow:
                isActive
            
                    ? [
                  BoxShadow(
                    color: themeMode.isLight
                        ? kPrimaryColorLightMode.withOpacity(0.1)
                        : kPrimaryColorDarkMode.withOpacity(0.1),
                    spreadRadius: 7,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  )
                ]
                    : [],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
// class _PointerOfImageWidgetState extends ConsumerState<PointerOfImageWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: widget.imageList.asMap().entries.map((entry) {
//           return AnimatedContainer(
//             margin: const EdgeInsets.symmetric(horizontal: 4),
//             width: 12,
//             height: 12,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(1.5),
//               color: Theme.of(context).brightness == Brightness.dark
//                   ? (
//                   //isActive
//                   false
//                   ? kPrimaryColor300LightMode
//                   : kPrimaryColor300DarkMode)
//                   .withOpacity(
//           false
//                   //isActive
//                       ? 0.9 : 0.4)
//                   : (
//                   //isActive
//                   false
//                   ? kPrimaryColorLightMode
//                   : kPrimaryColorDarkMode)
//                   .withOpacity(
//                  // isActive
//                 false
//                       ? 0.9 : 0.4),
//               // Adjust opacity based on active state
//               boxShadow:
//               //isActive
//                 false
//                   ? [
//                 BoxShadow(
//                   color: themeMode.isLight
//                       ? kPrimaryColorLightMode.withOpacity(0.1)
//                       : kPrimaryColorDarkMode.withOpacity(0.1),
//                   spreadRadius: 7,
//                   blurRadius: 7,
//                   offset: const Offset(0, 2),
//                 )
//               ]
//                   : [],
//             ),
//             duration: const Duration(milliseconds: 300),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
