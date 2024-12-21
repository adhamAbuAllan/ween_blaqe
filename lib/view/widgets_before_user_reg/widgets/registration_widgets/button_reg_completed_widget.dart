import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/hybrid_methods/auth_validator/login_and_reg_validators/validator_and_registratoin.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../core/utils/styles/button.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class ButtonRegCompletedWidget extends ConsumerWidget {
  const   ButtonRegCompletedWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
        child: ElevatedButton(
            onPressed: () async{

              validateAndRegistration(ref, context);

            },
            style: fullButton(),
            child: ref.watch(registerNotifier).isLoading == false
                ? Text(SetLocalization.of(context)!.getTranslateValue
              ("create_account"))
                : const CircularProgressIndicator(
              color: Colors.white,
            )),
      ),
    );
  }
}
