import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../constants/coordination.dart';
import '../../../../../../../constants/get_it_controller.dart';
import '../../../../../../../constants/localization.dart';
import '../../../../../../../core/utils/styles/button.dart';
import '../../../../../../../controller/provider_controllers/providers/auth_provider.dart';

class ShowDialogElevatedButtonWidget extends ConsumerWidget {
  const ShowDialogElevatedButtonWidget({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: fullButton(),
        child: ref
            .watch(socialConnectionDataUpdaterNotifier)
            .isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : Text(
          SetLocalization.of(context)!.getTranslateValue("save"),
          style: const TextStyle(),
        ),
      ),
    );
  }
}

class ShowDialogOutlineButtonWidget extends ConsumerWidget {
  const ShowDialogOutlineButtonWidget({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlinedButton(context: context),
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("cancel"),
          style: TextStyle(
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          ),
        ),
      ),
    );
  }
}
