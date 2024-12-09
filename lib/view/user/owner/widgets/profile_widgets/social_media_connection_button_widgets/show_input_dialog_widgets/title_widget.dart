import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../constants/nums.dart';

class TitleShowDialogWidget extends ConsumerWidget {
  const TitleShowDialogWidget( {super.key,required this.socialName});

  final String socialName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      socialName,
      style: TextStyle(
        color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
        fontSize: 18,
      ),
    ) ;
  }
}
