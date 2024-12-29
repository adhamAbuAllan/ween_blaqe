import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../../constants/localization.dart';
import '../../../../common_widgets/containers_widgets/container_load_widget.dart';
import '../../../../common_widgets/drop_down_widget.dart';

class DropdownTypesWidget extends ConsumerStatefulWidget {
  const DropdownTypesWidget({super.key,  this.alreadyExistingValue});

  final DataOfOneApartment? alreadyExistingValue;

  @override
  ConsumerState createState() => _TypesContainerWidgetState();
}

/*
SetLocalization.of(context)!
                    .getTranslateValue("housing_type_students"),
 */
class _TypesContainerWidgetState extends ConsumerState<DropdownTypesWidget> {
  @override
  Widget build(BuildContext context) {
    final types = ref.watch(typesNotifier).types;
    final defaultValue = ref.watch(typesNotifier).selectedType;
    return ContainerLoadWidget(
        title: SetLocalization.of(context)!
            .getTranslateValue("housing_type_students"),
        childWidget: DropdownFieldWidget(
            alreadyExistingValue:
            types.isNotEmpty ?
            types.firstWhere(
              (item) => item.id == defaultValue?.id,
              orElse: () => types.first,
            ): "",
            onChanged: (items) {
              setState(() {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  ref.read(typesNotifier.notifier).setSelectedType(items);
                  debugPrint(
                      "selectedType : ${ref.read(typesNotifier).selectedType?.id}");
                  if (widget.alreadyExistingValue?.type?.id != items.id) {
                    ref.read(hasChanged.notifier).state = true;
                  } else {
                    ref.read(hasChanged.notifier).state = false;
                  }
                });
              });
            },
            items: ref.watch(typesNotifier).types),
        isLoading: ref.watch(typesNotifier).isLoading??false);
  }
}
