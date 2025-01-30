import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/core/widgets/buttons/lines_buttons/line_buttons.dart';

class ButtonStartSebhaWidget extends ConsumerStatefulWidget {
  const ButtonStartSebhaWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ButtonStartSebhaWidgetState();
}

class _ButtonStartSebhaWidgetState
    extends ConsumerState<ButtonStartSebhaWidget> {
  @override
  Widget build(BuildContext context) {
    bool isContExpanding = ref.watch(isContExpandingProvider.notifier).state;
    return AnimatedAlign(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
      alignment: Alignment.bottomCenter,
      child: buttonHaveTitleAndIcon(
        () {
          //should in notifier
          ref.watch(noInternetNotfierProvider.notifier).onStartSebha(ref: ref);
        },
        SetLocalization.of(context)!.getTranslateValue("start_tasbih"),
        image: Image.asset("assets/images/tasbih.png",
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            width: 35,
            height: isContExpanding ? 0 : 35),
        isIcon: false,
      ),
    );
  }
}
