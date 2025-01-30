import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../../../constants/coordination.dart';
import '../../../../../../../constants/get_it_controller.dart';


class TitleShowDialogWidget extends ConsumerWidget {
  const TitleShowDialogWidget( {super.key,required this.socialName});

  final String socialName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      socialName,
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
      ),
    ) ;
  }
}
