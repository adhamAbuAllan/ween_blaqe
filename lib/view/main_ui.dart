import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/apartment/home_ui.dart';
import 'package:ween_blaqe/view/common_widgets/connectivity_listen_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/floating_action_button_widget.dart';
import 'package:ween_blaqe/view/user/menu_ui.dart';
import 'package:ween_blaqe/view/user/studnet/orders_of_student_ui.dart';
import '../controller/provider_controllers/providers/auth_provider.dart';
import '../controller/provider_controllers/providers/color_provider.dart';
import '../core/utils/funcations/route_pages/push_routes.dart';
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
    final themeMode = ref.watch(themeModeNotifier.notifier);

    return ConnectivityListenWidget(
      child: ColorfulSafeArea(
        color: themeMode.primaryTheme(ref: ref),
        child: Scaffold(
          backgroundColor: themeMode.backgroundAppTheme(ref: ref),
        
          body: IndexedStack(
            index: index,
            children: [
              HomeUi(scrollController: _scrollController),
              const OrdersOfStudentUi(),
              MenuUi(
                onChange: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      setState(() {
                        themeMode.toggleThemeMode(value);
        
                      });
                  });
                  myPushNameAnimation(context);
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            scrollController: _scrollController,
          ),
          floatingActionButton: const FloatingActionButtonWidget(),
        ),
      ),
    );
  }
}
