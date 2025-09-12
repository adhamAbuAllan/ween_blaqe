import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
class OwnerDataReqiuredTableWidget extends ConsumerWidget {
  const OwnerDataReqiuredTableWidget({super.key});

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
      dataRowColor: WidgetStatePropertyAll(ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
),
      headingRowColor: WidgetStatePropertyAll(ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
),
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
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
)),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("required_info_name")),
        DataColumn(
            label: Text(
                SetLocalization.of(context)!.getTranslateValue("example"),
                style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
)),
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

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
))),
          DataCell(Text(
              SetLocalization.of(context)!
                  .getTranslateValue("adham_anwar_abu_allan"),
              style: TextStyle(
                  fontSize: 14,

                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
))),
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

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  )),
              placeholder: false),
          DataCell(Text(
            "+97256*****3",
            style: TextStyle(
                fontSize: 14,

                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
),
            textDirection: TextDirection.ltr,
          )),
        ]),
      ],
    );
  }
}
