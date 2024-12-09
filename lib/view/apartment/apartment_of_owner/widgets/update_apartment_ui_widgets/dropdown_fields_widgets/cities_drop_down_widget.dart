import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../../constants/localization.dart';
import '../../../../../common_widgets/containers_widgets/container_load_widget.dart';
import '../../../../../common_widgets/drop_down_widget.dart';

class DropdownCitiesWidget extends ConsumerStatefulWidget {
  const DropdownCitiesWidget({super.key,required this.alreadyExistingValue});
final DataOfOneApartment alreadyExistingValue;
  @override
  ConsumerState createState() => _DropdownCitiesWidgetState();
}

class _DropdownCitiesWidgetState extends ConsumerState<DropdownCitiesWidget> {
  @override
  Widget build(BuildContext context) {
final cities = ref.watch(cityNotifier).cities;
final defaultValue = ref.watch(cityNotifier).selectedCity;
    return ContainerLoadWidget(

        title: SetLocalization.of(context)!.getTranslateValue("city")
        , isLoading: ref.watch(cityNotifier).isLoading
        , childWidget: DropdownFieldWidget(
/*
final dynamicItems = ref.watch(dynamicNotifier).items; // Example dynamic items
final defaultValue = widget.selectedItem; // Default selected item

  alreadyExistingValue: widget.items.firstWhere(
    (item) => item.id == widget.defaultValue?.id,
    orElse: () => widget.items.first,
  ),
 */
      alreadyExistingValue: cities.firstWhere(
        (item) => item.id == defaultValue?.id,
        orElse: () => cities.first,
      ) ,
      onChanged: (items){
        setState(() {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            ref.read(cityNotifier.notifier).setSelectedCity(items);
            debugPrint(
                "selectedCity : ${ref.read(cityNotifier).selectedCity?.id}");
          });
        });
      }, itmes: ref
        .watch(cityNotifier).cities,
    ));
  }
}