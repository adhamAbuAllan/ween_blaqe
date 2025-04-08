import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/language_switcher_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/logout_menu_widgets/menu_buttons_logout_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/theme_mode_switcher_widget.dart';

import '../../../../../common_widgets/aline_widget.dart';

class ContainerMenuWidget extends ConsumerStatefulWidget {
  const ContainerMenuWidget(
      {super.key, this.onChange, required this.isLogined});

  final Function(bool)? onChange;
  final bool isLogined;

  @override
  ConsumerState createState() => _ContainerLogoutWidgetState();
}

class _ContainerLogoutWidgetState extends ConsumerState<ContainerMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        children: [
          ThemeModeSwitcherWidget(
            onChange: widget.onChange,
          ),
          MenuButtonsWidgets(
            isLogined: widget.isLogined,
          ),
        ],
      ),
    );
  }
}
