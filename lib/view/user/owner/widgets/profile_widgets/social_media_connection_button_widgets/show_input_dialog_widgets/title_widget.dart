import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';


class TitleShowDialogWidget extends ConsumerWidget {
  const TitleShowDialogWidget( {super.key,required this.socialName});

  final String socialName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      socialName,
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        fontSize: 18,
      ),
    ) ;
  }
}
