
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
class ApartmentTitleTextWidget extends ConsumerWidget {
  final Apartments apartmentsRes;
  final int index;
  const ApartmentTitleTextWidget({super.key,required this.index, required
  this.apartmentsRes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [SizedBox(
        width: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(apartmentsRes.data?[index].title ?? "",
              softWrap: true,
              style: TextStyle(
                color:
                ref.read(themeModeNotifier.notifier).textTheme(ref: ref)
                ,
                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                fontWeight: FontWeight.w600,
              )),
        ),
      )],
    ) ;
  }
}
