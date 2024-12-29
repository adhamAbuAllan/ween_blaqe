import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/login_menu_widgets/profile_container_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/login_menu_widgets/title_login_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/login_menu_widgets/logout_button_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/menu_widgets/logout_menu_widgets/login_button_widget.dart';

import '../../session/new_session.dart';
import 'owner/widgets/menu_widgets/logout_menu_widgets/container_logout_widget.dart';
import 'owner/widgets/menu_widgets/logout_menu_widgets/text_button_reg_widget.dart';
import 'owner/widgets/menu_widgets/logout_menu_widgets/title_logout_widget.dart';
import 'owner/widgets/menu_widgets/version_app_text_widget.dart';

class MenuUi extends ConsumerStatefulWidget {
  const MenuUi({super.key, this.onChange});

  final Function(bool)? onChange;

  @override
  ConsumerState createState() => _MenuUiState();
}

class _MenuUiState extends ConsumerState<MenuUi> {
  @override
  Widget build(BuildContext context) {
    return NewSession.get("logged", "") == ""
        ? MenuLogout(
            onChange: widget.onChange,
          )
        :  MenuLogin(onChange: widget.onChange,);
  }
}
//when user not login menu
class MenuLogout extends ConsumerStatefulWidget {
  const MenuLogout({
    super.key,
    this.onChange,
  });

  final Function(bool)? onChange;

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
          ContainerMenuWidget(
            onChange: widget.onChange,
            isLogined: false,
          ),
          const LoginButtonWidget(),
          const TextButtonRegWidget(),

          const VersionAppTextWidget()
        ],
      ),
    );
  }
}
//when user login menu
class MenuLogin extends ConsumerWidget {
  const MenuLogin({super.key, this.onChange});
  final Function(bool)? onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TitleLoginWidget(),
          const ContainerOfProfileWidget(),
          ContainerMenuWidget(
            onChange: onChange,
            isLogined: true,

          ),
          const LogoutButtonWidget(),
          const VersionAppTextWidget()
        ],
      ),
    );
  }
}
