import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ween_blaqe/testing_code/find_the_fastest_way_in_state_managment/riverpod/login_and_register_section/login_controller_test.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
// import '../../../../constants/strings.dart';
import '../../../../controller/provider_controllers/methods/hybrid_methods/validator_and_login.dart';
import '../../../../core/utils/styles/button.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class ButtonLoginCompletedWidget extends ConsumerWidget {
  const ButtonLoginCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20,
          getIt<AppDimension>().isSmallScreen(context) ? 50 / 1.5 : 50, 20, 10),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
        child: ElevatedButton(
            style: fullButton(),
            onPressed: () async{

              validateAndLogin(ref, context);


            },
            child: ref.watch(loginNotifier).isLoading == false
                ? Text(SetLocalization.of(context)!.getTranslateValue("login"))
                : const CircularProgressIndicator(
                    color: Colors.white,
                  )),
      ),
    );
  }
}
