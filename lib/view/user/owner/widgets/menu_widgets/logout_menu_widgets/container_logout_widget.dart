import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/language_switcher_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/logout_menu_widgets/menu_buttons_logout_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/theme_mode_switcher_widget.dart';

import '../../../../../../core/utils/styles/text_style/aline_style.dart';

class ContainerLogoutWidget extends ConsumerStatefulWidget {
  const ContainerLogoutWidget({super.key,this.onChange});
final Function(bool) ?onChange;
  @override
  ConsumerState createState() => _ContainerLogoutWidgetState();
}

class _ContainerLogoutWidgetState extends ConsumerState<ContainerLogoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        children: [
           ThemeModeSwitcherWidget(onChange: widget.onChange,),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: aline,
          ),
          const LanguageSwitcherWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: aline,
          ),
          const MenuButtonsLogoutWidgets(),

        ],
      ),
    );
  }
}

