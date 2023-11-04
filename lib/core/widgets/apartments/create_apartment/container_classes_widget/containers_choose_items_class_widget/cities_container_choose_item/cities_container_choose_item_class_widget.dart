import 'package:flutter/material.dart';
import '../../../../../../../api/cities.dart';
import '../../../../../../../constants/nums.dart';
import '../../../../../dropdown_classes_widgets/dropdown_cities.dart';

class ContainerChooseCityItemClassWidget extends StatefulWidget {
  final String title;
  const ContainerChooseCityItemClassWidget(
      {Key? key, required this.title, required this.onSelected})
      : super(key: key);
  final Function(City) onSelected;

  @override
  State<ContainerChooseCityItemClassWidget> createState() =>
      _ContainerChooseCityItemClassWidgetState();
}

class _ContainerChooseCityItemClassWidgetState
    extends State<ContainerChooseCityItemClassWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: kContainerColor,
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
                    color: Colors.grey.shade800,
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
