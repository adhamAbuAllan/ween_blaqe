import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/apartment/home_ui.dart';
import 'package:ween_blaqe/view/common_widgets/connectivity_listen_widget.dart';
import 'package:ween_blaqe/view/common_widgets/floating_action_button_widget'
    '.dart';
import 'package:ween_blaqe/view/user/owner/account_of_owner.dart';
import 'package:ween_blaqe/view/user/studnet/orders_of_student.dart';
import 'package:ween_blaqe/view/widgets_before_user_reg/account_before_login'
    '.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../session/new_session.dart';
import '../controller/provider_controllers/providers/auth_provider.dart';
import 'common_widgets/bottom_navigation_bar_widget.dart';
class MainUi extends ConsumerStatefulWidget {
  const MainUi({super.key});

  @override
  ConsumerState<MainUi> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainUi> {


  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(btmNavBarIndexNotifier);

    return ConnectivityListenWidget(
      child: Scaffold(

        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: IndexedStack(
          index: index,
          children: [
            HomeUi(scrollController: _scrollController),
            const OrdersOfStudent(),
            NewSession.get("logged", "") == ""
                ? const AccountBeforeLoginInStudent()
                : const AccountOfOwner(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          scrollController: _scrollController,
        ),
        floatingActionButton: const FloatingActionButtonWidget(),
      ),
    );
  }

}
