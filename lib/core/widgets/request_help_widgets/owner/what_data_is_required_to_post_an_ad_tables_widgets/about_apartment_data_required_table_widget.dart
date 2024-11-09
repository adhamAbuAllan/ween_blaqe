import 'package:flutter/material.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class AboutApartmentDataRequiredTable extends StatelessWidget {
  const AboutApartmentDataRequiredTable({
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
            label: Text(
                SetLocalization.of(context)!.getTranslateValue("full_name"),
                style: TextStyle(
                    fontSize: 16,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)),
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
            tooltip: "مثال على العلومة المطلوبة")
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text(
              SetLocalization.of(context)!.getTranslateValue("apartment_area"),
              style: TextStyle(
                  fontSize: 14,
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode))),
          DataCell(Text("70م",
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
                      .getTranslateValue("number_of_rooms"),
                  style: TextStyle(
                    fontSize: 14,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  )),
              placeholder: false),
          DataCell(Text("3",
              style: TextStyle(
                  fontSize: 14,
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode))),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                SetLocalization.of(context)!
                    .getTranslateValue("number_of_bathrooms"),
                style: TextStyle(
                    fontSize: 14,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode),
              ),
              placeholder: false),
          DataCell(Text("1",
              style: TextStyle(
                  fontSize: 14,
                  
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode))),
        ]),
      ],
    );
  }
}
