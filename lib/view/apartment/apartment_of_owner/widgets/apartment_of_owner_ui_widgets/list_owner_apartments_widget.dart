import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../list_of_apartments.dart';

class ListOwnerApartmentsWidget extends ConsumerWidget {
  const ListOwnerApartmentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ApartmentsListWidget(
      haveCitiesBar: false,
      apartmentsRes: ref.watch(fetchApartmentNotifier).apartmentsOfOwner,
      isDeleteMode: ref.watch(toggleOwnerButtonsNotifier).isDelete,
      onPressed: () {
        ref
            .read(fetchApartmentNotifier.notifier)
            .fetchApartments(isOwnerApartments: true,);
      },
    );
  }
}
