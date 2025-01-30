import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/button_list_tile_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../common_widgets/aline_widget.dart';

class SystemPayingUi extends ConsumerWidget {
  const SystemPayingUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBar(
          title: Text(
            SetLocalization.of(context)!.getTranslateValue("payment"),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .containerTheme(ref: ref),
                  ),
                  child: Column(
                    //cancel
                    children: [
                      ButtonListTileWidget(
                          onTap: () {
                            myPushName(
                                context, MyPagesRoutes.whatIsSystemPayingAllow);
                          },
                          title: SetLocalization.of(context)!
                              .getTranslateValue("accepted_payment_methods")),
                      aline,
                      ButtonListTileWidget(
                          onTap: () {
                            myPushName(
                                context, MyPagesRoutes.couldIPayByDeposit);
                          },
                          title: SetLocalization.of(context)!
                              .getTranslateValue("can_i_pay_deposit"))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

//this class have buttons that go to paragraphs

//what_is_system_paying_allow?
class WhatIsSystemPayingAllowUi extends ConsumerWidget {
  const WhatIsSystemPayingAllowUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title of what is system paying is allowed
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("accepted_payment_methods"),
                style: TextStyle(
                  fontSize: 20.0,
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w600,
                  inherit: false,
                ),
                softWrap: true,
              ),
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("payment_by_agreement"),
                style: TextStyle(
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)
                      .withOpacity(.8),
                  fontWeight: FontWeight.w500,
                  inherit: true,
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
            //   child: Text(
            //     "سيتم العمل على إجاد طرق اخرى للدفع مثل"
            //     " البطاقات الإتمانية و غيرها من الطرق مسقبلاً بإذن الله",
            //     style: TextStyle(
            //         fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
            //
            //         inherit: true,
            //         color: themeMode.isLight
            //             ? kTextColorLightMode
            //             : kTextColorDarkMode.withOpacity(.7)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CouldIPayByDepositUi extends ConsumerWidget {
  const CouldIPayByDepositUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title of what is system paying is allowed
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("can_i_pay_deposit"),
                style: TextStyle(
                  fontSize: 20.0,
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontWeight: FontWeight.w600,
                  inherit: true,
                ),
                softWrap: true,
              ),
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("deposit_payment_agreement"),
                style: TextStyle(
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref)
                      .withOpacity(.8),
                  fontWeight: FontWeight.w500,
                  inherit: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//could pay deposit?
