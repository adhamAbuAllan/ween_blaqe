import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../core/utils/styles/button.dart';
import 'button_of_city_widget.dart';

class CitiesBarWidget extends ConsumerStatefulWidget {
  const CitiesBarWidget({
    super.key,
    this.onClick,
  });

  final Function()? onClick;

  @override
  ConsumerState createState() => _CitiesBarWidgetState();
}

class _CitiesBarWidgetState extends ConsumerState<CitiesBarWidget> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
            children: ref.watch(cityNotifier).cities

                .map((c) => CityButtonWidget(
              context: context,

           onClick:   () async {
                if (widget.onClick != null) {
                  ref.read(cityNotifier).cityId
                      == c.id
                      ? ref.read(cityNotifier).cityId = 0
                      :
                  ref.read(cityNotifier).cityId =
                      c.id ?? 0;
                await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                    isOwnerApartments: false,
                     type: ref.read(isAllTypesOfApartmentNotifier)? null: ref
                         .read(apartmentTypeNotifier.notifier)
                    .state,
                    isAll:ref.read(isAllTypesOfApartmentNotifier),
                    cityId: ref.read(cityNotifier).cityId);
              }

            },
                style: c.id == ref.read(cityNotifier).cityId &&
                    ref.read(cityNotifier).cityId != 0
                    ? fullButton().copyWith(
                  foregroundColor:
                  WidgetStateProperty.all<Color>(
                      Colors.white),
                )
                    : outlinedButton(
                    themeMode: themeMode, context: context), city: c,))
                .toList()),
      ),
    );
  }
}
