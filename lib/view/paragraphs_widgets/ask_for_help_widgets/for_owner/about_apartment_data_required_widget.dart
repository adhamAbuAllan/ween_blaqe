import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class AboutApartmentDataRequiredWidget extends ConsumerWidget {
  const AboutApartmentDataRequiredWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataTable(
      border: TableBorder(
        horizontalInside: BorderSide(
            width: .5,
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

          // Change this to your desired color
        ),
      ),
      dataRowColor: WidgetStatePropertyAll(ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)),
      headingRowColor: WidgetStatePropertyAll(ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)),
      horizontalMargin: 20,
      sortAscending: false,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            numeric: false,
            label: Text(
                SetLocalization.of(context)!.getTranslateValue("full_name"),
                style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref))),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("required_info_name")),
        DataColumn(
            label: Text(
                SetLocalization.of(context)!.getTranslateValue("example"),
                style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref))),
            tooltip: "مثال على العلومة المطلوبة")
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text(
              SetLocalization.of(context)!.getTranslateValue("apartment_area"),
              style: TextStyle(
                  fontSize: 14,

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)))),
          DataCell(Text("70م",
              style: TextStyle(
                  fontSize: 14,

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)))),
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

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  )),
              placeholder: false),
          DataCell(Text("3",
              style: TextStyle(
                  fontSize: 14,

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)))),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                SetLocalization.of(context)!
                    .getTranslateValue("number_of_bathrooms"),
                style: TextStyle(
                    fontSize: 14,

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
              ),
              placeholder: false),
          DataCell(Text("1",
              style: TextStyle(
                  fontSize: 14,

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)))),
        ]),
      ],
    );
  }
}
