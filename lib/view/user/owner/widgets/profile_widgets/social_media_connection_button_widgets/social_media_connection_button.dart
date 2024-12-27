import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/outline_button_widget.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';


import 'show_input_dialog_widgets/show_input_dialog_widget.dart';

class SocialMediaConnectionButton extends ConsumerStatefulWidget {
  const SocialMediaConnectionButton({
    super.key,
    required this.socialName,
    required this.socialIcon,
    required this.socialDialogName,
    required this.labelUserName,
    required this.controller,
    this.onPressedOutlinedButton,
    this.onPressed,
    this.onChanged,
    this.borderColor,
    this.contentColor,
    this.check,
    this.fontWeight,
  });

  final String socialName;

  final IconData socialIcon;
  final String socialDialogName;
  final String labelUserName;
  final Color? borderColor;
  final Color? contentColor;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? check;
  final FontWeight? fontWeight;
  final void Function()? onPressed;
  final void Function()? onPressedOutlinedButton;

  @override
  ConsumerState createState() => _SocialMediaConnectionButtonConsumerState();
}

class _SocialMediaConnectionButtonConsumerState
    extends ConsumerState<SocialMediaConnectionButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButtonWidget(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return ShowInputDialogWidget(
              onPressed: widget.onPressed,
              ref: ref,
              onChanged: widget.onChanged,
              controller: widget.controller,
              labelUserName: widget.labelUserName,
              socialName: widget.socialName,
              check: widget.check,
              onPressedOutlinedButton: widget.onPressedOutlinedButton,
            );
          },
        );
      },
      overlayColor: Colors.transparent,
      borderSide: BorderSide(
          color: widget.borderColor ??
              (ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Wrap(
          // Use Wrap instead of Row
          children: [
            SocialIconWidget(
              socialIcon: widget.socialIcon,
              colorOfIcon: widget.contentColor,
            ),
            SocialMediaNameWidget(
              socialName: widget.socialDialogName,
              colorOfText: widget.contentColor,
              fontWeightOfText: widget.fontWeight,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIconWidget extends ConsumerWidget {
  const SocialIconWidget(
      {super.key, required this.socialIcon, this.colorOfIcon});

  final IconData socialIcon;
  final Color? colorOfIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FaIcon(
        socialIcon,
        color: colorOfIcon ??
            (ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
        size: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
      ),
    );
  }
}

class SocialMediaNameWidget extends ConsumerWidget {
  const SocialMediaNameWidget(
      {super.key,
      required this.socialName,
      this.colorOfText,
      this.fontWeightOfText});

  final String socialName;
  final Color? colorOfText;
  final FontWeight? fontWeightOfText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        socialName, // Use soicalName property
        style: TextStyle(
          color: colorOfText ??
              (ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          fontWeight: fontWeightOfText ?? FontWeight.w500,
        ),
      ),
    );
  }
}
