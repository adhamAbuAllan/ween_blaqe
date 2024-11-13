import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../utils/styles/button.dart';

class RegisterButtonWidget extends StatefulWidget {
  const     RegisterButtonWidget({super.key, this.onPressed});
  final VoidCallback? onPressed ;
  @override
  State<RegisterButtonWidget> createState() => _RegisterButtonWidgetState();
}

class _RegisterButtonWidgetState extends State<RegisterButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context) ? 55 / 1.2 : 55,
        child: Obx(() {


          return ElevatedButton(
              onPressed: widget.onPressed,
              style: fullButton(),
              child: userModelController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(SetLocalization.of(context)!
                      .getTranslateValue("create_account")));
        }),
      ),
    );
  }
}
