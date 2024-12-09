import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/core/widgets/registration/dropdown_button.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets/container_widget.dart';

// import '../../../../../../api/cities.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/nums.dart';

class ContainerChooseItemsClassWidget extends StatefulWidget {
  final Function(dynamic) onSelected;
  final String title;
  final Future<List<dynamic>?>? wholeListApi;
  final String currentValue;
  final int? itemIdNotIndex;

  // bool dataStatus;

  const ContainerChooseItemsClassWidget(
      {super.key,
      required this.onSelected,
      required this.title,
      required this.wholeListApi,
      required this.currentValue,
      this.itemIdNotIndex
      // required this.dataStatus
      });

  @override
  State<ContainerChooseItemsClassWidget> createState() =>
      _ContainerChooseItemsClassWidgetState();
}

class _ContainerChooseItemsClassWidgetState
    extends State<ContainerChooseItemsClassWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        child: Column(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              widget.title,
              style: TextStyle(
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
              ),
            ),
          ),
        ],
      ),
      DropdownButtonClassWidget(
        wholeListApi: widget.wholeListApi,
        firstItem: widget.currentValue,
        onSelected: widget.onSelected,
        itemIdNotIndex: widget.itemIdNotIndex ?? 1,
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
        // dataStatus: widget.dataStatus,
      ),
    ]));
  }
}
