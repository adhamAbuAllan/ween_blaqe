import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/widgets/registration/dropdown_button.dart';
import '../../../../../../constants/nums.dart';

class ContainerChooseItemsClassWidget extends StatefulWidget {
  final Function(dynamic) onSelected;
  final String title;
  String currentValue;
  final List<String> items;
  bool dataStatus;

  ContainerChooseItemsClassWidget({super.key,
    required this.onSelected,
    required this.title,
    required this.currentValue,
    required this.items,
    required this.dataStatus});

  @override
  State<ContainerChooseItemsClassWidget> createState() =>
      _ContainerChooseItemsClassWidgetState();
}

class _ContainerChooseItemsClassWidgetState
    extends State<ContainerChooseItemsClassWidget> {
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: themeMode.isDark
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child:
                 DropdownButtonClassWidget(
                  items: widget.items,
                  firstItem: widget.currentValue,
                  onSelected: widget.onSelected,
                  //     (c) {
                  //   if (!readyCityAndTypeOfApartmentApi.isApartmentApi) {
                  //     setState(() {
                  //       setState(() {
                  //         readyCityAndTypeOfApartmentApi.oneCityName = c;
                  //       });
                  //       for (var i = 0;
                  //           i < readyCityAndTypeOfApartmentApi.citiesName.length;
                  //           ++i) {
                  //         if (readyCityAndTypeOfApartmentApi.oneCityName ==
                  //             readyCityAndTypeOfApartmentApi.citiesName[i]) {
                  //           setState(() {
                  //             readyCityAndTypeOfApartmentApi.indexOfCity = i + 1;
                  //           });
                  //         }
                  //       }
                  //     });
                  //   }else{
                  //     setState(() {
                  //
                  //       readyCityAndTypeOfApartmentApi.currentApartmentType = c;
                  //       setState(() {
                  //         for (var i = 0; i <
                  //             readyCityAndTypeOfApartmentApi.apartmentType
                  //                 .length; ++i) {
                  //           if (readyCityAndTypeOfApartmentApi.currentApartmentType ==
                  //               readyCityAndTypeOfApartmentApi.apartmentType[i]) {
                  //             setState(() {
                  //               readyCityAndTypeOfApartmentApi.indexApartmentType = i + 1;
                  //             });
                  //           }
                  //         }
                  //       });
                  //       },
                  //     );  }
                  //
                  // },
                  dataStatus: widget.dataStatus,
                                 ),
          ),
        ]));
  }
}
