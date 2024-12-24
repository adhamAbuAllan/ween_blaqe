import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../session/new_session.dart';
import 'widgets/menu_widgets/logout_button_widget.dart';
import 'widgets/menu_widgets/logout_menu_widgets/container_logout_widget.dart';
import 'widgets/menu_widgets/logout_menu_widgets/text_button_reg_widget.dart';
import 'widgets/menu_widgets/logout_menu_widgets/title_logout_widget.dart';
import 'widgets/menu_widgets/version_app_text_widget.dart';

class MenuUi extends ConsumerStatefulWidget {
  const MenuUi({super.key,this.onChange});
final Function(bool) ?onChange;
  @override
  ConsumerState createState() => _MenuUiState();
}

class _MenuUiState extends ConsumerState<MenuUi> {
  @override
  Widget build(BuildContext context) {
    return NewSession.get("logged", "") == ""
          ?  MenuLogout(onChange: widget.onChange)
        : const MenuLogin();
  }
}

class MenuLogout extends ConsumerStatefulWidget {
  const MenuLogout({super.key,this.onChange});
  final Function(bool) ?onChange;

  @override
  ConsumerState createState() => _MenuLogoutState();
}

class _MenuLogoutState extends ConsumerState<MenuLogout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TitleLogoutWidget(),
          ContainerLogoutWidget(onChange: widget.onChange,),
          const ButtonLogoutWidget(),
          const TextButtonRegWidget(),
          const VersionAppTextWidget()
        ],
      ),
    );
  }
}


class MenuLogin extends ConsumerWidget {
  const MenuLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
