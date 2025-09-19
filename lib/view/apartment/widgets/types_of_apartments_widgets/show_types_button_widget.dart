import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../common_widgets/button_widgets/outline_button_widget.dart';

// Assuming ChangeThemeMode is a provider that holds theme data

class ShowTypesButtonWidget extends ConsumerStatefulWidget {
  final void Function()? onPressed;
  final String? text;

  const ShowTypesButtonWidget({super.key, this.onPressed, this.text});

  @override
  ConsumerState<ShowTypesButtonWidget> createState() => _ShowTypesButtonWidgetState();
}

class _ShowTypesButtonWidgetState extends ConsumerState<ShowTypesButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the theme mode from Riverpod state
    var isBoxVisible = ref.watch(isSebhaVisibleNotifier);
    return SizedBox(
      child: isBoxVisible
          ? FadeInOnVisible(
              direction: SlideDirection.right,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 102),
                child: Opacity(
                  opacity: 1,
                  child: BtnShowTypesOfApartments(
                    onPressed: widget.onPressed,
                    text: widget.text,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class BtnShowTypesOfApartments extends ConsumerWidget {
  const BtnShowTypesOfApartments({
    super.key,
    required this.onPressed,
    this.text,
  });

  final void Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButtonWidget(
      isFloatingOutlinedButton: true,
      onPressed: onPressed ??
          () {
            ref.watch(isListOfTypesNotifier.notifier).state =
                !ref.watch(isListOfTypesNotifier);
          },
      child: Text(
        text?.isNotEmpty ?? false
            ? text!
            : SetLocalization.of(context)!
                .getTranslateValue("housing_type_btn"),
      ),
    );
  }
}
