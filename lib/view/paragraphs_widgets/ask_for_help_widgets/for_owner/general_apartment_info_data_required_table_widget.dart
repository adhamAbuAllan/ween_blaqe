import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';

class GeneralApartmentInfoDataRequiredTable extends ConsumerWidget {
  const GeneralApartmentInfoDataRequiredTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataTable(
      border: TableBorder(
        horizontalInside: BorderSide(
            width: .5,
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)
          // Change this to your desired color
        ),
      ),
      dataRowColor: WidgetStatePropertyAll(
          ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)),
      headingRowColor: WidgetStatePropertyAll(
          ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)),
      horizontalMargin: 20,
      // dataRowHeight: 3,
      headingTextStyle:  TextStyle(fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,),
      sortColumnIndex: 0,
      // dataRowMinHeight: 60,
      dataRowMinHeight: 48,
      // Minimum height for the row
      dataRowMaxHeight: 65,
      // Maximum height for the row
      columns: [
        DataColumn(
          // headingRowAlignment:MainAxisAlignment.end ,
          numeric: false,
          label: Flexible(
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("name"),
              style: TextStyle(
                fontSize:
                getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              ),
              softWrap: true,
            ),
          ),
          tooltip: SetLocalization.of(context)!
              .getTranslateValue("required_info_name"),
        ),
        DataColumn(
          // headingRowAlignment: MainAxisAlignment.center,
          label: Text(SetLocalization.of(context)!.getTranslateValue("example"),
              style: TextStyle(
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref))),
          tooltip: SetLocalization.of(context)!.getTranslateValue(
            "example_of_info_required",
          ),
        ),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text(
              SetLocalization.of(context)!.getTranslateValue("ad_title"),
              style: TextStyle(
                  fontSize: 14,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)))),
          DataCell(Text(
            SetLocalization.of(context)!
                .getTranslateValue("furnished_apartment_example"),
            style: TextStyle(
                fontSize: 12,
                color:
                ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
          )),
          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                  style: TextStyle(
                    fontSize: 14,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                  SetLocalization.of(context)!.getTranslateValue("location")),
              placeholder: false),
          DataCell(Text(
              style: TextStyle(
                  fontSize: 14,
                  color:
                  ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
              SetLocalization.of(context)!
                  .getTranslateValue("example_of_location"))),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                style: TextStyle(
                    fontSize: 12,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref)),
                SetLocalization.of(context)!
                    .getTranslateValue("allowed_students"),
              ),
              placeholder: false),
          DataCell(Text("3",
              style: TextStyle(
                  fontSize: 14,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)))),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("housing_type_students"),
                  style: TextStyle(
                    fontSize: 14,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  )),
              placeholder: false),
          DataCell(Text(
              SetLocalization.of(context)!.getTranslateValue("students"),
              style: TextStyle(
                  fontSize: 14,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)))),
        ]),
        DataRow(cells: [
          DataCell(
              showEditIcon: false,
              Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("monthly_rent"),
                  style: TextStyle(
                    fontSize: 14,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  )),
              placeholder: false),
          DataCell(Text("800",
              style: TextStyle(
                  fontSize: 14,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)))),
        ]),
      ],
    );
  }
}
