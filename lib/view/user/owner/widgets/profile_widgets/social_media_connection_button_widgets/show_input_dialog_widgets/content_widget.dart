import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../../../constants/coordination.dart';
import '../../../../../../../constants/get_it_controller.dart';
import '../../../../../../../constants/localization.dart';

class ShowDialogContentWidgets extends ConsumerWidget {
  const ShowDialogContentWidgets(

      {super.key,required this.labelUserName, required this.controller,  this
          .onChanged  ,this.check,});

  final String labelUserName;
  final TextEditingController controller;
  final void Function(String) ? onChanged;
  final void Function() ? check;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: labelUserName,
              labelStyle: TextStyle(
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
              ),
            ),
            // initialValue:  socialName,
            controller: controller,
            onChanged: onChanged,

            style: TextStyle(
              color:
                  ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
            ),
          ),
          // check != null
          //     ? TextButton(
          //         onPressed: check,
          //         child: Text(
          //           //verify
          //           SetLocalization.of(context)!.getTranslateValue("verify"),
          //           style: TextStyle(
          //             color: Colors.blue,
          //             fontSize: getIt<AppDimension>().isSmallScreen(context)
          //                 ? 14
          //                 : 16,
          //           ),
          //         ))
          //     : const SizedBox()
        ],
      ),
    );
  }
}
