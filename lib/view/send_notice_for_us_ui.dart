// import 'dart:html';

import 'package:colorful_safe_area/colorful_safe_area.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/back_button_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';
import '../constants/get_it_controller.dart';
import '../constants/localization.dart';
import '../controller/provider_controllers/providers/auth_provider.dart';
import '../controller/provider_controllers/providers/color_provider.dart';
import 'common_widgets/containers_widgets/container_field_widget.dart';

class SendNoticeForUsUi extends ConsumerStatefulWidget {
  const SendNoticeForUsUi({super.key});

  @override
  ConsumerState createState() => _SendNoticeForUsUiState();
}

class _SendNoticeForUsUiState extends ConsumerState<SendNoticeForUsUi> {
  @override
  Widget build(BuildContext context) {
    String sendNoticeForUsValue =
        ref.read(sendNoticeForUcController.notifier).state.text;
    return ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: ref
                .read(themeModeNotifier.notifier)
                .backgroundAppTheme(ref: ref),

            // Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor:
                  ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
              actions: [
                Opacity(
                  opacity:
                      !ref.read(themeModeNotifier.notifier).isLightMode ? 0 : 1,
                  child: const Padding(
                      padding: EdgeInsets.only(
                        right: 6,
                        top: 1,
                      ),
                      child: BackButtonWidget()),
                ),
                const Expanded(child: Text("")),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
                      horizontal: getIt<AppDimension>().isSmallScreen(context)
                          ? 10
                          : 8),
                  child: ElevatedButtonWidget(
                    context: context,
                    onPressed: () {
                      if (connectivityController.isConnection()) {
                        if (sendNoticeForUsValue == "" ||
                            sendNoticeForUsValue.length < 35) {
                          showSnakBar(
                              context,
                              SetLocalization.of(context)!
                                  .getTranslateValue("min_chars_warning"));

                          // toast("يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");
                        } else {
                          // toast(messageOfToast);
                          ref
                              .read(sendNoticeForUsNotifier.notifier)
                              .sendNotice(sendNoticeForUsValue);

                          showSnakBar(
                              context,
                              SetLocalization.of(context)!.getTranslateValue(
                                  "feedback_acknowledgement"));
                        }
                      } else {
                        showSnakBar(
                            context,
                            SetLocalization.of(context)!
                                .getTranslateValue("no_internet"));
                        return;
                      }
                      // Get.to(ApartmentsOfOwnerAfterAdd());
                    },
                    child: Text(SetLocalization.of(context)!
                        .getTranslateValue("submit")),
                  ),
                ),
              ],
            ),

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 100
                        : 250,
                  ),
                  ContainerFieldWidget(
                    title: SetLocalization.of(context)!
                        .getTranslateValue("feedback"),
                    helperText: SetLocalization.of(context)!
                        .getTranslateValue("min_chars_warning"),

                    hintInput: SetLocalization.of(context)!
                        .getTranslateValue("add_your_feedback_here"),
                    maxLines: 8,
                    maxLength: 255,

                    // hintMaxLines: 10,
                    inputType: TextInputType.text,
                    controller: ref.read(sendNoticeForUcController),
                    // focusNode: discrptionFocusedNode
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
