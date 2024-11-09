import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class OwnerDataRequiredTable extends StatelessWidget {
  const OwnerDataRequiredTable({
    super.key,
  });

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
      horizontalMargin: 20,
      sortAscending: false,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            numeric: false,
            label: Flexible(
              child: Text(
                  SetLocalization.of(context)!.getTranslateValue("name"),
                  style: TextStyle(
                      fontSize: 16,
                      
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode)),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("required_info_name")),
        DataColumn(
            label: Text(
                SetLocalization.of(context)!.getTranslateValue("example"),
                style: TextStyle(
                    fontSize: 16,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)),
            tooltip: SetLocalization.of(context)!.getTranslateValue(
              "example_of_info_required",
            ))
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text(
              SetLocalization.of(context)!.getTranslateValue(
                "owner_name",
              ),
              style: TextStyle(
                  fontSize: 14,
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode))),
          DataCell(Text(
              SetLocalization.of(context)!
                  .getTranslateValue("adham_anwar_abu_allan"),
              style: TextStyle(
                  fontSize: 14,
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode))),
          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("phone_number"),
                  style: TextStyle(
                    fontSize: 14,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  )),
              placeholder: false),
          DataCell(Text(
            "+97256*****3",
            style: TextStyle(
                fontSize: 14,
                
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode),
            textDirection: TextDirection.ltr,
          )),
        ]),
      ],
    );
  }
}
