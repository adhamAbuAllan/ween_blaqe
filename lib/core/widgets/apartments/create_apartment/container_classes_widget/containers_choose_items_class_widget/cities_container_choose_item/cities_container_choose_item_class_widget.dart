import 'package:flutter/material.dart';
import '../../../../../../../constants/nums.dart';
import '../../../../../dropdown_classes_widgets/dropdown_cities.dart';
//make first setp to use this class:
class ContainerChooseCityItemClassWidget extends StatefulWidget {
  final String title;

  const ContainerChooseCityItemClassWidget(
      {Key? key, required this.title,
        required this.onSelected
      })
      : super(key: key);
  final Function(dynamic) onSelected;

  @override
  State<ContainerChooseCityItemClassWidget> createState() =>
      _ContainerChooseCityItemClassWidgetState();
}

class _ContainerChooseCityItemClassWidgetState
    extends State<ContainerChooseCityItemClassWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: themeMode.isDark
              ? kContainerColorLightMode
              : kContainerColorDarkMode,
        ),
        child: Column(children: [
          //
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    // color: Colors.grey,
                    color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),
            ],
          ),

           Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: DropDownCity(
                onSelected: widget.onSelected,
              )),
        ]));
  }
}
