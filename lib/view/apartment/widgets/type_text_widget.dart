import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../api/apartments_api/apartments.dart';

class TypeTextWidget extends ConsumerWidget {
  const TypeTextWidget({super.key,required this.apartmentsRes,required this
      .index});
final Apartments apartmentsRes;

  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        " سكن ${apartmentsRes.data?[index].type?.name ?? ""}",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color:
                ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
      ),
    );
  }
}
