import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../constants/nums.dart';


class DropdownFieldWidget extends ConsumerStatefulWidget {
  const DropdownFieldWidget({
    super.key,
    required this.onChanged,
    required this.items,
    this.alreadyExistingValue,
    this.autofocus
  });

  final List<dynamic> items;
  final Function(dynamic)? onChanged;
  final dynamic  alreadyExistingValue;
  final bool ?autofocus;

  @override
  ConsumerState createState() => _DropdownFieldWidgetState();
}

class _DropdownFieldWidgetState extends ConsumerState<DropdownFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      autofocus: widget.autofocus??false,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical:
              getIt<AppDimension>().isSmallScreen(context) ? 20 / 2 : 20,
              horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: themeMode.isLight
                  ? kPrimaryColorLightMode.withOpacity(.3)
                  : kPrimaryColorDarkMode.withOpacity(.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              width: 1,
            ),
          ),
        ),
        dropdownColor: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        value:widget.alreadyExistingValue??widget.items.first,
        items: widget.items.map((item) {
          String? itemName = item.name;
          itemName = item.name ?? "";
          return DropdownMenuItem(

            value: item,
            child: FittedBox(
                child: Text(
                  itemName ?? "",
                  style: TextStyle(
                    fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  ),
                )),
          );
        }).toList(),
        onChanged: widget.onChanged);
  }
}
