import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/view/common_widgets/aline_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/animated_size_widgets.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/button_start_sebha_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/buttons_of_sebha_widgets.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/container_of_sebha_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/container_text_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/total_text_widgets/total_text_widget.dart';

class ContainerAnimatedWidget extends ConsumerStatefulWidget {
  const ContainerAnimatedWidget({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContainerAnimatedWidgetState();
}

class _ContainerAnimatedWidgetState
    extends ConsumerState<ContainerAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    bool isWantToSebha = ref.watch(noInternetNotfierProvider).isWantToSepha;
    bool isContExpanding = ref.watch(noInternetNotfierProvider).isContExpanding;
    bool isConnected = ref.watch(connectivityNotifier.notifier).isConnected;

    return AnimatedAlign(
      alignment: isWantToSebha ? Alignment.center : Alignment.topCenter,
      duration: const Duration(milliseconds: 800),
      child: AnimatedContainer(
        margin: marginAnimatedContainer(context),
        width: widthAnimatedContainer(context),
        height: heightAnimatedContainer(isWantToSebha, context),
        onEnd: () {
        setState(() {

        });
          ref.read(noInternetNotfierProvider.notifier).onStopSebha();
        },
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: boxDecoratoinAnimatedContainer(),
        duration: const Duration(milliseconds: 800),
        child: Column(
          children: [
            isConnected ? sizedBoxWidget(context) : const CounterTextWidget(),
            isConnected ? const SizedBox() : aline,
            isWantToSebha ? const AnimatedSizeWidget1000() : const SizedBox(),
            isContExpanding
                ? const AnimatedSize2900Widget()
                : const TotalTextWidget(),
            isWantToSebha
                ? (!isContExpanding
                    ? const ContainerOfSebhaWidget()
                    : const SizedBox())
                : isConnected
                    ? aline
                    : const SizedBox(),
            isWantToSebha ? const AnimatedSizeWidget() : const SizedBox(),
            isWantToSebha
                ? (!isContExpanding
                    ? const ButtonsOfSebhaWidgets()
                    : const SizedBox())
                : (isContExpanding
                    ? const AnimatedSize(duration: Duration(seconds: 1))
                    : const ButtonStartSebhaWidget())
          ],
        ),
      ),
    );
  }

  double widthAnimatedContainer(BuildContext context) =>
      getIt<AppDimension>().isSmallScreen(context) ? 373 / 1.2 : 373;

  SizedBox sizedBoxWidget(BuildContext context) {
    return SizedBox(
      height: getIt<AppDimension>().isSmallScreen(context) ? 10 : 10 * 3,
    );
  }

  BoxDecoration boxDecoratoinAnimatedContainer() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
    );
  }

  double heightAnimatedContainer(bool isWantToSepha, BuildContext context) {
    return isWantToSepha
        ? (getIt<AppDimension>().isSmallScreen(context) ? 500 / 1.55 : 500)
        : (ref.read(connectivityNotifier.notifier).isConnected ? 170 : 170);
  }

  EdgeInsets marginAnimatedContainer(BuildContext context) {
    return EdgeInsets.fromLTRB(
        0, getIt<AppDimension>().isSmallScreen(context) ? 50 : 100, 0, 0);
  }
}
