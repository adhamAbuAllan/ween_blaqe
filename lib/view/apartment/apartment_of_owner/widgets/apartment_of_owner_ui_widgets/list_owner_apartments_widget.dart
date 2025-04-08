import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../apartments_list_widget.dart';

class ListOwnerApartmentsWidget extends ConsumerStatefulWidget {
  const ListOwnerApartmentsWidget({super.key,required this.scrollController});
final ScrollController scrollController;
  @override
  ConsumerState createState() => _ListOwnerApartmentsWidgetState();
}

class _ListOwnerApartmentsWidgetState extends ConsumerState<ListOwnerApartmentsWidget> {
  @override
  Widget build(BuildContext context) {
    return ApartmentsListWidget(
      isOwnerApartment: true,
      haveCitiesBar: false,
      apartmentsRes: ref.watch(fetchApartmentNotifier).apartmentsOfOwner,
      isDeleteMode: ref.watch(toggleOwnerButtonsNotifier).isDelete,
      scrollController: widget.scrollController,

      onPressed: () {
        ref
            .read(fetchApartmentNotifier.notifier)
            .fetchApartments(isOwnerApartments: true,);
      },

    );
  }
}

// class ListOwnerApartmentsWidget extends ConsumerWidget {
//   const ListOwnerApartmentsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ApartmentsListWidget(
//       haveCitiesBar: false,
//       apartmentsRes: ref.watch(fetchApartmentNotifier).apartmentsOfOwner,
//       isDeleteMode: ref.watch(toggleOwnerButtonsNotifier).isDelete,
//       onPressed: () {
//         ref
//             .read(fetchApartmentNotifier.notifier)
//             .fetchApartments(isOwnerApartments: true,);
//       },
//     );
//   }
// }
