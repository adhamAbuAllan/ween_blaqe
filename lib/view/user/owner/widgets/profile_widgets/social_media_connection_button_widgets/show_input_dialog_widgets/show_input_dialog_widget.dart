import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets'
    '/social_media_connection_button_widgets/show_input_dialog_widgets/title_widget.dart';

import 'actions_widgets.dart';
import 'content_widget.dart';

class ShowInputDialogWidget extends ConsumerStatefulWidget {
  const ShowInputDialogWidget(
      {super.key,
      required this.socialName,
      required this.labelUserName,
      required this.ref,
      required this.controller,
      this.onPressedOutlinedButton,
      this.check,
      this.onPressed,
      this.onChanged});

  final String socialName;
  final String labelUserName;

  final WidgetRef ref;
  final TextEditingController controller;
  final void Function()? check;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final void Function()? onPressedOutlinedButton;

  @override
  ConsumerState createState() => _ShowInputDialogState();
}

class _ShowInputDialogState extends ConsumerState<ShowInputDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          strokeAlign: 0,
          width: 0.5,
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      title: FadeInOnVisible(child: TitleShowDialogWidget(socialName: widget.socialName)),
      content: ShowDialogContentWidgets(
        labelUserName: widget.labelUserName,
        controller: widget.controller,
        onChanged: widget.onChanged,
        check: widget.check,
      ),
      actions: <Widget>[
        FadeInOnVisible(
            delay: const Duration(milliseconds: 600),
            child: ShowDialogElevatedButtonWidget(onPressed: widget.onPressed)),
        FadeInOnVisible(
          delay: const Duration(milliseconds: 700),
          child: ShowDialogOutlineButtonWidget(onPressed: widget
              .onPressedOutlinedButton,),
        )
      ],
    );
  }
}
