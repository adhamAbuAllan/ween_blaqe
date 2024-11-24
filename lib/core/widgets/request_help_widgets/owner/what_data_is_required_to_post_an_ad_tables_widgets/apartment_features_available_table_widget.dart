import 'package:flutter/material.dart';


import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
class ApartmentFeaturesAvailableTable extends StatelessWidget {
  const ApartmentFeaturesAvailableTable({
    super.key,

    required this.apartmentRes,
  });


  final Apartments? apartmentRes;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder(
        horizontalInside: BorderSide(
            width: .5,
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode
          // Change this to your desired color
        ),
      ),
      dataRowColor: WidgetStatePropertyAll(themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode),
      headingRowColor: WidgetStatePropertyAll(themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode),
      horizontalMargin: 35,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            numeric: false,
            label: Text(
              SetLocalization.of(context)!.getTranslateValue("name"),
              style: TextStyle(
                  
                  fontSize: 16,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("advantage_name")),
        DataColumn(
            label: Text(
              SetLocalization.of(context)!.getTranslateValue("advantage_icon"),
              style: TextStyle(
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("icon_near_advantage"))
      ],
      rows: List<DataRow>.generate(
          apartmentRes?.data!.last.advantages!.length ?? 1,
              (index) => DataRow(cells: [
            DataCell(Text(
                "${apartmentRes?.data?.last.advantages?[index].advName}",
                style: TextStyle(
                    fontSize: 14,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode))),
            DataCell(Align(
                alignment: Alignment.center,
                child: Image.network(
                  "${apartmentRes?.data?.last.advantages![index].icon ?? 1}",
                  width: 24,
                  height: 24,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                )))
          ])),
    );
  }
}
