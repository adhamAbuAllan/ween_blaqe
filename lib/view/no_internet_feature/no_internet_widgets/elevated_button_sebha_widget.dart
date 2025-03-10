import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_ui.dart';

class ElevatedButtonSebhaWidget extends ConsumerStatefulWidget {
  const ElevatedButtonSebhaWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ElevatedButtonSebhaWidgetState();
}

class _ElevatedButtonSebhaWidgetState
    extends ConsumerState<ElevatedButtonSebhaWidget> {
  @override
  Widget build(BuildContext context) {
    int onLongPressCounter =
        ref.watch(onLongPressCounterProvider.notifier).state;
    int index = ref.watch(indexProvider.notifier).state;
    List<String> sephaText = ref.watch(sephaTextProvider.notifier).state;
    return ElevatedButtonWidget(
        onLongPress: () {
          setState(() {
            ref
                .read(noInternetNotfierProvider.notifier)
                .onLongPressSebha(ref: ref);
          });
        },
        onPressed: () {
          setState(() {
            ref.watch(noInternetNotfierProvider.notifier).onPressSebha(
                  ref: ref,
                  index: index,
                  onLongPressCounter: onLongPressCounter,
                  sephaText: sephaText,
                );
          });
        },
        context: context,
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("tasbih"),
          style: TextStyle(color: Colors.white.withValues(alpha: .95)),
        ));
  }
}
