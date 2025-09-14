import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import '../../../api/apartments_api/apartments.dart';

class RemainingStudentCountWidget extends ConsumerWidget {
  const RemainingStudentCountWidget(
      {super.key,
      required this.totalStudentCount,
      required this.currentStudentCount,
      required this.apartmentsRes,
      required this.index
      });

  final int totalStudentCount;
  final int currentStudentCount;
  final int index;
  final Apartments   apartmentsRes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref));
    return Row(
      children: [
        Text(" -", style: textStyle),
        Text(" مُتبقي", style: textStyle),
        const SizedBox(width: 4.0),
        // that if the currentStudentCount - totalStudentCount <= 1 , you should not to show the result
      if (currentStudentCount - totalStudentCount > 1)
          Text(
              (currentStudentCount- totalStudentCount  ).toString(),
              style: textStyle,
            ), 
            if (currentStudentCount - totalStudentCount > 1)

        const SizedBox(width: 4.0),
        Text(ref.read(isApartmentHaveStudentsNotifier.notifier).
        aTextAccordingToCountAndType(apartmentsRes.data?[index] ).keys.first,
            style: textStyle),
                    const SizedBox(width: 4.0),
                    // an Icon, if keys.Seond value > 1 show the Group icon else show the person icon
                    ref.read(isApartmentHaveStudentsNotifier.notifier).
                    aTextAccordingToCountAndType(apartmentsRes.data?[index] ).values.last  > 1
                    ?  Icon(
                       Icons.group,
                      size: 18,
                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    )
                    :

                    Icon(
                       Icons.person,
                      size: 18,
                      color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    ),

      ],
    );
  }
}
