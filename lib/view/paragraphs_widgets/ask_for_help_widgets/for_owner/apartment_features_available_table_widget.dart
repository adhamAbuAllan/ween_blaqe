import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class ApartmentFeaturesAvailableTableWidget extends ConsumerWidget {
  const ApartmentFeaturesAvailableTableWidget({super.key});

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
      horizontalMargin: 35,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            numeric: false,
            label: Text(
              SetLocalization.of(context)!.getTranslateValue("name"),
              style: TextStyle(
                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              ),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("advantage_name")),
        DataColumn(
            label: Text(
              SetLocalization.of(context)!.getTranslateValue("advantage_icon"),
              style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              ),
            ),
            tooltip: SetLocalization.of(context)!
                .getTranslateValue("icon_near_advantage"))
      ],
      rows: List<DataRow>.generate(
          ref.read(advantagesNotifier).advantages.length ,
          (index) => DataRow(cells: [
                DataCell(Text(
                    ref.read(advantagesNotifier).advantages[index].advName !=
                            null
                        ? "${ref.read(advantagesNotifier).advantages[index].advName}"
                        : "null",
                    style: TextStyle(
                      fontSize: 14,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref),
                    ))),
                DataCell(Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      ref.read(advantagesNotifier).advantages[index].icon != null
                          ? "${ref.read(advantagesNotifier)
                          .advantages[index].icon}"
                          : "null",
                      width: 24,
                      height: 24,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref),
                    )))
              ])),
    );
  }
}
