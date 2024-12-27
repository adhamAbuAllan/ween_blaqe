import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../api/apartments_api/apartments.dart';

class TimeAgoTextWidget extends ConsumerWidget {
  const TimeAgoTextWidget({super.key,required this.apartmentsRes,required this
      .index});
  final Apartments apartmentsRes;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "${apartmentsRes.data?[index].timeAgo ?? "التاريخ"} ",
            style: TextStyle(
              color: ref.read(themeModeNotifier.notifier).isLightMode ?
              Colors.black45
                  :
                  Colors.white54
              ,
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
